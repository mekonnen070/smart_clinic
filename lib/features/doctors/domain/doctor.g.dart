// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Doctor _$DoctorFromJson(Map<String, dynamic> json) => _Doctor(
  userId: json['userId'] as String,
  name: json['name'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String,
  doctorSpecificId: json['doctorId'] as String,
  specialization: json['specialization'] as String,
  slots:
      (json['slots'] as List<dynamic>)
          .map((e) => DoctorSlot.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$DoctorToJson(_Doctor instance) => <String, dynamic>{
  'userId': instance.userId,
  'name': instance.name,
  'email': instance.email,
  'phone': instance.phone,
  'doctorId': instance.doctorSpecificId,
  'specialization': instance.specialization,
  'slots': instance.slots,
};
