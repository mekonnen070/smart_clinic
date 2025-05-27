// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_slot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DoctorSlot _$DoctorSlotFromJson(Map<String, dynamic> json) => _DoctorSlot(
  id: json['id'] as String,
  day: json['day'] as String,
  slotTime: json['time'] as String,
  isBooked: json['isBooked'] as bool,
);

Map<String, dynamic> _$DoctorSlotToJson(_DoctorSlot instance) =>
    <String, dynamic>{
      'id': instance.id,
      'day': instance.day,
      'time': instance.slotTime,
      'isBooked': instance.isBooked,
    };
