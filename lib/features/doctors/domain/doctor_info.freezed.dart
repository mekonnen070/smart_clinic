// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doctor_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DoctorInfo {

@JsonKey(name: 'id') String get doctorSpecificId; String get name; String get email; String get phone; String get specialization;
/// Create a copy of DoctorInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorInfoCopyWith<DoctorInfo> get copyWith => _$DoctorInfoCopyWithImpl<DoctorInfo>(this as DoctorInfo, _$identity);

  /// Serializes this DoctorInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorInfo&&(identical(other.doctorSpecificId, doctorSpecificId) || other.doctorSpecificId == doctorSpecificId)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.specialization, specialization) || other.specialization == specialization));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,doctorSpecificId,name,email,phone,specialization);

@override
String toString() {
  return 'DoctorInfo(doctorSpecificId: $doctorSpecificId, name: $name, email: $email, phone: $phone, specialization: $specialization)';
}


}

/// @nodoc
abstract mixin class $DoctorInfoCopyWith<$Res>  {
  factory $DoctorInfoCopyWith(DoctorInfo value, $Res Function(DoctorInfo) _then) = _$DoctorInfoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String doctorSpecificId, String name, String email, String phone, String specialization
});




}
/// @nodoc
class _$DoctorInfoCopyWithImpl<$Res>
    implements $DoctorInfoCopyWith<$Res> {
  _$DoctorInfoCopyWithImpl(this._self, this._then);

  final DoctorInfo _self;
  final $Res Function(DoctorInfo) _then;

/// Create a copy of DoctorInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? doctorSpecificId = null,Object? name = null,Object? email = null,Object? phone = null,Object? specialization = null,}) {
  return _then(_self.copyWith(
doctorSpecificId: null == doctorSpecificId ? _self.doctorSpecificId : doctorSpecificId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,specialization: null == specialization ? _self.specialization : specialization // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _DoctorInfo implements DoctorInfo {
  const _DoctorInfo({@JsonKey(name: 'id') required this.doctorSpecificId, required this.name, required this.email, required this.phone, required this.specialization});
  factory _DoctorInfo.fromJson(Map<String, dynamic> json) => _$DoctorInfoFromJson(json);

@override@JsonKey(name: 'id') final  String doctorSpecificId;
@override final  String name;
@override final  String email;
@override final  String phone;
@override final  String specialization;

/// Create a copy of DoctorInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoctorInfoCopyWith<_DoctorInfo> get copyWith => __$DoctorInfoCopyWithImpl<_DoctorInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DoctorInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DoctorInfo&&(identical(other.doctorSpecificId, doctorSpecificId) || other.doctorSpecificId == doctorSpecificId)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.specialization, specialization) || other.specialization == specialization));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,doctorSpecificId,name,email,phone,specialization);

@override
String toString() {
  return 'DoctorInfo(doctorSpecificId: $doctorSpecificId, name: $name, email: $email, phone: $phone, specialization: $specialization)';
}


}

/// @nodoc
abstract mixin class _$DoctorInfoCopyWith<$Res> implements $DoctorInfoCopyWith<$Res> {
  factory _$DoctorInfoCopyWith(_DoctorInfo value, $Res Function(_DoctorInfo) _then) = __$DoctorInfoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String doctorSpecificId, String name, String email, String phone, String specialization
});




}
/// @nodoc
class __$DoctorInfoCopyWithImpl<$Res>
    implements _$DoctorInfoCopyWith<$Res> {
  __$DoctorInfoCopyWithImpl(this._self, this._then);

  final _DoctorInfo _self;
  final $Res Function(_DoctorInfo) _then;

/// Create a copy of DoctorInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? doctorSpecificId = null,Object? name = null,Object? email = null,Object? phone = null,Object? specialization = null,}) {
  return _then(_DoctorInfo(
doctorSpecificId: null == doctorSpecificId ? _self.doctorSpecificId : doctorSpecificId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,specialization: null == specialization ? _self.specialization : specialization // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
