import 'package:flutter/material.dart';

import 'app_bar.theme.dart';
import 'button.theme.dart';
import 'colors.theme.dart';

ThemeData themeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: ColorsTheme.colPrimary,
    primary: ColorsTheme.colPrimary,
    secondary: ColorsTheme.colSecondary,
    brightness: Brightness.dark,
    background: ColorsTheme.colBackground,
  ),
  backgroundColor: ColorsTheme.colBackground,
  primaryColor: ColorsTheme.colPrimary,
  hintColor: ColorsTheme.colBlack,
  appBarTheme: appBarTheme,
  elevatedButtonTheme: buttonTheme,
  fontFamily: "Poppins",
  scaffoldBackgroundColor: Colors.white,
);
