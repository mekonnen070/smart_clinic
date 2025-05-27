import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class TokenStorageService {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> deleteToken();
}

// Provider for the TokenStorageService, now using SharedPreferences
final tokenStorageServiceProvider = Provider<TokenStorageService>((ref) {
  // For the demo, using SharedPreferences for simplicity and speed.
  // switching to a secure solution like flutter_secure_storage for production.
  return SharedPreferencesTokenStorageServiceImpl();
});

class SharedPreferencesTokenStorageServiceImpl implements TokenStorageService {
  static const _tokenKey = 'auth_token_shared_prefs';

  Future<SharedPreferences> get _prefs async => SharedPreferences.getInstance();

  @override
  Future<void> saveToken(String token) async {
    final prefs = await _prefs;
    await prefs.setString(_tokenKey, token);
    print('Token saved (SharedPreferences).');
  }

  @override
  Future<String?> getToken() async {
    final prefs = await _prefs;
    final token = prefs.getString(_tokenKey);
    print(token != null ? 'Token retrieved (SharedPreferences).' : 'No token found (SharedPreferences).');
    return token;
  }

  @override
  Future<void> deleteToken() async {
    final prefs = await _prefs;
    await prefs.remove(_tokenKey);
    print('Token deleted (SharedPreferences).');
  }
}