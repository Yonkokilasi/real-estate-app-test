import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:real_estate_app/gen/assets.gen.dart';
import 'package:real_estate_app/screens/bottom_nav_pages/home_screen.dart';
import 'package:real_estate_app/screens/bottom_nav_pages/maps_screen.dart';
import 'package:real_estate_app/utils/app_colors.dart';
import 'package:real_estate_app/utils/app_theme.dart';
import 'package:real_estate_app/viewmodels/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static final List<Widget> _pages = <Widget>[
    const MapsScreen(),
    Container(),
    const HomeScreen(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (BuildContext context, HomeViewModel model, Widget? child) =>
          Scaffold(
        backgroundColor: Pallete.lightGrey,
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
            onTap: model.onBottomNavItemTapped,
            currentIndex: model.selectedBottomNavIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: kPrimaryColor,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            unselectedItemColor: const Color(0xff9E9E9E),
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: model.getColor(0), shape: BoxShape.circle),
                  child: const Icon(
                    Icons.search,
                    color: Pallete.whiteColor,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: model.getColor(1), shape: BoxShape.circle),
                  child: const Icon(
                    Icons.sms,
                    color: Colors.white,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: model.getColor(2), shape: BoxShape.circle),
                  child: Assets.icons.homeSvg.svg(
                    height: 30,
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: model.getColor(3), shape: BoxShape.circle),
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: model.getColor(4), shape: BoxShape.circle),
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
                label: '',
              )
            ],
          ),
        )
            .animate()
            .fadeIn(
              duration: 1000.ms,
              delay: 7800.ms,
              curve: Curves.easeIn,
              begin: 0.0,
            )
            .slideY(begin: 1.0, end: 0.0, delay: 2000.ms),
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          child: SafeArea(
            child: _pages.elementAt(model.selectedBottomNavIndex),
          ),
        ),
      ),
    );
  }
}
