import 'package:freezed_annotation/freezed_annotation.dart';
import 'doctor_slot.dart'; // Assuming doctor_slot.dart is in the same directory or path is adjusted

part 'doctor.freezed.dart';
part 'doctor.g.dart';

@freezed
abstract class Doctor with _$Doctor {
  const factory Doctor({
    required String userId, // User.id for this doctor
    required String name,
    required String email,
    required String phone,
    @JsonKey(name: 'doctorId') required String doctorSpecificId, // Doctor.id (PK of Doctor table)
    required String specialization,
    // String? department, // Can be added if consistently available and needed
    required List<DoctorSlot> slots,
  }) = _Doctor;

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);
}