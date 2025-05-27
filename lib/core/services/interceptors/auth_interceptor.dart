import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_clinic/core/services/token_storage_service.dart';

class AuthInterceptor extends Interceptor {
  final Ref _ref;

  AuthInterceptor(this._ref);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    const noAuthPaths = ['/auth/login', '/auth/patient/register'];

    if (noAuthPaths.contains(options.path)) {
      return handler.next(options);
    }

    final tokenStorageService = _ref.read(tokenStorageServiceProvider);
    final token = await tokenStorageService.getToken();

    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
      print('Token added to request header for path: ${options.path}');
    } else {
      print('No token found for authenticated request to: ${options.path}');
    }
    return handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      print(
        'AuthInterceptor: Received 401 Unauthorized error for ${err.requestOptions.path}.',
      );
      final tokenStorageService = _ref.read(tokenStorageServiceProvider);
      await tokenStorageService.deleteToken();

      // TODO: Implement global logout navigation or state update.
      // This could involve invalidating user-specific providers or navigating to login.
      // Example: _ref.read(routerProvider).go('/login');
      // Example: _ref.read(authStateProvider.notifier).logout();
      print('AuthInterceptor: Cleared token due to 401.');
    }
    return handler.next(err);
  }
}
