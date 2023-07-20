import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../theme/colors.theme.dart';

class SnackBarUtil {
  static void showSuccess({required String message, Color? color}) {
    Get.rawSnackbar(
      title: 'Success',
      message: message,
      backgroundColor: color ?? Colors.green.shade600,
    );
  }

  static void showWarning({required String message}) {
    Get.rawSnackbar(
      title: 'Warning',
      message: message,
      backgroundColor: Colors.orange.shade900,
    );
  }

  static void showError({required String message}) {
    Get.rawSnackbar(
      title: 'Error',
      message: message,
      backgroundColor: Colors.redAccent.shade700,
    );
  }


}
