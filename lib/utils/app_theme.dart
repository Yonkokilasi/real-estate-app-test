import 'package:flutter/material.dart';
import 'package:real_estate_app/utils/app_colors.dart';

class Pallete {
  static const whiteColor = Colors.white;

  static var lightModeAppTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: whiteColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: whiteColor,
      elevation: 0,
      iconTheme: IconThemeData(
        color: whiteColor,
      ),
    ),
    primaryColor: kPrimaryColor,
  );
}
