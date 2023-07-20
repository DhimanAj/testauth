import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../infrastructure/constants/app_constants.dart';
import '../../../infrastructure/core/utils/progess_dailog.dart';
import '../../../infrastructure/navigation/routes.dart';
import '../../../infrastructure/preference/preference_manager.dart';

class SignupController extends GetxController {
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passController = TextEditingController();
  var mobileNumString = "".obs;
  var countryCode = "".obs;
  ProgressDialog progressDialog = ProgressDialog();
  final picker = ImagePicker();

  var imagePath = "".obs;
  var imageUrl = "".obs;

  @override
  void onInit() {
    countryCode.value = Get.arguments[0];
    mobileNumString.value = Get.arguments[1];
    super.onInit();
  }



  void registerUser() async {
    progressDialog.show();
    var timeStamp = DateTime.now().millisecondsSinceEpoch;
    var userData = {
      'mobileNumber': countryCode.value + mobileNumString.value,
      'name': nameController.text,
      'profile': imageUrl.value,
    };

    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(timeStamp.toString())
          .set(userData)
          .then((_) {
            progressDialog.dismiss();
        print('User data uploaded successfully!');
        PreferenceManager.setBool(AppConstants.isLogin, true);
        Get.offNamed(Routes.home);
      });
    } catch (error) {
      progressDialog.dismiss();
      print('Error uploading user data: $error');
    }
  }


  ///upload Image

  pickImage(ImageSource imageSource) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: imageSource);
    print('picked image');
    if (image!.path.isNotEmpty) {
      imagePath.value = image.path;
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child("image1" + DateTime.now().toString());
      UploadTask uploadTask = ref.putFile(File(image.path));
      uploadTask.then((res) {
        imageUrl.value = res.ref.toString();
      });
    }
  }
}
