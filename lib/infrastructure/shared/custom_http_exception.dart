import 'package:dio/dio.dart';

class CustomHttpException implements Exception {
  String? response;
  int? code;

  DioError exception;

  CustomHttpException(this.response, this.code, this.exception);
}
