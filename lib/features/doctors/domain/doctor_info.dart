import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor_info.freezed.dart';
part 'doctor_info.g.dart';

@freezed
abstract class DoctorInfo with _$DoctorInfo {
  const factory DoctorInfo({
    @JsonKey(name: 'id') required String doctorSpecificId,
    required String name,
    required String email,
    required String phone,
    required String specialization,
    // String? department, // Available in patientServices.js getAppointments response
  }) = _DoctorInfo;

  factory DoctorInfo.fromJson(Map<String, dynamic> json) => _$DoctorInfoFromJson(json);
}