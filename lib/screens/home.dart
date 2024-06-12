import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:real_estate_app/screens/bottom_nav_pages/home_screen.dart';
import 'package:real_estate_app/utils/app_colors.dart';
import 'package:real_estate_app/utils/app_theme.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedBottomNavIndex = 0;
  static final List<Widget> _pages = <Widget>[
    Container(),
    Container(),
    const HomeScreen(),
    Container(),
    Container(),
  ];
  // TODO see about moving these to a view model
  void onBottomNavItemTapped(int index) {
    setState(() {
      selectedBottomNavIndex = index;
    });
  }

  Color getColor(int index, int currentIndex) {
    return index == currentIndex ? kPrimaryColor : Pallete.whiteColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: kSecondary,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 1,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          onTap: onBottomNavItemTapped,
          currentIndex: selectedBottomNavIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: kPrimaryColor,
            showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedItemColor: const Color(0xff9E9E9E),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: getColor(selectedBottomNavIndex, 1),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.message,
                color: getColor(selectedBottomNavIndex, 1),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: getColor(selectedBottomNavIndex, 0),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.monitor_heart_outlined,
                color: getColor(selectedBottomNavIndex, 2),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: getColor(selectedBottomNavIndex, 2),
              ),
              label: '',
            )
          ],
        ),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: SafeArea(child: _pages.elementAt(selectedBottomNavIndex)),
      ),
    );
  }
}
