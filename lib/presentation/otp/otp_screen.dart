import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../../infrastructure/core/base/base_view.dart';
import '../../infrastructure/theme/colors.theme.dart';
import '../../infrastructure/theme/text.theme.dart';
import 'controllers/otp_controller.dart';

class OtpScreen extends BaseView<OtpController> {
  OtpScreen({super.key});

  @override
  Brightness statusBarBrightness() => Brightness.light;

  @override
  Widget body(BuildContext context) {
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 10, bottom: 20),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: ColorsTheme.colPrimary,
            ),
          ),
        ),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'verification_otp'.tr,
                style: mediumTextStyle(fontSize: 24.0, color: ColorsTheme.col797D7F),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                child: Text(
                  'enter_verification_code'.tr,
                  style: mediumTextStyle(fontSize: 12.0, color: ColorsTheme.colPrimary, height: 1.5),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 58.0, right: 58.0),
                child: OTPTextField(
                  controller: controller.otpController,
                  length: 6,
                  width: 250,
                  fieldWidth: 30,
                  style: regularTextStyle(fontSize: dimen18, color: ColorsTheme.colBlack),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.underline,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    // controller.otpNumber.value = value;
                    controller.onChangeOtp(value);
                  },
                ),
              ),

              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'dont_receive_code'.tr,
                    style: regularTextStyle(fontSize: 12.0, color: ColorsTheme.colBlack),
                  ),
                  const SizedBox(
                    width: 11,
                  ),
                  InkWell(
                    onTap: () {
                      controller.resendOtp();
                    },
                    child: Obx(() => Row(
                          children: [
                            Text(
                              'resend_code'.tr,
                              style: regularTextStyle(fontSize: 12.0, color: ColorsTheme.colPrimary),
                            ),
                            controller.resendTime.value == 0
                                ? const SizedBox()
                                : Text(
                                    ": ${controller.resendTime}",
                                    style: regularTextStyle(fontSize: 12.0, color: ColorsTheme.colPrimary),
                                  ),
                          ],
                        )),
                  )
                ],
              )
            ],
          ),
        ),

       Obx(() =>  GestureDetector(
         onTap: () {
           if (controller.isActiveButton.value) {
             controller.isValidOtp();
           }
         },
         child: Container(
           margin: const EdgeInsets.only(left: 50, right: 50, bottom: 70,),
           height: 40,
           decoration:
           BoxDecoration(    color: controller.isActiveButton.value ?  Color(0xff08BCF1) : ColorsTheme.colHint, borderRadius: BorderRadius.all(Radius.circular(10))),
           child: Align(
               alignment: Alignment.center,
               child: Text(
                 'submit'.tr,
                 style: semiBoldTextStyle(fontSize: 12.0, color: ColorsTheme.colWhite),
               )),
         ),
       )),
      ],
    ));
  }
}
