// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doctor_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DoctorState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DoctorState()';
}


}

/// @nodoc
class $DoctorStateCopyWith<$Res>  {
$DoctorStateCopyWith(DoctorState _, $Res Function(DoctorState) __);
}


/// @nodoc


class DoctorInitial implements DoctorState {
  const DoctorInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DoctorState.initial()';
}


}




/// @nodoc


class DoctorLoading implements DoctorState {
  const DoctorLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DoctorState.loading()';
}


}




/// @nodoc


class DoctorLoaded implements DoctorState {
  const DoctorLoaded({required final  List<Doctor> doctors}): _doctors = doctors;
  

 final  List<Doctor> _doctors;
 List<Doctor> get doctors {
  if (_doctors is EqualUnmodifiableListView) return _doctors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_doctors);
}


/// Create a copy of DoctorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorLoadedCopyWith<DoctorLoaded> get copyWith => _$DoctorLoadedCopyWithImpl<DoctorLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorLoaded&&const DeepCollectionEquality().equals(other._doctors, _doctors));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_doctors));

@override
String toString() {
  return 'DoctorState.loaded(doctors: $doctors)';
}


}

/// @nodoc
abstract mixin class $DoctorLoadedCopyWith<$Res> implements $DoctorStateCopyWith<$Res> {
  factory $DoctorLoadedCopyWith(DoctorLoaded value, $Res Function(DoctorLoaded) _then) = _$DoctorLoadedCopyWithImpl;
@useResult
$Res call({
 List<Doctor> doctors
});




}
/// @nodoc
class _$DoctorLoadedCopyWithImpl<$Res>
    implements $DoctorLoadedCopyWith<$Res> {
  _$DoctorLoadedCopyWithImpl(this._self, this._then);

  final DoctorLoaded _self;
  final $Res Function(DoctorLoaded) _then;

/// Create a copy of DoctorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? doctors = null,}) {
  return _then(DoctorLoaded(
doctors: null == doctors ? _self._doctors : doctors // ignore: cast_nullable_to_non_nullable
as List<Doctor>,
  ));
}


}

/// @nodoc


class DoctorError implements DoctorState {
  const DoctorError({required this.message});
  

 final  String message;

/// Create a copy of DoctorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorErrorCopyWith<DoctorError> get copyWith => _$DoctorErrorCopyWithImpl<DoctorError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'DoctorState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $DoctorErrorCopyWith<$Res> implements $DoctorStateCopyWith<$Res> {
  factory $DoctorErrorCopyWith(DoctorError value, $Res Function(DoctorError) _then) = _$DoctorErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$DoctorErrorCopyWithImpl<$Res>
    implements $DoctorErrorCopyWith<$Res> {
  _$DoctorErrorCopyWithImpl(this._self, this._then);

  final DoctorError _self;
  final $Res Function(DoctorError) _then;

/// Create a copy of DoctorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(DoctorError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
