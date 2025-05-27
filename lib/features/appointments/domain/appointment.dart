import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_clinic/features/doctors/domain/doctor_info.dart';

part 'appointment.freezed.dart';

@freezed
abstract class Appointment with _$Appointment {
  const factory Appointment({
    required String id,
    required DateTime dateTime,
    required String status,
    required String reason,
    required DoctorInfo doctor,
  }) = _Appointment;

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['id'] as String,
      dateTime: DateTime.parse(json['dateTime'] as String),
      status: json['status'] as String,
      reason: json['reason'] as String,
      doctor: DoctorInfo.fromJson(json['doctor'] as Map<String, dynamic>),
    );
  }
}
