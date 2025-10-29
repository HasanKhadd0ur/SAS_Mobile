import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;
  DioClient({required String baseUrl}) : dio = Dio(BaseOptions(baseUrl: baseUrl, connectTimeout: const Duration(seconds: 15))) {
    dio.options.headers['Content-Type'] = 'application/json';
  }
}