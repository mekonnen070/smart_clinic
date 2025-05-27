import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_clinic/core/config/app_config.dart';
import 'package:smart_clinic/core/dummy_data.dart';
import 'package:smart_clinic/core/services/dio_provider.dart';
import 'package:smart_clinic/features/appointments/domain/appointment.dart';
import 'package:smart_clinic/features/auth/data/auth_repository.dart';
import 'package:smart_clinic/features/doctors/domain/doctor.dart';
import 'package:smart_clinic/features/doctors/domain/doctor_info.dart';
import 'package:smart_clinic/features/doctors/domain/doctor_slot.dart';

// --- Abstract Class (Interface) ---
abstract class AppointmentRepository {
  Future<List<Appointment>> getPatientAppointments();
  Future<Appointment> bookAppointment({
    required String doctorId,
    required String slotId,
    required String reason,
    List<String>? symptoms,
  });
}

// --- Riverpod Provider ---
final appointmentRepositoryProvider = Provider<AppointmentRepository>((ref) {
  final dio = ref.watch(dioProvider);
  final authRepository = ref.watch(authRepositoryProvider);
  return AppointmentRepositoryImpl(dio, authRepository);
});

// In-memory list for dummy appointments to reflect booking immediately for demo
List<Appointment> _inMemoryDummyAppointments = List.from(dummyAppointments);

// In-memory list for dummy doctors if their state (like slot booking) needs to be modified
// by this repository during dummy operations.
// We map to ensure internal lists (like slots) are also new instances if we need to modify them.
// However, Doctor.slots is List<DoctorSlot> and DoctorSlot is @freezed, so copyWith is the way.
List<Doctor> _sessionDummyDoctors =
    dummyDoctors.map((doctor) {
      // Create a new list of slots for each doctor to ensure it's modifiable if needed,
      // or rely on copyWith to handle list replacement.
      return doctor.copyWith(slots: List<DoctorSlot>.from(doctor.slots));
    }).toList();

class AppointmentRepositoryImpl implements AppointmentRepository {
  final Dio _dio;
  final AuthRepository _authRepository;

  AppointmentRepositoryImpl(this._dio, this._authRepository);

  @override
  Future<List<Appointment>> getPatientAppointments() async {
    if (shouldUseMockData) {
      await Future.delayed(const Duration(milliseconds: 300));
      // This now returns our session-local list which might have new dummy appointments
      return List.from(_inMemoryDummyAppointments);
    }
    // --- Real API Call ---
    try {
      final response = await _dio.get('/patient/appointments');
      final List<dynamic> appointmentDataList =
          response.data['appointments'] as List<dynamic>;
      return appointmentDataList
          .map((data) => Appointment.fromJson(data as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      final errorMsg =
          e.response?.data?['message']?.toString() ??
          e.message ??
          'Failed to fetch appointments';
      throw Exception(errorMsg);
    } catch (e) {
      throw Exception(
        'An unexpected error occurred while fetching appointments: $e',
      );
    }
  }

  @override
  Future<Appointment> bookAppointment({
    required String doctorId,
    required String slotId,
    required String reason,
    List<String>? symptoms,
  }) async {
    if (shouldUseMockData) {
      await Future.delayed(const Duration(milliseconds: 300));

      final doctorForInfo = _sessionDummyDoctors.firstWhere(
        (doc) => doc.doctorSpecificId == doctorId,
        // orElse: () => _sessionDummyDoctors.first // Fallback if UI allows invalid selection
      );

      final newAppointment = Appointment(
        id: 'dummy-apt-${DateTime.now().millisecondsSinceEpoch}',
        dateTime: DateTime.now().add(
          Duration(
            days:
                doctorForInfo.slots.firstWhere((s) => s.id == slotId).day ==
                        "MONDAY"
                    ? 2
                    : 3,
            hours: int.parse(
              doctorForInfo.slots
                  .firstWhere((s) => s.id == slotId)
                  .slotTime
                  .split(":")[0],
            ),
          ),
        ), // simplified
        status: 'Confirmed',
        reason: reason,
        doctor: DoctorInfo(
          doctorSpecificId: doctorForInfo.doctorSpecificId,
          name: doctorForInfo.name,
          email: doctorForInfo.email,
          phone: doctorForInfo.phone,
          specialization: doctorForInfo.specialization,
        ),
      );
      _inMemoryDummyAppointments.add(newAppointment);

      // Correctly update the slot's isBooked status in _sessionDummyDoctors
      final doctorIndex = _sessionDummyDoctors.indexWhere(
        (doc) => doc.doctorSpecificId == doctorId,
      );
      if (doctorIndex != -1) {
        final originalDoctor = _sessionDummyDoctors[doctorIndex];
        final slotIndexToUpdate = originalDoctor.slots.indexWhere(
          (s) => s.id == slotId,
        );

        if (slotIndexToUpdate != -1) {
          // 1. Create a new list of slots
          List<DoctorSlot> updatedSlots = List.from(originalDoctor.slots);
          // 2. Update the specific slot in the new list using copyWith
          updatedSlots[slotIndexToUpdate] = updatedSlots[slotIndexToUpdate]
              .copyWith(isBooked: true);
          // 3. Create a new doctor object with the new list of slots using copyWith
          _sessionDummyDoctors[doctorIndex] = originalDoctor.copyWith(
            slots: updatedSlots,
          );

          print(
            "Mock: Slot $slotId for doctor $doctorId in _sessionDummyDoctors marked as booked.",
          );
        }
      }
      return newAppointment;
    }
    // --- Real API Call ---
    // (Your existing real API call logic remains here)
    try {
      final currentUser = await _authRepository.getCurrentUser();
      if (currentUser == null || currentUser.patientSpecificId.isEmpty) {
        throw Exception('User not authenticated or patient ID is missing.');
      }
      final patientId = currentUser.patientSpecificId;
      final response = await _dio.post(
        '/patient/book-appointment',
        data: {
          'patientId': patientId,
          'doctorId': doctorId,
          'slotId': slotId,
          'reason': reason,
          'symptoms': symptoms ?? [],
        },
      );
      final appointmentData =
          response.data['appointment'] as Map<String, dynamic>;
      return Appointment.fromJson(appointmentData);
    } on DioException catch (e) {
      final errorMsg =
          e.response?.data?['message']?.toString() ??
          e.message ??
          'Failed to book appointment';
      throw Exception(errorMsg);
    } catch (e) {
      throw Exception(
        'An unexpected error occurred while booking appointment: $e',
      );
    }
  }
}
