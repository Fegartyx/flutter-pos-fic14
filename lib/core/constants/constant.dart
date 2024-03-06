import 'package:dio/dio.dart';

class Constant {
  static const String baseUrl = 'http://10.0.2.2:8000/api';
  static const String appName = 'POS Resto';
  static Dio dio = Dio(BaseOptions(
    baseUrl: baseUrl,
  ));
}
