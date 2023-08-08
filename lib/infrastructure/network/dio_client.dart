import 'dart:io';

import 'package:dio/dio.dart';

import '../models/api_response_model.dart';
import '../models/booking_detail_model.dart';
import '../shared/custom_http_exception.dart';
import '../shared/dio_logger.dart';
import 'api_constants.dart';

class DioClient {
  Dio _dio = Dio();
  DioError? _dioError;
  var apiEndPoints = ApiConstants();
  var tag = 'ApiProvider';
  int count = 0;

  DioClient.base({remoteBaseUrl, deviceToken}) {
    var baseUrl = remoteBaseUrl ?? apiEndPoints.baseUrl;
    BaseOptions dioOptions = BaseOptions(
        connectTimeout: const Duration(seconds: 15),
        // 10 seconds
        receiveTimeout: const Duration(seconds: 15),
        receiveDataWhenStatusError: true,
        followRedirects: false,
        baseUrl: baseUrl);
    _dio = Dio(dioOptions);
    _dio.interceptors.add(QueuedInterceptorsWrapper(onRequest: (RequestOptions options, handler) {
      if (deviceToken != null && deviceToken.toString().isNotEmpty) {
        options.headers = {'Authorization': 'Bearer $deviceToken', 'content-type': 'application/json'};
      } else {
        options.headers = {'content-type': 'application/json'};
      }
      DioLogger.onSend(tag, options);
      return handler.next(options);
    }, onResponse: (Response response, handler) {
      DioLogger.onSuccess(tag, response);
      return handler.next(response);
    }, onError: (DioError error, handler) async {
      _dioError = error;
      print('errorrr');
      print(error);
      return handler.next(error);
    }));
  }


  catchErrorHandler() {
    if (_checkSocketException(_dioError!)) {
      throw CustomHttpException('', 200, _dioError!, 'socketError');
    } else {
      throw CustomHttpException(
          _dioError!.response!.data['message'] ?? '', _dioError!.response!.statusCode, _dioError!, 'error');
    }
  }

  bool _checkSocketException(DioError err) {
    return err.type == DioErrorType.unknown && err.error is SocketException;
  }


  Future bookingDetailApi(Map<String, dynamic> data) async {
    try {
      FormData formData = FormData.fromMap(data);
      Response response = await _dio.post(apiEndPoints.venderBookingDetail, data: formData);
      return ApiResponseModel<BookingDetailModel>.fromJson(
          response.data, (data) => BookingDetailModel.fromJson(data));
    } catch (error, stacktrace) {
      catchErrorHandler();
    }
    return null;
  }


}
