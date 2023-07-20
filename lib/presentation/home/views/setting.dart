import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../infrastructure/theme/colors.theme.dart';
import '../../../infrastructure/theme/text.theme.dart';
import '../controllers/home_controller.dart';


class SettingView extends GetView<BaseHomeController> {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child:  GestureDetector(
        onTap: () {
          controller.logOut();
        },
        child: Container(
          margin: const EdgeInsets.only(left: 50, right: 50, bottom: 70,),
          height: 40,
          decoration:
          const BoxDecoration(    color:  Color(0xff08BCF1), borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Align(
              alignment: Alignment.center,
              child: Text(
                'Logout'.tr,
                style: semiBoldTextStyle(fontSize: 12.0, color: ColorsTheme.colWhite),
              )),
        ),
      ),
    );
  }


}
