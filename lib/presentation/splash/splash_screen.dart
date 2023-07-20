import 'package:flutter/material.dart';

import '../../infrastructure/core/base/base_view.dart';
import '../../res.dart';
import 'controllers/splash_controller.dart';

class SplashScreen extends BaseView<SplashController> {
  SplashScreen({super.key});

  @override
  Brightness statusBarBrightness() => Brightness.light;

  @override
  Widget body(BuildContext context) {
    return SafeArea(
        child: Container(
      alignment: Alignment.center,
      child: AnimatedBuilder(
          animation: controller.animationController!,
          builder: (BuildContext context, Widget? child) {
            return Image.asset(
              Res.ic_profile_black,
              height: controller.scaleAnimation!.value,
              width: controller.scaleAnimation!.value,
            );
          }),
    ));
  }
}
