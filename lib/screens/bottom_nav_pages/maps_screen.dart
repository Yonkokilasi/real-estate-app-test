import 'dart:async';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:real_estate_app/gen/assets.gen.dart';
import 'package:real_estate_app/utils/app_colors.dart';
import 'package:real_estate_app/utils/app_theme.dart';
import 'package:real_estate_app/utils/maps_styling.dart';
import 'package:real_estate_app/utils/ui_utils.dart';
import 'package:image/image.dart' as img;

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => MapsScreenState();
}

class MapsScreenState extends State<MapsScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(59.8175, 30.5936),
    zoom: 10.0,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(59.911, 30.3),
      tilt: 59.440717697143555,
      zoom: 17.151926040649414);
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadCustomMarker();
    });
  }

  BitmapDescriptor? customIcon;
  Future<void> _loadCustomMarker() async {
    try {
      // Load the image from assets
      final ByteData byteData = await DefaultAssetBundle.of(context)
          .load('assets/icons/orange_container.png');
      final Uint8List imageData = byteData.buffer.asUint8List();

      // Decode the image
      img.Image? originalImage = img.decodeImage(imageData);

      // Resize the image (increase the size)
      img.Image resizedImage =
          img.copyResize(originalImage!, width: 125, height: 125);

      // Convert the image to a Uint8List
      final Uint8List resizedImageData =
          Uint8List.fromList(img.encodePng(resizedImage));

      // Create a BitmapDescriptor from the resized image
      customIcon = BitmapDescriptor.fromBytes(resizedImageData);
      setState(() {});
    } catch (e, stackTrace) {
      logThis(' ************** failed to load custom marker: $e');
      logThis('stackTrace is $stackTrace');
    }
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Stack(
      children: [
        Positioned(
          child: GoogleMap(
            buildingsEnabled: false,
            zoomControlsEnabled: false,
            mapType: MapType.normal,
            markers: customIcon == null
                ? Set()
                : {
                    Marker(
                      markerId: const MarkerId('1'),
                      position: const LatLng(59.8175, 30.5936),
                      infoWindow: const InfoWindow(
                          title: 'Saint Petersburg', snippet: '5.0'),
                      icon: customIcon!,
                    ),
                    Marker(
                      markerId: const MarkerId('2'),
                      position: const LatLng(59.9505, 30.5936),
                      infoWindow: const InfoWindow(
                          title: 'North of Original', snippet: '5.0'),
                      icon: customIcon!,
                    ),
                    Marker(
                      markerId: const MarkerId('3'),
                      position: const LatLng(59.6845, 30.5936),
                      infoWindow: const InfoWindow(
                          title: 'South of Original', snippet: '5.0'),
                      icon: customIcon!,
                    ),
                    Marker(
                      markerId: const MarkerId('4'),
                      position: const LatLng(59.8175, 30.8982),
                      infoWindow: const InfoWindow(
                          title: 'East of Original', snippet: '5.0'),
                      icon: customIcon!,
                    ),
                    Marker(
                      markerId: const MarkerId('5'),
                      position: const LatLng(59.8175, 30.4450),
                      infoWindow: const InfoWindow(
                          title: 'West of Original', snippet: '5.0'),
                      icon: customIcon!,
                    ),
                    Marker(
                      markerId: const MarkerId('6'),
                      position: const LatLng(59.8840, 30.7624),
                      infoWindow: const InfoWindow(
                          title: 'Northeast of Original', snippet: '5.0'),
                      icon: customIcon!,
                    ),
                  },
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);

              controller.setMapStyle(mapsStylingJson);
            },
          ),
        ),
        Positioned(
          top: 20.h,
          left: 30,
          child: Row(
            children: [
              // search box
              SizedBox(
                width: 0.68.sw,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Saint Petersburg',
                    contentPadding: const EdgeInsets.all(12),
                    hintStyle: textTheme.bodySmall
                        ?.copyWith(color: kSecondary, fontSize: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    filled: true,
                    fillColor: Pallete.whiteColor,
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
                child: Assets.icons.configuration.svg(width: 20, height: 20),
              )
            ],
          ),
        ),
        Positioned(
          bottom: 100.h,
          right: 30,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xff737373),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.sort,
                  size: 20.0,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'List of variants',
                  style: textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 150.h,
          left: 30,
          child: FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            onPressed: _goToTheLake,
            materialTapTargetSize: MaterialTapTargetSize.padded,
            backgroundColor: const Color(0xff737373),
            child: const Icon(
              Icons.filter_list,
              size: 20.0,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          bottom: 100.h,
          left: 30,
          child: FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            onPressed: _goToTheLake,
            materialTapTargetSize: MaterialTapTargetSize.padded,
            backgroundColor: const Color(0xff737373),
            child: const Icon(
              Icons.near_me,
              size: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
