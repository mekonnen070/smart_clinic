import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_clinic/features/appointments/application/states/appointment_state.dart';
import 'package:smart_clinic/features/appointments/data/appointment_repository.dart';

final appointmentNotifierProvider =
    StateNotifierProvider<AppointmentNotifier, AppointmentState>((ref) {
      final appointmentRepository = ref.watch(appointmentRepositoryProvider);
      return AppointmentNotifier(appointmentRepository);
    });

class AppointmentNotifier extends StateNotifier<AppointmentState> {
  final AppointmentRepository _appointmentRepository;

  AppointmentNotifier(this._appointmentRepository)
    : super(const AppointmentState.initial());

  Future<void> fetchAppointments() async {
    state = const AppointmentState.loading();
    try {
      final appointments =
          await _appointmentRepository.getPatientAppointments();
      state = AppointmentState.loaded(appointments: appointments);
    } catch (e) {
      state = AppointmentState.error(message: e.toString());
    }
  }

  Future<void> bookAppointment({
    required String doctorId,
    required String slotId,
    required String reason,
    List<String>? symptoms,
  }) async {
    // final previousState = state; // Keep track if complex rollback is needed on error
    state = const AppointmentState.booking();
    try {
      final newAppointment = await _appointmentRepository.bookAppointment(
        doctorId: doctorId,
        slotId: slotId,
        reason: reason,
        symptoms: symptoms,
      );

      // *** THIS IS THE KEY CHANGE ***
      // Emit the success state so the UI (BookAppointmentScreen) can react
      state = AppointmentState.bookingSuccess(newAppointment: newAppointment);

      // After signaling success (and allowing UI to react, e.g., navigate),
      // then refresh the main appointment list.
      // The HomeScreen will pick up the Loading -> Loaded states from this.
      await fetchAppointments();
    } catch (e, st) {
      log('$e $st');
      state = AppointmentState.bookingError(message: e.toString());
      // if (previousState != null) { // Example of reverting state on error
      //   state = previousState;
      // }
    }
  }
}
