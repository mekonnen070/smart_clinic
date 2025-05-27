import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_clinic/core/config/app_config.dart';
import 'package:smart_clinic/core/dummy_data.dart';
import 'package:smart_clinic/core/services/token_storage_service.dart';
import 'package:smart_clinic/features/auth/domain/auth_user.dart';

import '../../../../core/services/dio_provider.dart';

// --- Abstract Class (Interface) ---
abstract class AuthRepository {
  Future<AuthUser> login({required String email, required String password});
  Future<AuthUser> registerPatient({
    required String name,
    required String email,
    required String password,
    required String phone,
    required DateTime dateOfBirth,
    required String gender,
    required String address,
    required String emergencyContact,
  });
  Future<AuthUser?> getCurrentUser();
  Future<void> logout();
  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
  });
  Future<AuthUser> updateProfile({
    String? name,
    String? phone,
    DateTime? dateOfBirth,
    String? gender,
    String? address,
    String? emergencyContact,
  });
}

// --- Riverpod Provider ---
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dio = ref.watch(dioProvider);
  final tokenStorage = ref.watch(tokenStorageServiceProvider);
  return AuthRepositoryImpl(dio, tokenStorage);
});

class AuthRepositoryImpl implements AuthRepository {
  final Dio _dio;
  final TokenStorageService _tokenStorageService;
  // In-memory user for dummy profile updates, mirroring MockAuthRepositoryImpl logic
  AuthUser? _dummyRAMUser = dummyAuthUser;

  AuthRepositoryImpl(this._dio, this._tokenStorageService);

  @override
  Future<AuthUser> login({
    required String email,
    required String password,
  }) async {
    if (shouldUseMockData) {
      await Future.delayed(const Duration(milliseconds: 300));
      if (email == 'patient@demo.com' && password == 'password') {
        await _tokenStorageService.saveToken('dummy-auth-token-patient-001');
        _dummyRAMUser = dummyAuthUser;
        return dummyAuthUser;
      }
      throw Exception('Mock: Invalid credentials');
    }

    // --- Real API Call ---
    try {
      final response = await _dio.post(
        '/auth/login',
        data: {'email': email, 'password': password},
      );
      final userData = response.data['user'] as Map<String, dynamic>;
      final token = response.data['token'] as String?;
      if (token != null && token.isNotEmpty) {
        await _tokenStorageService.saveToken(token);
      }
      _dummyRAMUser = AuthUser.fromJson(
        userData,
      ); // Keep RAM user in sync if needed
      return AuthUser.fromJson(userData);
    } on DioException catch (e) {
      final errorMsg =
          e.response?.data?['message']?.toString() ??
          e.message ??
          'Login failed';
      throw Exception(errorMsg);
    } catch (e) {
      throw Exception('An unexpected error occurred during login: $e');
    }
  }

  @override
  Future<AuthUser?> getCurrentUser() async {
    if (shouldUseMockData) {
      await Future.delayed(const Duration(milliseconds: 100));
      final token = await _tokenStorageService.getToken();
      if (token == 'dummy-auth-token-patient-001') return _dummyRAMUser;
      return null;
    }
    // --- Real API Call ---
    try {
      final response = await _dio.get('/auth/me');
      final userData = response.data['user'] as Map<String, dynamic>?;
      _dummyRAMUser = userData != null ? AuthUser.fromJson(userData) : null;
      return _dummyRAMUser;
    } on DioException catch (e) {
      if (e.response?.statusCode != 401) {
        print(
          'GetCurrentUser API error: ${e.response?.data['message'] ?? e.message}',
        );
      }
      _dummyRAMUser = null; // Clear RAM user on error
      return null;
    } catch (e) {
      print('An unexpected error in getCurrentUser: $e');
      _dummyRAMUser = null;
      return null;
    }
  }

  @override
  Future<void> logout() async {
    if (shouldUseMockData) {
      await Future.delayed(const Duration(milliseconds: 100));
      await _tokenStorageService.deleteToken();
      _dummyRAMUser = null;
      return;
    }
    // --- Real API Call ---
    try {
      await _dio.post('/auth/logout');
    } catch (e) {
      // Ignore API error for logout, local cleanup is key
    } finally {
      await _tokenStorageService.deleteToken();
      _dummyRAMUser = null;
    }
  }

