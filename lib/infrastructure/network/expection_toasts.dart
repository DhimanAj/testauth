import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../core/utils/snacbar.dart';

exceptionToasts({required code, required String message, required type}) {
  if (type == 'socketError') {
    SnackBarUtil.showError(message: 'no_internet_connection'.tr);
  } else if (type == DioErrorType.connectionTimeout) {
    SnackBarUtil.showError(message: 'connection_timeout_exception'.tr);
  } else if (type == DioErrorType.receiveTimeout) {
    SnackBarUtil.showError(message: 'connection_timeout_exception'.tr);
  } else {
    if (code == 400) {
      SnackBarUtil.showError(
          message: message.isNotEmpty ? message : "$code ${'bad_request'.tr}");
    } else if (code == 401 || code == 403) {
      SnackBarUtil.showError(
          message:
              message.isNotEmpty ? message : "$code ${'access_denied'.tr}");
    } else if (code == 500) {
      SnackBarUtil.showError(
          message: message.isNotEmpty ? message : "$code ${'server_error'.tr}");
    } else {
      SnackBarUtil.showError(
          message: message.isNotEmpty
              ? message
              : "$code ${'something_went_wrong'.tr}");
    }
  }
}
