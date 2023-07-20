import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fAuth;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../../infrastructure/constants/app_constants.dart';
import '../../../infrastructure/core/utils/progess_dailog.dart';
import '../../../infrastructure/core/utils/snacbar.dart';
import '../../../infrastructure/navigation/routes.dart';
import '../../../infrastructure/preference/preference_manager.dart';

class OtpController extends GetxController {
  var resendTime = 30.obs;
  late Timer _timer;
  TextEditingController otpEditingController = TextEditingController();
  OtpFieldController otpController = OtpFieldController();
  var otpNumber = "".obs;
  var isActiveButton = false.obs;
  final fAuth.FirebaseAuth auth = fAuth.FirebaseAuth.instance;

  var mobileNumString = "".obs;
  var verifyId = "".obs;
  var countryCode = "".obs;
  ProgressDialog progressDialog = ProgressDialog();

  @override
  void onInit() {
    // Future.delayed(Duration.zero, () async {
    // });
    startTimer();
    mobileNumString.value = Get.arguments[0];
    verifyId.value = Get.arguments[1];
    countryCode.value = Get.arguments[2];
    _listenSmsCode();

    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void dispose() {
    otpEditingController.dispose();
    SmsAutoFill().unregisterListener();
    super.dispose();
  }

  onChangeOtp(otp) {
    otpNumber.value = otp;
    if (otp.length == 6) {
      isActiveButton.value = true;
    } else {
      isActiveButton.value = false;
    }
  }

  _listenSmsCode() async {
    await SmsAutoFill().listenForCode();
  }

  isValidOtp() async {
    print("isvalidotp");
    progressDialog.show();
    fAuth.PhoneAuthCredential _credential =
        fAuth.PhoneAuthProvider.credential(verificationId: verifyId.value, smsCode: otpNumber.value);
    await auth.signInWithCredential(_credential).then((user) async {

      if (user.user!.phoneNumber != null) {
        checkPhoneNumberExists();
        // await PreferenceManager.setBool(AppConstants.isLogin, true);
      }
    }).catchError((error) {
      onOtpClear();
      progressDialog.dismiss();
      print(error);
      handleException(error);
    });
  }


  onOtpClear() {
    print("wokring");
    otpNumber.value = "";
    print(" otpNumber.value");
    otpController.clear();
    isActiveButton.value = false;
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (resendTime > 0) {
        resendTime--;
        refresh();
      } else {
        _timer.cancel();
      }
    });
  }

  Future<void> checkPhoneNumberExists() async {
    String phoneNumber = countryCode.value + mobileNumString.value;

    try {
      await FirebaseFirestore.instance
          .collection('users')
          .where('mobileNumber', isEqualTo: phoneNumber)
          .get()
          .then((data) {
        if (data.docs.isEmpty) {
          Get.offAllNamed(Routes.signup, arguments: [countryCode.value, mobileNumString.value]);
        } else {
          PreferenceManager.setBool(AppConstants.isLogin, true);
          Get.offAllNamed(Routes.home);
        }
        progressDialog.dismiss();
        print("querySnapshot.docs ${data.docs}");
      });
    } catch (error) {
      print('Error executing Firestore query: $error');
    }
  }

  /*--------Exception Handel-------------*/
  void handleException(Exception e) {
    print(e);
    if (e is fAuth.FirebaseAuthException) {
      switch (e.code) {
        case "invalid-phone-number":
          {
            onOtpClear();
            SnackBarUtil.showError(message: ("invalid_phone_number".tr));
            break;
          }
        case "quota-exceeded":
          {
            onOtpClear();
            SnackBarUtil.showError(message: "quota_exceeded".tr);

            break;
          }
        case "too-many-requests":
          {
            onOtpClear();
            SnackBarUtil.showError(message: ("too-many-requests".tr));

            break;
          }
        case "user-disabled":
          {
            onOtpClear();
            SnackBarUtil.showError(message: "user_disabled".tr);
            break;
          }
        case "operation-not-allowed":
          {
            onOtpClear();
            SnackBarUtil.showError(message: "operation_not_allowed");

            break;
          }
        case "network-request-failed":
          {
            onOtpClear();
            SnackBarUtil.showError(message: "network_request_failed".tr);

            break;
          }
        case "invalid-verification-code":
          {
            onOtpClear();
            SnackBarUtil.showError(message: "invalid_verification_code".tr);
            break;
          }
        default:
          {
            onOtpClear();
            SnackBarUtil.showError(message: "error_default".tr);
          }
      }
    } else {
      onOtpClear();
      SnackBarUtil.showError(message: "error_default".tr);
    }
  }

  ///Resend OTP
  resendOtp() async {
    onOtpClear();
    progressDialog.show();
    print("mobilenumber");
    print(mobileNumString.value);
    print(countryCode.value);
    auth.verifyPhoneNumber(
      phoneNumber: countryCode.value + mobileNumString.value,
      timeout: const Duration(seconds: 30),
      verificationCompleted: (fAuth.PhoneAuthCredential credential) async {
        print('completed:---$credential');
        if (auth.currentUser == null) {
          await auth.signInWithCredential(credential);
        }

        progressDialog.dismiss();
      },
      verificationFailed: (fAuth.FirebaseAuthException e) {
        progressDialog.dismiss();

        handleException(e);
      },
      codeSent: (String verificationId, int? resendToken) {
        resendTime.value = 30;

        startTimer();
        print('codeSentVerificationId:---$verificationId');
        progressDialog.dismiss();

        SnackBarUtil.showSuccess(message: 'otp sent');
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        progressDialog.dismiss();
        print('codeAutoRetrievalVerificationId:---$verificationId');
      },
    );
  }
}
