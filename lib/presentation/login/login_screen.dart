import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../infrastructure/core/base/base_view.dart';
import '../../infrastructure/core/utils/snacbar.dart';
import '../../infrastructure/navigation/routes.dart';
import '../../infrastructure/theme/colors.theme.dart';
import '../../infrastructure/theme/text.theme.dart';
import 'controllers/login_controller.dart';

class LoginScreen extends BaseView<LoginController> {
  LoginScreen({super.key});

  @override
  Brightness statusBarBrightness() => Brightness.light;

  @override
  Widget body(BuildContext context) {
    return Scaffold(
        body: Container(
      // decoration: const BoxDecoration(
      //   image: DecorationImage(image: AssetImage(Res.bgIcon), fit: BoxFit.cover),
      // ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 50,
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  margin: const EdgeInsets.only(left: 20.0, right: 20),
                  width: double.infinity,
                  decoration:
                      const BoxDecoration(color: Colors.black26, borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 8,
                      ),
                      InkWell(
                          onTap: () {
                            controller.countyCodeBottomSheet(context);
                          },
                          child: Obx(() => Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    controller.countryFlag.isEmpty
                                        ? "assets/flags/inn.svg"
                                        : controller.countryFlag.value,
                                    height: 17,
                                    width: 27,
                                    fit: BoxFit.fill,
                                  ),
                                  const Icon(
                                    Icons.arrow_drop_down_sharp,
                                    color: Colors.black,
                                    size: 30,
                                  )
                                ],
                              ))),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: TextField(
                          controller: controller.numberController,
                          style: regularTextStyle(fontSize: 14.0, color: ColorsTheme.colBlack),
                          keyboardType: TextInputType.phone,
                          inputFormatters: [LengthLimitingTextInputFormatter(10)],
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "phone_number".tr,
                            hintStyle: regularTextStyle(fontSize: 14.0, color: ColorsTheme.colBlack),
                            fillColor: Colors.black,
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: () {
              if (controller.numberController.text.trim().length < 10) {
                SnackBarUtil.showError(message: "please_enter_no".tr);
              } else {
                // Get.offAllNamed(Routes.home);
                controller.signInWithPhoneNumber();
                // controller.checkPhoneNumberExists();
              }
            },
            child: Container(
              margin: EdgeInsets.only(left: 50, right: 50, bottom: 30),
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

          const SizedBox(
            height: 80,
          ),
        ],
      ),
    ));
  }
}
