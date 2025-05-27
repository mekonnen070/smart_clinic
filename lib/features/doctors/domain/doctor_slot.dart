import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor_slot.freezed.dart';
part 'doctor_slot.g.dart';

@freezed
abstract class DoctorSlot with _$DoctorSlot {
  const factory DoctorSlot({
    required String id,
    required String day,
    @JsonKey(name: 'time') required String slotTime,
    required bool isBooked,
  }) = _DoctorSlot;

  factory DoctorSlot.fromJson(Map<String, dynamic> json) => _$DoctorSlotFromJson(json);
}