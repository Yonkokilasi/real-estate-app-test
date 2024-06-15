
import 'package:flutter/material.dart';
import 'package:real_estate_app/utils/app_colors.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  int _selectedBottomNavIndex = 2;
  int get selectedBottomNavIndex => _selectedBottomNavIndex;
  set selectedBottomNavIndex(int value) {
    _selectedBottomNavIndex = value;
    notifyListeners();
  }

  void onBottomNavItemTapped(int index) {
    selectedBottomNavIndex = index;
  }

  Color getColor(int currentIndex) {
    return _selectedBottomNavIndex == currentIndex ? kPrimaryColor : Colors.black;
  }
}
