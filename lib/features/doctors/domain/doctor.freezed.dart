// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doctor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Doctor {

 String get userId;// User.id for this doctor
 String get name; String get email; String get phone;@JsonKey(name: 'doctorId') String get doctorSpecificId;// Doctor.id (PK of Doctor table)
 String get specialization;// String? department, // Can be added if consistently available and needed
 List<DoctorSlot> get slots;
/// Create a copy of Doctor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorCopyWith<Doctor> get copyWith => _$DoctorCopyWithImpl<Doctor>(this as Doctor, _$identity);

  /// Serializes this Doctor to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Doctor&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.doctorSpecificId, doctorSpecificId) || other.doctorSpecificId == doctorSpecificId)&&(identical(other.specialization, specialization) || other.specialization == specialization)&&const DeepCollectionEquality().equals(other.slots, slots));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,name,email,phone,doctorSpecificId,specialization,const DeepCollectionEquality().hash(slots));

@override
String toString() {
  return 'Doctor(userId: $userId, name: $name, email: $email, phone: $phone, doctorSpecificId: $doctorSpecificId, specialization: $specialization, slots: $slots)';
}


}

/// @nodoc
abstract mixin class $DoctorCopyWith<$Res>  {
  factory $DoctorCopyWith(Doctor value, $Res Function(Doctor) _then) = _$DoctorCopyWithImpl;
@useResult
$Res call({
 String userId, String name, String email, String phone,@JsonKey(name: 'doctorId') String doctorSpecificId, String specialization, List<DoctorSlot> slots
});




}
/// @nodoc
class _$DoctorCopyWithImpl<$Res>
    implements $DoctorCopyWith<$Res> {
  _$DoctorCopyWithImpl(this._self, this._then);

  final Doctor _self;
  final $Res Function(Doctor) _then;

/// Create a copy of Doctor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? name = null,Object? email = null,Object? phone = null,Object? doctorSpecificId = null,Object? specialization = null,Object? slots = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,doctorSpecificId: null == doctorSpecificId ? _self.doctorSpecificId : doctorSpecificId // ignore: cast_nullable_to_non_nullable
as String,specialization: null == specialization ? _self.specialization : specialization // ignore: cast_nullable_to_non_nullable
as String,slots: null == slots ? _self.slots : slots // ignore: cast_nullable_to_non_nullable
as List<DoctorSlot>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Doctor implements Doctor {
  const _Doctor({required this.userId, required this.name, required this.email, required this.phone, @JsonKey(name: 'doctorId') required this.doctorSpecificId, required this.specialization, required final  List<DoctorSlot> slots}): _slots = slots;
  factory _Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);

@override final  String userId;
// User.id for this doctor
@override final  String name;
@override final  String email;
@override final  String phone;
@override@JsonKey(name: 'doctorId') final  String doctorSpecificId;
// Doctor.id (PK of Doctor table)
@override final  String specialization;
// String? department, // Can be added if consistently available and needed
 final  List<DoctorSlot> _slots;
// String? department, // Can be added if consistently available and needed
@override List<DoctorSlot> get slots {
  if (_slots is EqualUnmodifiableListView) return _slots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_slots);
}


/// Create a copy of Doctor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoctorCopyWith<_Doctor> get copyWith => __$DoctorCopyWithImpl<_Doctor>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DoctorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Doctor&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.doctorSpecificId, doctorSpecificId) || other.doctorSpecificId == doctorSpecificId)&&(identical(other.specialization, specialization) || other.specialization == specialization)&&const DeepCollectionEquality().equals(other._slots, _slots));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,name,email,phone,doctorSpecificId,specialization,const DeepCollectionEquality().hash(_slots));

@override
String toString() {
  return 'Doctor(userId: $userId, name: $name, email: $email, phone: $phone, doctorSpecificId: $doctorSpecificId, specialization: $specialization, slots: $slots)';
}


}

/// @nodoc
abstract mixin class _$DoctorCopyWith<$Res> implements $DoctorCopyWith<$Res> {
  factory _$DoctorCopyWith(_Doctor value, $Res Function(_Doctor) _then) = __$DoctorCopyWithImpl;
@override @useResult
$Res call({
 String userId, String name, String email, String phone,@JsonKey(name: 'doctorId') String doctorSpecificId, String specialization, List<DoctorSlot> slots
});




}
/// @nodoc
class __$DoctorCopyWithImpl<$Res>
    implements _$DoctorCopyWith<$Res> {
  __$DoctorCopyWithImpl(this._self, this._then);

  final _Doctor _self;
  final $Res Function(_Doctor) _then;

/// Create a copy of Doctor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? name = null,Object? email = null,Object? phone = null,Object? doctorSpecificId = null,Object? specialization = null,Object? slots = null,}) {
  return _then(_Doctor(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,doctorSpecificId: null == doctorSpecificId ? _self.doctorSpecificId : doctorSpecificId // ignore: cast_nullable_to_non_nullable
as String,specialization: null == specialization ? _self.specialization : specialization // ignore: cast_nullable_to_non_nullable
as String,slots: null == slots ? _self._slots : slots // ignore: cast_nullable_to_non_nullable
as List<DoctorSlot>,
  ));
}


}

// dart format on
