import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../infrastructure/constants/app_constants.dart';
import '../../../infrastructure/core/utils/progess_dailog.dart';
import '../../../infrastructure/navigation/routes.dart';
import '../../../infrastructure/network/model/user_model.dart';
import '../../../infrastructure/preference/preference_manager.dart';

class BaseHomeController extends GetxController
    with GetTickerProviderStateMixin {
  ProgressDialog progressDialog = ProgressDialog();
  var selectedIndex = 0.obs;
  var paymentModeList = ['Paypal', 'Credit Card'];

  var cardSelectedIndex = Rx(0);

  var isSwitched = false.obs;
  UserData? userModelData = UserData();
  var userName = ''.obs;
  var nextSevenDays = <DateTime>[].obs;
  var userPhoneNumber = ''.obs;
  var countryCode = ''.obs;

  var requestTabIndex = 0.obs;
  late TabController tabController;

  late Timer timer;

  var selectedHomeTab = 0.obs;

  @override
  void onInit() {
    getNextSevenDays();
    tabController = TabController(length: 4, vsync: this);
    Future.delayed(const Duration(milliseconds: 200), () async {
      tabController.addListener(() {
        selectedHomeTab.value = tabController.index;
      });
    });

    print("selectedHomeTab ${selectedIndex.value}");

    super.onInit();
  }

   getNextSevenDays() {

    DateTime today = DateTime.now();

    for (int i = 0; i < 7; i++) {
      DateTime nextDate = today.add(Duration(days: i));
      nextSevenDays.add(nextDate);
    }

  }

  onTabTapped(int index) async {
    selectedIndex.value = index;

  }

  logOut() {
    PreferenceManager.clear();
    Get.offAllNamed(Routes.login);
  }
}
