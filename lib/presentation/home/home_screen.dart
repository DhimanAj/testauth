import 'package:auth/presentation/home/views/appointment_view.dart';
import 'package:auth/presentation/home/views/doctors_view.dart';
import 'package:auth/presentation/home/views/home_view.dart';
import 'package:auth/presentation/home/views/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../infrastructure/core/base/base_view.dart';
import '../../infrastructure/shared/bottom_navigation_indicator.dart';
import '../../infrastructure/theme/colors.theme.dart';
import '../../infrastructure/theme/text.theme.dart';
import '../../res.dart';
import 'controllers/home_controller.dart';

class BaseHomeScreen extends BaseView<BaseHomeController> {
  BaseHomeScreen({super.key});

  @override
  Widget? bottomNavigationBar(context) {
    return Obx(() => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BottomNavigationIndicators(
              activeIdx: controller.selectedIndex.value,
              activeColor: Colors.amber,
              numTabs: 4,
              padding: 25,
              height: 3,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: <BoxShadow>[BoxShadow(color: Colors.black26, blurRadius: 15.0, spreadRadius: 1)],
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                showUnselectedLabels: true,
                showSelectedLabels: true,
                unselectedItemColor: Colors.grey,
                backgroundColor: Colors.white,
                selectedLabelStyle: semiBoldTextStyle(fontSize: dimen8, color: ColorsTheme.colPrimary),
                unselectedLabelStyle: semiBoldTextStyle(fontSize: dimen8, color: ColorsTheme.colPrimary),
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage(Res.home_ic),
                      size: 25,
                    ),
                    label: ''.tr,
                  ),
                  BottomNavigationBarItem(
                      icon: const Padding(
                        padding: EdgeInsets.only(),
                        child: ImageIcon(
                          AssetImage(Res.ic_file),
                          size: 20,
                        ),
                      ),
                      label: ''.tr),
                  BottomNavigationBarItem(
                    icon: const Padding(
                      padding: EdgeInsets.only(bottom: 2),
                      child: ImageIcon(
                        AssetImage(Res.ic_calander),
                        size: 20,
                      ),
                    ),
                    label: ''.tr,
                  ),
                  BottomNavigationBarItem(
                    icon: const Padding(
                      padding: EdgeInsets.only(bottom: 2),
                      child: ImageIcon(
                        AssetImage(Res.ic_setting),
                        size: 20,
                      ),
                    ),
                    label: ''.tr,
                  ),
                ],
                currentIndex: controller.selectedIndex.value,
                selectedItemColor: Colors.amber,
                onTap: (index) {
                  controller.onTabTapped(index);
                },
              ),
            ),
          ],
        ));
  }

  @override
  Widget body(BuildContext context) {
    return getWidget();
  }

  getWidget() {
    return Obx(() {
      if (controller.selectedIndex.value == 0) {
        return HomeView();
      } else if (controller.selectedIndex.value == 1) {
        return DoctorsView();
      } else if (controller.selectedIndex.value == 2) {
        return AppointmentView();
      } else if (controller.selectedIndex.value == 3) {
        return SettingView();
      } else {
        return Container();
      }
    });
  }
}
