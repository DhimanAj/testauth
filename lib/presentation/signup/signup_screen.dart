
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../infrastructure/core/base/base_view.dart';
import '../../infrastructure/theme/colors.theme.dart';
import '../../infrastructure/theme/text.theme.dart';
import '../../res.dart';
import 'controllers/signup_controller.dart';

class SignupScreen extends BaseView<SignupController> {
  SignupScreen({super.key});

  @override
  Brightness statusBarBrightness() => Brightness.light;

  @override
  Widget body(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(
          height: 30,
        ),
        Expanded(
          child:           Obx(
                () => Align(
                alignment: Alignment.center,
                child: controller.imagePath.value.isEmpty
                    ? InkWell(
                  onTap: () {
                    controller.pickImage(ImageSource.camera);
                  },
                  child:  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        image:  DecorationImage(image: AssetImage(Res.ic_profile_black)),
                        color: ColorsTheme.col797D7F,
                        shape: BoxShape.circle),
                  )
                )
                    :InkWell(
                    onTap: () {
                      controller.pickImage(ImageSource.camera);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.file(
                        File(controller.imagePath.value),
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                      ),
                    ))),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20.0, right: 20),
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                width: double.infinity,
                // height: 40,
                decoration:
                    const BoxDecoration(color: Color(0xffd0d5d5), borderRadius: BorderRadius.all(Radius.circular(10))),
                child: TextField(
                  controller: controller.nameController,
                  style: regularTextStyle(fontSize: 14.0, color: ColorsTheme.colBlack),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Name",
                      hintStyle: regularTextStyle(fontSize: 14.0, color: ColorsTheme.colHint),
                      fillColor: Colors.black),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50, bottom: 70),
          child: InkWell(
            onTap: () {
              if(controller.nameController.text.trim().isNotEmpty){
                controller.registerUser();
                // controller.singUp();
              }
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 50),
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration:
                  const BoxDecoration(color: Color(0xff08BCF1), borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'next'.tr,
                    style: semiBoldTextStyle(fontSize: 12.0, color: ColorsTheme.colWhite),
                  )),
            ),
          ),
        ),
      ],
    ));
  }
}
