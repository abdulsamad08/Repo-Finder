import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:transviti_test/core/constants/app_constants.dart';

class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);
}

class DioService {
  final Dio _dio;

  static const String baseUrl = AppConstants.apiBaseUrl;

  DioService() : _dio = Dio(BaseOptions(baseUrl: baseUrl)) {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        debugPrint('Request: ${options.method} ${options.uri}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        debugPrint('Response: ${response.statusCode} ${response.data}');
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        String errorMessage = 'Unknown error occurred';
        if (e.response != null) {
          switch (e.response?.statusCode) {
            case 400:
              errorMessage = 'Bad Request';
              break;
            case 401:
              errorMessage = 'Unauthorized';
              break;
            case 403:
              errorMessage = 'Forbidden';
              break;
            case 404:
              errorMessage = 'Not Found';
              break;
            case 500:
              errorMessage = 'Internal Server Error';
              break;
            default:
              errorMessage = 'Error: ${e.response?.statusCode}';
              break;
          }
        } else if (e.type == DioExceptionType.connectionTimeout) {
          errorMessage = 'Connection timeout';
        }
        debugPrint('Error: $errorMessage');
        return handler.next(e);
      },
    ));
  }

  Future<Map<String, dynamic>> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await _dio.get(endpoint, queryParameters: queryParameters);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw NetworkException('Failed to load data');
      }
    } catch (e) {
      throw NetworkException('Failed to fetch data: $e');
    }
  }
}
