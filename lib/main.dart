import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:real_estate_app/app.dart';
import 'package:real_estate_app/utils/app_theme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Pallete.lightGrey,
        statusBarBrightness: Brightness.dark),
  );
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const RealEstateApp());
}
