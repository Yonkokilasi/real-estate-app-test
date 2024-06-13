import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate_app/utils/app_colors.dart';
import 'package:real_estate_app/utils/ui_utils.dart';

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
                        color: Colors.white,
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
                  ),
                  const Spacer(),
                  // CircleAvatar(
                  //   radius: 30,
                  //   //  backgroundColor: Colors.grey,
                  //   child: ClipRRect(
                  //     borderRadius: BorderRadius.circular(100),
                  //     child: FadeInImage.assetNetwork(
                  //       placeholder: 'https://via.placeholder.com/150',
                  //       image:
                  //           'https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  //       fit: BoxFit.contain,
                  //       width: 60,
                  //       height: 60,
                  //     ),
                  //   ),
                  // ),
                  CircleAvatar(
                    radius: 28,
                    foregroundImage: NetworkImage(
                      potentialPortraits.first,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Hi, Marina',
                    style: TextStyle(fontSize: 22.5, color: kAccent),
                  ),
                  Text(
                    'let\'s select your \nperfect place',
                    style: TextStyle(
                        fontSize: 35,
                        color: kSecondary,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Container(
              height: 1.5.sh,
              width: 1.sw,
              decoration: const BoxDecoration(
                color: Colors.white,
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
                      color: Colors.white,
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
                          imageUrl: apartmentInteriors.last,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Column(
                          children: [
                            getCachedNetworkImage(
                              context: context,
                              width: 0.47.sw,
                              height: 130.h,
                              borderRadius: 20,
                              margin: const EdgeInsets.only(bottom: 12),
                              imageUrl: apartmentInteriors[3],
                            ),
                            getCachedNetworkImage(
                              context: context,
                              width: 0.47.sw,
                              height: 130.h,
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
          ],
        ),
      ),
    );
  }
}
