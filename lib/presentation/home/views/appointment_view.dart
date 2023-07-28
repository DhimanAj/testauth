import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../infrastructure/theme/colors.theme.dart';
import '../controllers/home_controller.dart';

class AppointmentView extends GetView<BaseHomeController> {
  const AppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsTheme.E9E4E4,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

        ],
      ),
    );
  }
}
