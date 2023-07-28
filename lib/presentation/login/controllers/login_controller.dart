
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fAuth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../../infrastructure/core/utils/country_json.dart';
import '../../../infrastructure/core/utils/progess_dailog.dart';
import '../../../infrastructure/core/utils/snacbar.dart';
import '../../../infrastructure/models/country_model.dart';
import '../../../infrastructure/navigation/routes.dart';
import '../../../infrastructure/theme/text.theme.dart';

class LoginController extends GetxController {
  final numberController = TextEditingController();
  final passController = TextEditingController();
  final countryController = TextEditingController();
  List<Map<String, dynamic>> countriesList = [];
  var firstTimeScreen = true.obs;
  var countriesViewList = <Country>[].obs;
  var countryId = "".obs;
  var countryCodeValue = "+91".obs;
  var countryFlag = "".obs;
  var verificationID = "".obs;
  var countryCode = <Map<String, dynamic>>[].obs;
  final GoogleSignIn googleSignIn = GoogleSignIn(scopes: <String>['email']);

  ProgressDialog progressDialog = ProgressDialog();

  @override
  void onInit() {
    setCountryCode();
    Future.delayed(Duration.zero, () async {
      final String signature = await SmsAutoFill().getAppSignature;
      print(signature);
    });
    super.onInit();
  }

  final fAuth.FirebaseAuth auth = fAuth.FirebaseAuth.instance;

  signInWithPhoneNumber() async {
    progressDialog.show();
    print("--------->>>>>>>>>>>>>>");
    print(countryCodeValue.value + numberController.text);
    await auth.verifyPhoneNumber(
      phoneNumber: countryCodeValue.value + numberController.text,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (fAuth.PhoneAuthCredential credential) async {
        try {
          if (auth.currentUser == null) {
            await auth.signInWithCredential(credential);
          }
        } on Exception catch (e) {
          print("exception_1");
          progressDialog.dismiss();
          handleException(e);
        }
      },
      verificationFailed: (fAuth.FirebaseAuthException e) {
        print("exception_2");
        progressDialog.dismiss();
        handleException(e);
      },
      codeSent: (String verificationId, int? resendToken) async {
        print("exception_3");
        progressDialog.dismiss();
        verificationID.value = verificationId;

        Get.toNamed(Routes.otp, arguments: [
          numberController.text,
          verificationId,
          countryCodeValue.value,
        ]);
        print(verificationId);
        print('codeSentVerificationId:---$verificationId');

        /* Utils.successSnackBar('otp sent');*/
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print("exception_4");
        progressDialog.dismiss();
        verificationID.value = verificationId;
        print('codeAutoRetrievalVerificationId:---$verificationId');
      },
    );
  }












void handleException(Exception e) {
    print("exception>>>> $e");
    if (e is fAuth.FirebaseAuthException) {
      switch (e.code) {
        case "invalid-phone-number":
          {
            SnackBarUtil.showError(message: "invalid_phone_number".tr);
            break;
          }
        case "quota-exceeded":
          {
            SnackBarUtil.showError(message: "quota_exceeded".tr);

            break;
          }
        case "too-many-requests":
          {
            SnackBarUtil.showError(message: "too-many-requests".tr);

            break;
          }
        case "user-disabled":
          {
            SnackBarUtil.showError(message: "user_disabled".tr);
            break;
          }
        case "operation-not-allowed":
          {
            SnackBarUtil.showError(message: "operation_not_allowed");

            break;
          }
        case "network-request-failed":
          {
            SnackBarUtil.showError(message: "network_request_failed".tr);

            break;
          }
        case "invalid-verification-code":
          {
            SnackBarUtil.showError(message: "invalid_verification_code".tr);
            break;
          }
        default:
          {
            SnackBarUtil.showError(message: e.toString());
          }
      }
    } else {
      SnackBarUtil.showError(message: e.toString());
    }
  }

  setCountryCode() {
    countryCode.addAll(countryCodeJson);
  }

  countyCodeBottomSheet(context) {
    return Get.bottomSheet(
      Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            color: Colors.white),
        height: Get.size.height * 0.45,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
                child: Text(
                  "Select Country Code",
                  style:
                      semiBoldTextStyle(fontSize: dimen15, color: Colors.black),
                ),
              ),
              Obx(
                () => ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: countryCode.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        top: 20,
                      ),
                      child: InkWell(
                        onTap: () {
                          countryCodeValue.value =
                              countryCode[index]['dialCode'];
                          countryFlag.value = countryCode[index]['flag'];
                          print(countryCodeValue.value);
                          Get.back();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            countryCode[index]['flag'] == null
                                ? const Icon(
                                    Icons.flag,
                                    color: Colors.grey,
                                  )
                                : SvgPicture.asset(
                                    countryCode[index]['flag'],
                                    height: 20,
                                  ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              countryCode[index]['dialCode'],
                              style: mediumTextStyle(
                                  fontSize: dimen14, color: Colors.black),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                countryCode[index]['name'],
                                style: mediumTextStyle(
                                    fontSize: dimen14, color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      isScrollControlled: true,
    );
  }

  Future<void> signInWithGoogle() async {
    signInWithGoogleApi();
  }

  signInWithGoogleApi() async {
    if (await googleSignIn.isSignedIn()) {
      await googleSignIn.signOut();
    }
    try {
      progressDialog.show();
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
        final credential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);

        if (credential != null) {
          var name = googleSignInAccount!.displayName??'';
          var firstName = name.isEmpty?'':name.split(' ')[0];
          var lastName = '';
          if(name.split(' ').length > 1){
            lastName = name.split(' ')[1];
          }
          var mapData = {'fName':firstName,'lName':lastName,'email':googleSignInAccount.email??'','social_id':googleSignInAccount.id};
          progressDialog.dismiss();
          Get.offAllNamed(Routes.home);
        }
      }
      else{
        progressDialog.dismiss();
      }
    }on FirebaseAuthException catch (e) {
      debugPrint('FirebaseAuthException: ${e.toString()}');
    } on PlatformException catch (e) {
      progressDialog.dismiss();
      if (e.code == 'network_error') {
        SnackBarUtil.showError(message: "No internet connection");
        // Util.customShowToast(msg: e.toString());
      }
      debugPrint('Platform Exception: ${e.toString()}');
    }
    on Exception catch (exception) {
      progressDialog.dismiss();
      handleException(exception);
      print('Exception found: ${exception}');
    } catch (e) {
      progressDialog.dismiss();
      print('Exception: ${e}');
    }
  }
}
