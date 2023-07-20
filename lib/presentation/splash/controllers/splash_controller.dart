import 'dart:io';

import 'package:flutter/animation.dart';
import 'package:get/get.dart';

import '../../../infrastructure/constants/app_constants.dart';
import '../../../infrastructure/navigation/routes.dart';
import '../../../infrastructure/preference/preference_manager.dart';
import '../../../res.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {
  var assetUrl = Res.like;
  var serviceEnabled = false.obs;
  Animation<double>? scaleAnimation;
  AnimationController? animationController;
  var deviceType = "".obs;

  @override
  void onInit() {

    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    scaleAnimation = Tween<double>(
      begin: 100,
      end: 200,
    ).animate(
      CurvedAnimation(
        parent: animationController!,
        curve: Curves.ease,
      ),
    );
    animationController!.forward();
    scaleAnimation!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        nextScreen();
      }
    });

    super.onInit();
  }

  nextScreen() async {

    Future.delayed(Duration.zero, () async {
      var isLogin = await PreferenceManager.getBool(AppConstants.isLogin);
    print("isloginvalue $isLogin");
      if (isLogin) {
        Get.offAllNamed(Routes.home);
      } else {
        Get.offNamed(Routes.login);
      }
    });
  }



  @override
  void dispose() {
    if (scaleAnimation!.isCompleted) {
      animationController!.dispose();
    }
    super.dispose();
  }

}