  @override
  Future<AuthUser> registerPatient({
    required String name,
    required String email,
    required String password,
    required String phone,
    required DateTime dateOfBirth,
    required String gender,
    required String address,
    required String emergencyContact,
  }) async {
    if (shouldUseMockData) {
      await Future.delayed(const Duration(milliseconds: 300));
      return AuthUser(
        userId: 'new-dummy-user-${DateTime.now().millisecondsSinceEpoch}',
        patientSpecificId:
            'new-dummy-patient-${DateTime.now().millisecondsSinceEpoch}',
        name: name,
        email: email,
        phone: phone,
        role: 'patient',
        dateOfBirth: dateOfBirth,
        gender: gender,
        address: address,
        emergencyContact: emergencyContact,
      );
    }
    // --- Real API Call ---
    try {
      final response = await _dio.post(
        '/auth/patient/register',
        data: {
          'name': name,
          'email': email,
          'password': password,
          'phone': phone,
          'dateOfBirth': dateOfBirth.toIso8601String(),
          'gender': gender,
          'address': address,
          'emergencyContact': emergencyContact,
        },
      );
      final userData = response.data['user'] as Map<String, dynamic>;
      return AuthUser.fromJson(userData);
    } on DioException catch (e) {
      final errorMsg =
          e.response?.data?['message']?.toString() ??
          e.message ??
          'Registration failed';
      throw Exception(errorMsg);
    } catch (e) {
      throw Exception('An unexpected error occurred during registration: $e');
    }
  }

  @override
  Future<AuthUser> updateProfile({
    String? name,
    String? phone,
    DateTime? dateOfBirth,
    String? gender,
    String? address,
    String? emergencyContact,
  }) async {
    if (shouldUseMockData) {
      await Future.delayed(const Duration(milliseconds: 200));
      if (_dummyRAMUser == null)
        throw Exception("Mock: User not logged in to update");
      _dummyRAMUser = _dummyRAMUser!.copyWith(
        name: name ?? _dummyRAMUser!.name,
        phone: phone ?? _dummyRAMUser!.phone,
        dateOfBirth: dateOfBirth ?? _dummyRAMUser!.dateOfBirth,
        gender: gender ?? _dummyRAMUser!.gender,
        address: address ?? _dummyRAMUser!.address,
        emergencyContact: emergencyContact ?? _dummyRAMUser!.emergencyContact,
      );
      return _dummyRAMUser!;
    }
    // --- Real API Call ---
    try {
      final Map<String, dynamic> data = {};
      if (name != null) data['name'] = name;
      if (phone != null) data['phone'] = phone;
      if (dateOfBirth != null)
        data['dateOfBirth'] = dateOfBirth.toIso8601String();
      if (gender != null) data['gender'] = gender;
      if (address != null) data['address'] = address;
      if (emergencyContact != null) data['emergencyContact'] = emergencyContact;

      final response = await _dio.put('/auth/update-profile', data: data);
      final userData = response.data['user'] as Map<String, dynamic>;
      _dummyRAMUser = AuthUser.fromJson(userData);
      return _dummyRAMUser!;
    } on DioException catch (e) {
      final errorMsg =
          e.response?.data?['message']?.toString() ??
          e.message ??
          'Update profile failed';
      throw Exception(errorMsg);
    } catch (e) {
      throw Exception('An unexpected error occurred during update profile: $e');
    }
  }

  @override
  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    if (shouldUseMockData) {
      await Future.delayed(const Duration(milliseconds: 200));
      if (oldPassword != "password")
        throw Exception("Mock: Incorrect old password");
      print("Mock: Password changed successfully for dummy user.");
      return;
    }
    // --- Real API Call ---
    try {
      await _dio.post(
        '/auth/change-password',
        data: {'oldPassword': oldPassword, 'newPassword': newPassword},
      );
    } on DioException catch (e) {
      final errorMsg =
          e.response?.data?['message']?.toString() ??
          e.message ??
          'Change password failed';
      throw Exception(errorMsg);
    } catch (e) {
      throw Exception(
        'An unexpected error occurred during change password: $e',
      );
    }
  }
}
