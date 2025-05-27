// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthUser {

@JsonKey(name: 'id') String get userId; String get patientSpecificId; String get name; String get email; String get phone; String get role; DateTime get dateOfBirth; String get gender; String get address; String get emergencyContact;
/// Create a copy of AuthUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthUserCopyWith<AuthUser> get copyWith => _$AuthUserCopyWithImpl<AuthUser>(this as AuthUser, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthUser&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.patientSpecificId, patientSpecificId) || other.patientSpecificId == patientSpecificId)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.role, role) || other.role == role)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.address, address) || other.address == address)&&(identical(other.emergencyContact, emergencyContact) || other.emergencyContact == emergencyContact));
}


@override
int get hashCode => Object.hash(runtimeType,userId,patientSpecificId,name,email,phone,role,dateOfBirth,gender,address,emergencyContact);

@override
String toString() {
  return 'AuthUser(userId: $userId, patientSpecificId: $patientSpecificId, name: $name, email: $email, phone: $phone, role: $role, dateOfBirth: $dateOfBirth, gender: $gender, address: $address, emergencyContact: $emergencyContact)';
}


}

/// @nodoc
abstract mixin class $AuthUserCopyWith<$Res>  {
  factory $AuthUserCopyWith(AuthUser value, $Res Function(AuthUser) _then) = _$AuthUserCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String userId, String patientSpecificId, String name, String email, String phone, String role, DateTime dateOfBirth, String gender, String address, String emergencyContact
});




}
/// @nodoc
class _$AuthUserCopyWithImpl<$Res>
    implements $AuthUserCopyWith<$Res> {
  _$AuthUserCopyWithImpl(this._self, this._then);

  final AuthUser _self;
  final $Res Function(AuthUser) _then;

/// Create a copy of AuthUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? patientSpecificId = null,Object? name = null,Object? email = null,Object? phone = null,Object? role = null,Object? dateOfBirth = null,Object? gender = null,Object? address = null,Object? emergencyContact = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,patientSpecificId: null == patientSpecificId ? _self.patientSpecificId : patientSpecificId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,emergencyContact: null == emergencyContact ? _self.emergencyContact : emergencyContact // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _AuthUser implements AuthUser {
  const _AuthUser({@JsonKey(name: 'id') required this.userId, required this.patientSpecificId, required this.name, required this.email, required this.phone, required this.role, required this.dateOfBirth, required this.gender, required this.address, required this.emergencyContact});
  

@override@JsonKey(name: 'id') final  String userId;
@override final  String patientSpecificId;
@override final  String name;
@override final  String email;
@override final  String phone;
@override final  String role;
@override final  DateTime dateOfBirth;
@override final  String gender;
@override final  String address;
@override final  String emergencyContact;

/// Create a copy of AuthUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthUserCopyWith<_AuthUser> get copyWith => __$AuthUserCopyWithImpl<_AuthUser>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthUser&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.patientSpecificId, patientSpecificId) || other.patientSpecificId == patientSpecificId)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.role, role) || other.role == role)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.address, address) || other.address == address)&&(identical(other.emergencyContact, emergencyContact) || other.emergencyContact == emergencyContact));
}


@override
int get hashCode => Object.hash(runtimeType,userId,patientSpecificId,name,email,phone,role,dateOfBirth,gender,address,emergencyContact);

@override
String toString() {
  return 'AuthUser(userId: $userId, patientSpecificId: $patientSpecificId, name: $name, email: $email, phone: $phone, role: $role, dateOfBirth: $dateOfBirth, gender: $gender, address: $address, emergencyContact: $emergencyContact)';
}


}

/// @nodoc
abstract mixin class _$AuthUserCopyWith<$Res> implements $AuthUserCopyWith<$Res> {
  factory _$AuthUserCopyWith(_AuthUser value, $Res Function(_AuthUser) _then) = __$AuthUserCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String userId, String patientSpecificId, String name, String email, String phone, String role, DateTime dateOfBirth, String gender, String address, String emergencyContact
});




}
/// @nodoc
class __$AuthUserCopyWithImpl<$Res>
    implements _$AuthUserCopyWith<$Res> {
  __$AuthUserCopyWithImpl(this._self, this._then);

  final _AuthUser _self;
  final $Res Function(_AuthUser) _then;

/// Create a copy of AuthUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? patientSpecificId = null,Object? name = null,Object? email = null,Object? phone = null,Object? role = null,Object? dateOfBirth = null,Object? gender = null,Object? address = null,Object? emergencyContact = null,}) {
  return _then(_AuthUser(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,patientSpecificId: null == patientSpecificId ? _self.patientSpecificId : patientSpecificId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,emergencyContact: null == emergencyContact ? _self.emergencyContact : emergencyContact // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
