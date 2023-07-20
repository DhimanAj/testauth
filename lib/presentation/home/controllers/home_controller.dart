import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../infrastructure/constants/app_constants.dart';
import '../../../infrastructure/core/utils/progess_dailog.dart';
import '../../../infrastructure/navigation/routes.dart';
import '../../../infrastructure/network/model/user_model.dart';
import '../../../infrastructure/preference/preference_manager.dart';

class BaseHomeController extends GetxController with GetTickerProviderStateMixin {

  ProgressDialog progressDialog = ProgressDialog();
  var selectedIndex = 0.obs;
  var paymentModeList = ['Paypal', 'Credit Card'];

  var cardSelectedIndex = Rx(0);

  var isSwitched = false.obs;
  UserData? userModelData = UserData();
  var userName = ''.obs;

  var userPhoneNumber = ''.obs;
  var countryCode = ''.obs;

  var requestTabIndex = 0.obs;
  late TabController tabController;



  late Timer timer;


  var selectedHomeTab = 0.obs;

  @override
  void onInit() {
    // selectedIndex.value = getNotificationIndex.value;

    tabController = TabController(length: 4, vsync: this);

    // getOneSignalData();

    Future.delayed(const Duration(milliseconds: 200), () async {

      tabController.addListener(() {
        selectedHomeTab.value = tabController.index;
      });
    });


    print("selectedHomeTab ${selectedIndex.value}");


    super.onInit();
  }




  onTabTapped(int index) async {
    selectedIndex.value = index;
    // if (selectedIndex.value == 0) {
    //   isLoadingHome.value = true;
    //   onTabHome();
    // } else if (selectedIndex.value == 1) {
    //   onTabTappedLike();
    // } else if (selectedIndex.value == 2) {
    //   isFirstTimeLike.value = true;
    //   onTabMessage();
    // } else if (selectedIndex.value == 3) {
    //   isFirstTimeNotification.value = true;
    //   onTabNotification();
    // }
  }






   logOut() {
    PreferenceManager.clear();
    Get.offAllNamed(Routes.login);
  }





}
