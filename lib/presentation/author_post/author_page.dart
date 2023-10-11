import 'package:auth/infrastructure/core/base/base_view.dart';
import 'package:auth/infrastructure/navigation/routes.dart';
import 'package:auth/presentation/author_post/author_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../infrastructure/core/utils/header_app_bar.dart';
import '../../infrastructure/theme/colors.theme.dart';
import '../../infrastructure/theme/text.theme.dart';
import '../../res.dart';

class AuthorPage extends BaseView<AuthorPostController> {
  AuthorPage({super.key});

  @override
  Widget body(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Header.defaultAppBar(controller.appBarName),
        const SizedBox(
          height: 10,
        ),
        Obx(() => Expanded(
              child: ListView.separated(
                itemCount: controller.postData.length,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return postList(index, context);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Divider(color: ColorsTheme.colHint),
                  );
                },
              ),
            ))
      ],
    );
  }


  postList(index, context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Get.toNamed(Routes.postDetail, arguments: [
              controller.postData[index]['userId']
            ]);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 15),
            child: Column (
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Title: ${controller.postData[index]['title']}",
                  style: mediumTextStyle(
                      fontSize: dimen14, color: ColorsTheme.colBlack),
                ),
                Text("Author Name: ${controller.getAuthorName(controller.postData[index]["userId"])}",
                  style: regularTextStyle(
                      fontSize: dimen13, color: ColorsTheme.colBlack),
                ),


              ],
            ),
          ),
        ),
      ],
    );
  }
}
