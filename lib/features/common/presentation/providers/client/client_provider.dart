import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speak_live_go/core/constants/end_points.dart';

final Provider<Dio> clientProvider = Provider((ref) {
  final dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      baseUrl: EndPoints.baseUrl,
    ),
  );

  return dio;
});

final baseClientProvider = Provider<Dio>(
  (ref) {
    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 35),
        baseUrl: EndPoints.baseUrl,
      ),
    );

    return dio;
  },
);
