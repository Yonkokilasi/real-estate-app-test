import 'package:flutter/material.dart';
import 'package:real_estate_app/utils/app_theme.dart';

import 'screens/home.dart';

class RealEstateApp extends StatefulWidget {
  const RealEstateApp({super.key});

  @override
  State<RealEstateApp> createState() => _RealEstateAppState();
}

class _RealEstateAppState extends State<RealEstateApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Real Estate App',
      theme: Pallete.lightModeAppTheme,
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
