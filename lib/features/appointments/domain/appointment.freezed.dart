// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appointment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Appointment {

 String get id; DateTime get dateTime; String get status; String get reason; DoctorInfo get doctor;
/// Create a copy of Appointment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppointmentCopyWith<Appointment> get copyWith => _$AppointmentCopyWithImpl<Appointment>(this as Appointment, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Appointment&&(identical(other.id, id) || other.id == id)&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.doctor, doctor) || other.doctor == doctor));
}


@override
int get hashCode => Object.hash(runtimeType,id,dateTime,status,reason,doctor);

@override
String toString() {
  return 'Appointment(id: $id, dateTime: $dateTime, status: $status, reason: $reason, doctor: $doctor)';
}


}

/// @nodoc
abstract mixin class $AppointmentCopyWith<$Res>  {
  factory $AppointmentCopyWith(Appointment value, $Res Function(Appointment) _then) = _$AppointmentCopyWithImpl;
@useResult
$Res call({
 String id, DateTime dateTime, String status, String reason, DoctorInfo doctor
});


$DoctorInfoCopyWith<$Res> get doctor;

}
/// @nodoc
class _$AppointmentCopyWithImpl<$Res>
    implements $AppointmentCopyWith<$Res> {
  _$AppointmentCopyWithImpl(this._self, this._then);

  final Appointment _self;
  final $Res Function(Appointment) _then;

/// Create a copy of Appointment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? dateTime = null,Object? status = null,Object? reason = null,Object? doctor = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,dateTime: null == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,doctor: null == doctor ? _self.doctor : doctor // ignore: cast_nullable_to_non_nullable
as DoctorInfo,
  ));
}
/// Create a copy of Appointment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DoctorInfoCopyWith<$Res> get doctor {
  
  return $DoctorInfoCopyWith<$Res>(_self.doctor, (value) {
    return _then(_self.copyWith(doctor: value));
  });
}
}


/// @nodoc


class _Appointment implements Appointment {
  const _Appointment({required this.id, required this.dateTime, required this.status, required this.reason, required this.doctor});
  

@override final  String id;
@override final  DateTime dateTime;
@override final  String status;
@override final  String reason;
@override final  DoctorInfo doctor;

/// Create a copy of Appointment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppointmentCopyWith<_Appointment> get copyWith => __$AppointmentCopyWithImpl<_Appointment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Appointment&&(identical(other.id, id) || other.id == id)&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.doctor, doctor) || other.doctor == doctor));
}


@override
int get hashCode => Object.hash(runtimeType,id,dateTime,status,reason,doctor);

@override
String toString() {
  return 'Appointment(id: $id, dateTime: $dateTime, status: $status, reason: $reason, doctor: $doctor)';
}


}

/// @nodoc
abstract mixin class _$AppointmentCopyWith<$Res> implements $AppointmentCopyWith<$Res> {
  factory _$AppointmentCopyWith(_Appointment value, $Res Function(_Appointment) _then) = __$AppointmentCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime dateTime, String status, String reason, DoctorInfo doctor
});


@override $DoctorInfoCopyWith<$Res> get doctor;

}
/// @nodoc
class __$AppointmentCopyWithImpl<$Res>
    implements _$AppointmentCopyWith<$Res> {
  __$AppointmentCopyWithImpl(this._self, this._then);

  final _Appointment _self;
  final $Res Function(_Appointment) _then;

/// Create a copy of Appointment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? dateTime = null,Object? status = null,Object? reason = null,Object? doctor = null,}) {
  return _then(_Appointment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,dateTime: null == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,doctor: null == doctor ? _self.doctor : doctor // ignore: cast_nullable_to_non_nullable
as DoctorInfo,
  ));
}

/// Create a copy of Appointment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DoctorInfoCopyWith<$Res> get doctor {
  
  return $DoctorInfoCopyWith<$Res>(_self.doctor, (value) {
    return _then(_self.copyWith(doctor: value));
  });
}
}

// dart format on
