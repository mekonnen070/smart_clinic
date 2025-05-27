import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_clinic/features/doctors/domain/doctor.dart';

part 'doctor_state.freezed.dart';

@freezed
sealed class DoctorState with _$DoctorState {
  const factory DoctorState.initial() = DoctorInitial;
  const factory DoctorState.loading() = DoctorLoading;
  const factory DoctorState.loaded({required List<Doctor> doctors}) =
      DoctorLoaded;
  const factory DoctorState.error({required String message}) = DoctorError;
}
