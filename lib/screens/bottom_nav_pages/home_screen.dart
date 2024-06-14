import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate_app/utils/app_colors.dart';
import 'package:real_estate_app/utils/app_theme.dart';
import 'package:real_estate_app/utils/ui_utils.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<String> potentialPortraits = [
  'https://images.unsplash.com/photo-1540331547168-8b63109225b7?q=80&w=2165&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://images.unsplash.com/photo-1540331547168-8b63109225b7?q=80&w=2165&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
];
List<String> apartmentInteriors = [
  'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://images.unsplash.com/photo-1615873968403-89e068629265?q=80&w=1632&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://images.unsplash.com/photo-1615529182904-14819c35db37?q=80&w=1160&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://images.unsplash.com/photo-1564078516393-cf04bd966897?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://images.unsplash.com/photo-1618221195710-dd6b41faaea6?q=80&w=1400&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
];

// background-color: #ffffff;
// background-image: linear-gradient(180deg, #ffffff 0%, #f9ecde 50%, #f9d8b1 100%);

class _HomeScreenState extends State<HomeScreen> {
  TextTheme get textTheme => Theme.of(context).textTheme;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFFFFF),
              Color(0xFFF9ECDE),
              Color(0xFFF9D8B1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            stops: [0.0, 0.2, 0.4],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Location and Profile Picture Row
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Row(
                children: [
                  Material(
                    elevation: 0.2,
                    borderRadius: BorderRadius.circular(14),
                    child: Container(
                      padding: const EdgeInsets.all(13),
                      decoration: BoxDecoration(
                        color: Pallete.whiteColor,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.location_on, color: kAccent),
                          Text(
                            'Saint Petersburg',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: kAccent),
                          ),
                        ],
                      ),
                    ),
                  )
                      .animate()
                      .fadeIn(
                          duration: 3000.ms, curve: Curves.easeIn, begin: 0.0)
                      .slide(
                        delay: 800.ms,
                        curve: Curves.easeIn,
                        begin: const Offset(-1.0, 0.0),
                        end: Offset.zero,
                      ),
                  const Spacer(),
                  CircleAvatar(
                    radius: 28,
                    //TODO use cached network image
                    foregroundImage: NetworkImage(
                      potentialPortraits.first,
                    ),
                  ).animate().slide(duration: 3000.ms).scale(delay: 500.ms),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Hi, Marina',
                    style: TextStyle(fontSize: 22.5, color: kAccent),
                  ).animate().fadeIn(duration: 1000.ms).show(delay: 1000.ms),
                  const Text(
                    'let\'s select your \nperfect place',
                    style: TextStyle(
                        fontSize: 35,
                        color: kSecondary,
                        fontWeight: FontWeight.w400),
                  )
                      .animate()
                      .fadeIn(
                        duration: 500.ms,
                        curve: Curves.easeIn,
                        begin: 0.0,
                      )
                      .slideY(begin: -1.0, end: 0.0, delay: 2500.ms),
                ],
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            // circular container
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Container(
                    height: 0.21.sh,
                    width: 0.2.sh,
                    decoration: BoxDecoration(
                      color: kPrimaryColor.withOpacity(0.7),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            'BUY',
                            style: textTheme.bodyMedium?.copyWith(
                              color: Pallete.whiteColor,
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Countup(
                            begin: 0,
                            end: 1034,
                            duration: const Duration(seconds: 6),
                            separator: ' ',
                            style: textTheme.displayLarge?.copyWith(
                              color: Pallete.whiteColor,
                              fontSize: 35,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'offers',
                            style: textTheme.bodyMedium?.copyWith(
                              color: Pallete.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ).animate().fade(duration: 1200.ms).scale(delay: 2700.ms),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 0.21.sh,
                    width: 0.2.sh,
                    decoration: BoxDecoration(
                      color: Pallete.whiteColor,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                        child: Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'RENT',
                          style: textTheme.bodyMedium?.copyWith(
                            color: kAccent,
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Countup(
                          begin: 0,
                          end: 2212,
                          duration: const Duration(seconds: 6),
                          separator: ' ',
                          style: textTheme.displayLarge?.copyWith(
                            color: kAccent,
                            fontSize: 35,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'offers',
                          style: textTheme.bodyMedium?.copyWith(
                            color: kAccent,
                          ),
                        ),
                      ],
                    )),
                  ).animate().fade(duration: 1200.ms).scale(delay: 2700.ms),
                ],
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Container(
              height: 0.79.sh,
              width: 1.sw,
              decoration: const BoxDecoration(
                color: Pallete.whiteColor,
                // top corner with border radius
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    width: 1.sw,
                    height: 180.h,
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Pallete.whiteColor,
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          image: NetworkImage(apartmentInteriors.first),
                          fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getCachedNetworkImage(
                          context: context,
                          width: 0.47.sw,
                          height: 260.h,
                          borderRadius: 20,
                          margin: const EdgeInsets.only(right: 3),
                          imageUrl: apartmentInteriors[2],
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Column(
                          children: [
                            getCachedNetworkImage(
                              context: context,
                              width: 0.47.sw,
                              height: 135.h,
                              borderRadius: 20,
                              margin: const EdgeInsets.only(bottom: 12),
                              imageUrl: apartmentInteriors[3],
                            ),
                            getCachedNetworkImage(
                              context: context,
                              width: 0.47.sw,
                              height: 135.h,
                              borderRadius: 20,
                              margin: const EdgeInsets.only(bottom: 12),
                              imageUrl: apartmentInteriors[1],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
                .animate()
                .fadeIn(duration: 2000.ms, curve: Curves.easeIn, begin: 0.0)
                .slide(
                  begin: const Offset(0.0, 1.0),
                  end: Offset.zero,
                  curve: Curves.easeIn,
                  delay: 2500.ms,
                ),
          ],
        ),
      ),
    );
  }
}
