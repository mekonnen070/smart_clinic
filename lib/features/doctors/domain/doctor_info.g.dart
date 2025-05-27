// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DoctorInfo _$DoctorInfoFromJson(Map<String, dynamic> json) => _DoctorInfo(
  doctorSpecificId: json['id'] as String,
  name: json['name'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String,
  specialization: json['specialization'] as String,
);

Map<String, dynamic> _$DoctorInfoToJson(_DoctorInfo instance) =>
    <String, dynamic>{
      'id': instance.doctorSpecificId,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'specialization': instance.specialization,
    };
