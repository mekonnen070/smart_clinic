// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doctor_slot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DoctorSlot {

 String get id; String get day;@JsonKey(name: 'time') String get slotTime; bool get isBooked;
/// Create a copy of DoctorSlot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorSlotCopyWith<DoctorSlot> get copyWith => _$DoctorSlotCopyWithImpl<DoctorSlot>(this as DoctorSlot, _$identity);

  /// Serializes this DoctorSlot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorSlot&&(identical(other.id, id) || other.id == id)&&(identical(other.day, day) || other.day == day)&&(identical(other.slotTime, slotTime) || other.slotTime == slotTime)&&(identical(other.isBooked, isBooked) || other.isBooked == isBooked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,day,slotTime,isBooked);

@override
String toString() {
  return 'DoctorSlot(id: $id, day: $day, slotTime: $slotTime, isBooked: $isBooked)';
}


}

/// @nodoc
abstract mixin class $DoctorSlotCopyWith<$Res>  {
  factory $DoctorSlotCopyWith(DoctorSlot value, $Res Function(DoctorSlot) _then) = _$DoctorSlotCopyWithImpl;
@useResult
$Res call({
 String id, String day,@JsonKey(name: 'time') String slotTime, bool isBooked
});




}
/// @nodoc
class _$DoctorSlotCopyWithImpl<$Res>
    implements $DoctorSlotCopyWith<$Res> {
  _$DoctorSlotCopyWithImpl(this._self, this._then);

  final DoctorSlot _self;
  final $Res Function(DoctorSlot) _then;

/// Create a copy of DoctorSlot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? day = null,Object? slotTime = null,Object? isBooked = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as String,slotTime: null == slotTime ? _self.slotTime : slotTime // ignore: cast_nullable_to_non_nullable
as String,isBooked: null == isBooked ? _self.isBooked : isBooked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _DoctorSlot implements DoctorSlot {
  const _DoctorSlot({required this.id, required this.day, @JsonKey(name: 'time') required this.slotTime, required this.isBooked});
  factory _DoctorSlot.fromJson(Map<String, dynamic> json) => _$DoctorSlotFromJson(json);

@override final  String id;
@override final  String day;
@override@JsonKey(name: 'time') final  String slotTime;
@override final  bool isBooked;

/// Create a copy of DoctorSlot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoctorSlotCopyWith<_DoctorSlot> get copyWith => __$DoctorSlotCopyWithImpl<_DoctorSlot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DoctorSlotToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DoctorSlot&&(identical(other.id, id) || other.id == id)&&(identical(other.day, day) || other.day == day)&&(identical(other.slotTime, slotTime) || other.slotTime == slotTime)&&(identical(other.isBooked, isBooked) || other.isBooked == isBooked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,day,slotTime,isBooked);

@override
String toString() {
  return 'DoctorSlot(id: $id, day: $day, slotTime: $slotTime, isBooked: $isBooked)';
}


}

/// @nodoc
abstract mixin class _$DoctorSlotCopyWith<$Res> implements $DoctorSlotCopyWith<$Res> {
  factory _$DoctorSlotCopyWith(_DoctorSlot value, $Res Function(_DoctorSlot) _then) = __$DoctorSlotCopyWithImpl;
@override @useResult
$Res call({
 String id, String day,@JsonKey(name: 'time') String slotTime, bool isBooked
});




}
/// @nodoc
class __$DoctorSlotCopyWithImpl<$Res>
    implements _$DoctorSlotCopyWith<$Res> {
  __$DoctorSlotCopyWithImpl(this._self, this._then);

  final _DoctorSlot _self;
  final $Res Function(_DoctorSlot) _then;

/// Create a copy of DoctorSlot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? day = null,Object? slotTime = null,Object? isBooked = null,}) {
  return _then(_DoctorSlot(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as String,slotTime: null == slotTime ? _self.slotTime : slotTime // ignore: cast_nullable_to_non_nullable
as String,isBooked: null == isBooked ? _self.isBooked : isBooked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
