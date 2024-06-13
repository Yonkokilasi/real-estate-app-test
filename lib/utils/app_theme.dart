import 'package:flutter/material.dart';
import 'package:real_estate_app/utils/app_colors.dart';

class Pallete {
  static const whiteColor = Colors.white;
  static const lightGrey = Color(0xFFF8F8F8);

  static var lightModeAppTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: lightGrey,
    appBarTheme: const AppBarTheme(
      backgroundColor: whiteColor,
      elevation: 0,
      iconTheme: IconThemeData(
        color: whiteColor,
      ),
    ),
    primaryColor: kPrimaryColor,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'Euclid',
        color: kSecondary,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Euclid',
        color: kAccent,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: TextStyle(
        fontFamily: 'Euclid',
        color: kAccent,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Euclid',
        color: kAccent,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: TextStyle(
        fontFamily: 'Euclid',
        color: kSecondary,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Euclid',
        color: kSecondary,
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Euclid',
        color: kSecondary,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Euclid',
        color: kSecondary,
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}
