import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate_app/utils/ui_utils.dart';

class HouseItem extends StatelessWidget {
  final String imageUrl;
  final String houseName;
  final double? borderRadius;
  final double width;
  final double height;
  final EdgeInsetsGeometry? margin;
  const HouseItem({
    super.key,
    required this.imageUrl,
    required this.houseName,
    this.borderRadius,
    required this.width,
    required this.height,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        getCachedNetworkImage(
          context: context,
          width: width,
          height: height,
          borderRadius: 20,
          margin: const EdgeInsets.only(right: 3),
          imageUrl: imageUrl,
        ),
        Positioned(
          left: 8,
          bottom: 8,
          right: 8,
          child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0.0, end: 280.0),
            duration: const Duration(milliseconds: 5000),
            builder: (context, double width, child) {
              return Stack(
                children: [
                  Container(
                    width: this.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xffD2DAD6).withOpacity(.8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 10.w),
                        Text(houseName),
                        Spacer(),
                        const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
