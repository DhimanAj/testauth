import 'package:auth/infrastructure/core/base/base_view.dart';
import 'package:auth/presentation/post_detail/post_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../infrastructure/core/utils/header_app_bar.dart';
import '../../infrastructure/theme/colors.theme.dart';
import '../../infrastructure/theme/text.theme.dart';

class PostDetailPage extends BaseView<PostDetailController> {
  PostDetailPage({super.key});

  @override
  Widget body(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Header.defaultAppBar(controller.appBarName),

    Padding(
      padding: const EdgeInsets.only(left: 15,right: 15,top: 20),
      child: Column(
        children: [
          Obx(
                () => Text(
              "Title: ${controller.postDetail.value.title ?? ""}",
              style:
              mediumTextStyle(fontSize: dimen14, color: ColorsTheme.colBlack),
            ),
          ),
          SizedBox(height: 10,),
          Obx(() => Text(
            "Comment: ${controller.postDetail.value.body ?? ""}",
            style: regularTextStyle(
                fontSize: dimen13, color: ColorsTheme.colBlack),
          )),
        ],
      ),
    )
      ],
    );
  }
}
