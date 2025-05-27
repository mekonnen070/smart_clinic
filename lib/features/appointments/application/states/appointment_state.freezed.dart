// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appointment_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppointmentState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppointmentState()';
}


}

/// @nodoc
class $AppointmentStateCopyWith<$Res>  {
$AppointmentStateCopyWith(AppointmentState _, $Res Function(AppointmentState) __);
}


/// @nodoc


class AppointmentInitial implements AppointmentState {
  const AppointmentInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppointmentState.initial()';
}


}




/// @nodoc


class AppointmentLoading implements AppointmentState {
  const AppointmentLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppointmentState.loading()';
}


}




/// @nodoc


class AppointmentLoaded implements AppointmentState {
  const AppointmentLoaded({required final  List<Appointment> appointments}): _appointments = appointments;
  

 final  List<Appointment> _appointments;
 List<Appointment> get appointments {
  if (_appointments is EqualUnmodifiableListView) return _appointments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_appointments);
}


/// Create a copy of AppointmentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppointmentLoadedCopyWith<AppointmentLoaded> get copyWith => _$AppointmentLoadedCopyWithImpl<AppointmentLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentLoaded&&const DeepCollectionEquality().equals(other._appointments, _appointments));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_appointments));

@override
String toString() {
  return 'AppointmentState.loaded(appointments: $appointments)';
}


}

/// @nodoc
abstract mixin class $AppointmentLoadedCopyWith<$Res> implements $AppointmentStateCopyWith<$Res> {
  factory $AppointmentLoadedCopyWith(AppointmentLoaded value, $Res Function(AppointmentLoaded) _then) = _$AppointmentLoadedCopyWithImpl;
@useResult
$Res call({
 List<Appointment> appointments
});




}
/// @nodoc
class _$AppointmentLoadedCopyWithImpl<$Res>
    implements $AppointmentLoadedCopyWith<$Res> {
  _$AppointmentLoadedCopyWithImpl(this._self, this._then);

  final AppointmentLoaded _self;
  final $Res Function(AppointmentLoaded) _then;

/// Create a copy of AppointmentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? appointments = null,}) {
  return _then(AppointmentLoaded(
appointments: null == appointments ? _self._appointments : appointments // ignore: cast_nullable_to_non_nullable
as List<Appointment>,
  ));
}


}

/// @nodoc


class AppointmentError implements AppointmentState {
  const AppointmentError({required this.message});
  

 final  String message;

/// Create a copy of AppointmentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppointmentErrorCopyWith<AppointmentError> get copyWith => _$AppointmentErrorCopyWithImpl<AppointmentError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AppointmentState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $AppointmentErrorCopyWith<$Res> implements $AppointmentStateCopyWith<$Res> {
  factory $AppointmentErrorCopyWith(AppointmentError value, $Res Function(AppointmentError) _then) = _$AppointmentErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AppointmentErrorCopyWithImpl<$Res>
    implements $AppointmentErrorCopyWith<$Res> {
  _$AppointmentErrorCopyWithImpl(this._self, this._then);

  final AppointmentError _self;
  final $Res Function(AppointmentError) _then;

/// Create a copy of AppointmentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AppointmentError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AppointmentBooking implements AppointmentState {
  const AppointmentBooking();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentBooking);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppointmentState.booking()';
}


}




/// @nodoc


class AppointmentBookingSuccess implements AppointmentState {
  const AppointmentBookingSuccess({required this.newAppointment});
  

 final  Appointment newAppointment;

/// Create a copy of AppointmentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppointmentBookingSuccessCopyWith<AppointmentBookingSuccess> get copyWith => _$AppointmentBookingSuccessCopyWithImpl<AppointmentBookingSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentBookingSuccess&&(identical(other.newAppointment, newAppointment) || other.newAppointment == newAppointment));
}


@override
int get hashCode => Object.hash(runtimeType,newAppointment);

@override
String toString() {
  return 'AppointmentState.bookingSuccess(newAppointment: $newAppointment)';
}


}

/// @nodoc
abstract mixin class $AppointmentBookingSuccessCopyWith<$Res> implements $AppointmentStateCopyWith<$Res> {
  factory $AppointmentBookingSuccessCopyWith(AppointmentBookingSuccess value, $Res Function(AppointmentBookingSuccess) _then) = _$AppointmentBookingSuccessCopyWithImpl;
@useResult
$Res call({
 Appointment newAppointment
});


$AppointmentCopyWith<$Res> get newAppointment;

}
/// @nodoc
class _$AppointmentBookingSuccessCopyWithImpl<$Res>
    implements $AppointmentBookingSuccessCopyWith<$Res> {
  _$AppointmentBookingSuccessCopyWithImpl(this._self, this._then);

  final AppointmentBookingSuccess _self;
  final $Res Function(AppointmentBookingSuccess) _then;

/// Create a copy of AppointmentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? newAppointment = null,}) {
  return _then(AppointmentBookingSuccess(
newAppointment: null == newAppointment ? _self.newAppointment : newAppointment // ignore: cast_nullable_to_non_nullable
as Appointment,
  ));
}

/// Create a copy of AppointmentState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppointmentCopyWith<$Res> get newAppointment {
  
  return $AppointmentCopyWith<$Res>(_self.newAppointment, (value) {
    return _then(_self.copyWith(newAppointment: value));
  });
}
}

/// @nodoc


class AppointmentBookingError implements AppointmentState {
  const AppointmentBookingError({required this.message});
  

 final  String message;

/// Create a copy of AppointmentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppointmentBookingErrorCopyWith<AppointmentBookingError> get copyWith => _$AppointmentBookingErrorCopyWithImpl<AppointmentBookingError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentBookingError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AppointmentState.bookingError(message: $message)';
}


}

/// @nodoc
abstract mixin class $AppointmentBookingErrorCopyWith<$Res> implements $AppointmentStateCopyWith<$Res> {
  factory $AppointmentBookingErrorCopyWith(AppointmentBookingError value, $Res Function(AppointmentBookingError) _then) = _$AppointmentBookingErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AppointmentBookingErrorCopyWithImpl<$Res>
    implements $AppointmentBookingErrorCopyWith<$Res> {
  _$AppointmentBookingErrorCopyWithImpl(this._self, this._then);

  final AppointmentBookingError _self;
  final $Res Function(AppointmentBookingError) _then;

/// Create a copy of AppointmentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AppointmentBookingError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
