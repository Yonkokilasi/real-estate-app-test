import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:real_estate_app/app.dart';
import 'package:real_estate_app/utils/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Pallete.whiteColor,
        statusBarBrightness: Brightness.dark),
  );
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const RealEstateApp());
}
