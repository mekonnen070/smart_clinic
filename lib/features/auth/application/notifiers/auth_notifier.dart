import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_clinic/features/auth/data/auth_repository.dart';

import '../states/auth_state.dart'; // The AuthState sealed class

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>((
  ref,
) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthNotifier(authRepository);
});

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;

  AuthNotifier(this._authRepository) : super(const AuthState.initial()) {
    _initialize();
  }

  Future<void> _initialize() async {
    state = const AuthState.loading();
    try {
      // Attempt to get current user on app start
      final user = await _authRepository.getCurrentUser();
      if (user != null) {
        state = AuthState.authenticated(user: user);
      } else {
        state = const AuthState.unauthenticated();
      }
    } catch (e) {
      state = AuthState.error(message: e.toString());
    }
  }

  Future<void> login(String email, String password) async {
    state = const AuthState.loading();
    try {
      final user = await _authRepository.login(
        email: email,
        password: password,
      );
      state = AuthState.authenticated(user: user);
    } catch (e) {
      state = AuthState.error(message: e.toString());
    }
  }

  Future<void> registerPatient({
    required String name,
    required String email,
    required String password,
    required String phone,
    required DateTime dateOfBirth,
    required String gender,
    required String address,
    required String emergencyContact,
  }) async {
    state = const AuthState.loading();
    try {
      // Backend registerPatient doesn't auto-login or return a token.
      // After successful registration, user typically needs to login.
      await _authRepository.registerPatient(
        name: name,
        email: email,
        password: password,
        phone: phone,
        dateOfBirth: dateOfBirth,
        gender: gender,
        address: address,
        emergencyContact: emergencyContact,
      );
      // Consider the state after registration: still unauthenticated but with a success message?
      // Or trigger a login flow. For now, setting to unauthenticated with a message.
      state = const AuthState.unauthenticated(
        message: 'Registration successful. Please login.',
      );
    } catch (e) {
      state = AuthState.error(message: e.toString());
    }
  }

  Future<void> logout() async {
    state = const AuthState.loading();
    try {
      await _authRepository.logout();
      state = const AuthState.unauthenticated();
    } catch (e) {
      // Even if logout API fails, treat as unauthenticated on client.
      state = const AuthState.unauthenticated(
        message: 'Logout partially failed, but you are logged out locally.',
      );
      print("Error during logout: $e"); // Log the error
    }
  }

  Future<void> updateProfile({
    String? name,
    String? phone,
    DateTime? dateOfBirth,
    String? gender,
    String? address,
    String? emergencyContact,
  }) async {
    if (state is Authenticated) {
      final currentAuthState = state as Authenticated;
      state = const AuthState.loading(); // Or a specific ProfileUpdating state
      try {
        final updatedUser = await _authRepository.updateProfile(
          name: name,
          phone: phone,
          dateOfBirth: dateOfBirth,
          gender: gender,
          address: address,
          emergencyContact: emergencyContact,
        );
        state = AuthState.authenticated(user: updatedUser);
      } catch (e) {
        state = AuthState.error(message: e.toString());
        // Optionally revert to previous authenticated state if update fails
        state = AuthState.authenticated(user: currentAuthState.user);
      }
    } else {
      state = const AuthState.error(
        message: "User not authenticated. Cannot update profile.",
      );
    }
  }

  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    if (state is Authenticated) {
      state = const AuthState.loading(); // Or a specific PasswordChanging state
      try {
        await _authRepository.changePassword(
          oldPassword: oldPassword,
          newPassword: newPassword,
        );
        // Password change successful, user remains authenticated with the same user object
        // We might want to refetch the user or just revert to the previous authenticated state
        // For simplicity, we assume the user object doesn't change and no specific success message state is needed here.
        // If a success message is desired, add a new state for it.
        final user = (state as Authenticated).user; // Get current user
        state = AuthState.authenticated(
          user: user,
        ); // Revert to authenticated with existing user
        // Or, more robustly, you could have a general success state or a new state like AuthProfileUpdated
      } catch (e) {
        state = AuthState.error(message: e.toString());
      }
    } else {
      state = const AuthState.error(
        message: "User not authenticated. Cannot change password.",
      );
    }
  }

  // Call this to refresh user data if needed from elsewhere
  Future<void> refreshCurrentUser() async {
    await _initialize();
  }
}
