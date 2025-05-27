import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_clinic/features/auth/domain/auth_user.dart';

part 'auth_state.freezed.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitial;
  const factory AuthState.loading() = AuthLoading;
  const factory AuthState.authenticated({required AuthUser user}) =
      Authenticated;
  const factory AuthState.unauthenticated({String? message}) = Unauthenticated;
  const factory AuthState.error({required String message}) = AuthError;
}
