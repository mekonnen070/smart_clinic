import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_clinic/features/appointments/domain/appointment.dart';

part 'appointment_state.freezed.dart';

@freezed
sealed class AppointmentState with _$AppointmentState {
  const factory AppointmentState.initial() = AppointmentInitial;
  const factory AppointmentState.loading() = AppointmentLoading;
  const factory AppointmentState.loaded({
    required List<Appointment> appointments,
  }) = AppointmentLoaded;
  const factory AppointmentState.error({required String message}) =
      AppointmentError;

  // Optional: Specific states for booking if more granular feedback is needed
  const factory AppointmentState.booking() = AppointmentBooking;
  const factory AppointmentState.bookingSuccess({
    required Appointment newAppointment,
  }) = AppointmentBookingSuccess;
  const factory AppointmentState.bookingError({required String message}) =
      AppointmentBookingError;
}
