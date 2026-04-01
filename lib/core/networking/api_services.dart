import 'package:dio/dio.dart';

abstract class ApiServices {
  Future<dynamic> get(
    String path, {
    Map<String, String>? queryParams,
    String? token,
  });

  Future<dynamic> post(
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
    FormData? formData,
    String? token,
  });

  Future<dynamic> put(
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
    FormData? formData,
    String? token,
  });

  Future<dynamic> patch(
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
    FormData? formData,
    String? token,
  });

  Future<dynamic> delete(
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
    String? token,
  });
}
