import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_clinic/core/services/interceptors/auth_interceptor.dart';

const String _baseUrl = 'http://10.0.2.2:5000/api';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: const Duration(seconds: 3),
      receiveTimeout: const Duration(seconds: 3),
    ),
  );

  dio.interceptors.add(AuthInterceptor(ref));

  dio.interceptors.add(
    LogInterceptor(
      requestHeader: true,
      requestBody: true,
      responseHeader: false,
      responseBody: true,
      error: true,
      logPrint: (obj) => print(obj.toString()),
    ),
  );

  return dio;
});
