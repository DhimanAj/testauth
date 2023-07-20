import 'package:auth/infrastructure/theme/text.theme.dart';
import 'package:flutter/material.dart';

import 'colors.theme.dart';

AppBarTheme appBarTheme = const AppBarTheme();

appBarIconTitle({required Function onTapFunction, String? title, titleStyle}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      GestureDetector(
        onTap: () {
          onTapFunction();
        },
        child: Container(
            margin: const EdgeInsets.only(right: 6),
            padding: const EdgeInsets.all(8),
            child: Icon(
              Icons.arrow_back,
              size: 35,
              color: ColorsTheme.colPrimary,
            )),
      ),
      title == null
          ? Container()
          : Padding(
              padding: const EdgeInsets.only(bottom: 2),
              child: Text(
                title,
                style:
                    titleStyle ?? appBarTextStyle(color: ColorsTheme.colBlack),
              ),
            )
    ],
  );
}
