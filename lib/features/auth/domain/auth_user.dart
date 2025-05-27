import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user.freezed.dart';

@freezed
abstract class AuthUser with _$AuthUser {
  const factory AuthUser({
    @JsonKey(name: 'id') required String userId,
    required String patientSpecificId,
    required String name,
    required String email,
    required String phone,
    required String role,
    required DateTime dateOfBirth,
    required String gender,
    required String address,
    required String emergencyContact,
  }) = _AuthUser;

  factory AuthUser.fromJson(Map<String, dynamic> json) {
    final patientData = json['patient'] as Map<String, dynamic>? ?? {};
    return AuthUser(
      userId: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      role: json['role'] as String,
      patientSpecificId: patientData['id'] as String? ?? '',
      dateOfBirth: DateTime.parse(
        patientData['dateOfBirth'] as String? ??
            DateTime(1900).toIso8601String(),
      ),
      gender: patientData['gender'] as String? ?? '',
      address: patientData['address'] as String? ?? '',
      emergencyContact: patientData['emergencyContact'] as String? ?? '',
    );
  }
}
