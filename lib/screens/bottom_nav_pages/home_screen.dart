import 'package:flutter/material.dart';
import 'package:real_estate_app/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<String> potentialPortraits = [
  'https://images.unsplash.com/photo-1540331547168-8b63109225b7?q=80&w=2165&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://images.unsplash.com/photo-1540331547168-8b63109225b7?q=80&w=2165&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
];

// background-color: #ffffff;
// background-image: linear-gradient(180deg, #ffffff 0%, #f9ecde 50%, #f9d8b1 100%);

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 13, top: 10),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFFFFFFF),
            Color(0xFFF9ECDE),
            Color(0xFFF9D8B1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
          stops: [0.0, 0.5, 0.6],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Location and Profile Picture Row
          Row(
            children: [
              Container(
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
                radius: 30,
                foregroundImage: NetworkImage(
                  potentialPortraits.first,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            'Hi, Marina',
            style: TextStyle(fontSize: 24, color: kAccent),
          )
        ],
      ),
    );
  }
}
