import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/colors.theme.dart';
import '../../theme/text.theme.dart';

class Header {
  static defaultAppBar(String title) {
    return Material(
      elevation: 10,
      color: ColorsTheme.colWhite,
      child: Container(
        padding: EdgeInsets.only(bottom: 10,left: 15,right: 15),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(
                size: 30,
                Icons.arrow_back,
                  color: Colors.blueGrey
              ),
            ),
            Flexible(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: appBarTextStyle(
                  fontSize: dimen18,
                  color: ColorsTheme.colBlack,
                ),
              ),
            ),
           SizedBox(width: 30,)
          ],
        ),
      ),
    );
  }

  static double appBarHeight = 50.0;
}
