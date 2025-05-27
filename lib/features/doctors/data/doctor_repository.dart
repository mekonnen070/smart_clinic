import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_clinic/core/config/app_config.dart';
import 'package:smart_clinic/core/dummy_data.dart';
import 'package:smart_clinic/features/doctors/domain/doctor.dart';

import '../../../../core/services/dio_provider.dart';

// --- Abstract Class (Interface) ---
abstract class DoctorRepository {
  Future<List<Doctor>> getDoctors({String? specialization});
}

// --- Riverpod Provider ---
final doctorRepositoryProvider = Provider<DoctorRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return DoctorRepositoryImpl(dio);
});

class DoctorRepositoryImpl implements DoctorRepository {
  final Dio _dio;

  DoctorRepositoryImpl(this._dio);

  @override
  Future<List<Doctor>> getDoctors({String? specialization}) async {
    if (shouldUseMockData) {
      await Future.delayed(const Duration(milliseconds: 200));
      if (specialization != null && specialization.isNotEmpty) {
        return dummyDoctors
            .where(
              (doc) =>
                  doc.specialization.toLowerCase() ==
                  specialization.toLowerCase(),
            )
            .toList();
      }
      // Return a copy to prevent direct modification of dummyDoctors list if it were mutable.
      // Since dummyDoctors is final List<Doctor> and Doctor is @freezed (immutable), this is fine.
      return List.from(dummyDoctors);
    }
    // --- Real API Call ---
    try {
      String endpoint = '/patient/doctors';
      if (specialization != null && specialization.isNotEmpty) {
        endpoint = '/patient/doctors/$specialization';
      }
      final response = await _dio.get(endpoint);
      final List<dynamic> doctorDataList =
          response.data['doctors'] as List<dynamic>;
      return doctorDataList
          .map((data) => Doctor.fromJson(data as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      final errorMsg =
          e.response?.data?['message']?.toString() ??
          e.message ??
          'Failed to fetch doctors';
      throw Exception(errorMsg);
    } catch (e) {
      throw Exception(
        'An unexpected error occurred while fetching doctors: $e',
      );
    }
  }
}
