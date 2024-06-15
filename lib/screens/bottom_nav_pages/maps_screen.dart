import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:real_estate_app/gen/assets.gen.dart';
import 'package:real_estate_app/utils/app_colors.dart';
import 'package:real_estate_app/utils/app_theme.dart';
import 'package:real_estate_app/utils/maps_styling.dart';
import 'package:stacked/stacked.dart';

import '../../viewmodels/map_viewmodel.dart';

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
    zoom: 10.41,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return ViewModelBuilder<MapViewModel>.reactive(
      viewModelBuilder: () => MapViewModel(),
      onViewModelReady: (viewModel) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          viewModel.loadCustomMarker(context);
          setState(() {});
        });
      },
      builder: (BuildContext context, MapViewModel viewModel, Widget? child) {
        return Stack(
          children: [
            Positioned(
              child: GoogleMap(
                buildingsEnabled: false,
                zoomControlsEnabled: false,
                mapType: MapType.normal,
                markers: viewModel.getMarkers(),
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
                  )
                      .animate()
                      .fade(
                        duration: 1800.ms,
                        delay: 1000.ms,
                      )
                      .scale(delay: 1200.ms),
                  const SizedBox(
                    width: 6,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child:
                        Assets.icons.configuration.svg(width: 20, height: 20),
                  )
                      .animate()
                      .fade(
                        duration: 1800.ms,
                        delay: 1000.ms,
                      )
                      .scale(delay: 1000.ms),
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
              )
                  .animate()
                  .fade(
                    duration: 1800.ms,
                    delay: 1000.ms,
                  )
                  .scale(delay: 1000.ms),
            ),
            Positioned(
              bottom: 150.h,
              left: 30,
              child: FloatingActionButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                onPressed: () {},
                materialTapTargetSize: MaterialTapTargetSize.padded,
                backgroundColor: const Color(0xff737373),
                child: PopupMenuButton<int>(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  icon: viewModel.currentMenuIcon,
                  itemBuilder: (context) => [
                    // PopupMenuItem 1
                    PopupMenuItem(
                      value: 1,
                      // row with 2 children
                      child: Row(
                        children: [
                          Icon(Icons.verified_user,
                              color: viewModel.getIconColor(0)),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Cosy Areas",
                            style: textTheme.bodyMedium?.copyWith(
                              color: viewModel.getIconColor(0),
                            ),
                          )
                        ],
                      ),
                    ),
                    // PopupMenuItem 2
                    PopupMenuItem(
                      value: 2,
                      // row with two children
                      child: Row(
                        children: [
                          Assets.icons.wallet.svg(
                            width: 20,
                            height: 20,
                            colorFilter: ColorFilter.mode(
                                viewModel.getIconColor(1), BlendMode.srcIn),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Price",
                            style: textTheme.bodyMedium?.copyWith(
                              color: viewModel.getIconColor(1),
                            ),
                          )
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 3,
                      // row with two children
                      child: Row(
                        children: [
                          Assets.icons.basketShopping.svg(
                              width: 20,
                              height: 20,
                              colorFilter: ColorFilter.mode(
                                  viewModel.getIconColor(2), BlendMode.srcIn)),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Infrastructure",
                            style: textTheme.bodyMedium?.copyWith(
                              color: viewModel.getIconColor(2),
                            ),
                          )
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 4,
                      // row with two children
                      child: Row(
                        children: [
                          Assets.icons.layerGroup.svg(
                              width: 20,
                              height: 20,
                              colorFilter: ColorFilter.mode(
                                  viewModel.getIconColor(3), BlendMode.srcIn)),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Without any layer",
                            style: textTheme.bodyMedium?.copyWith(
                              color: viewModel.getIconColor(3),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                  offset: const Offset(-5, -155),
                  color: Pallete.cardBackground,
                  elevation: 2,
                  // on selected we show the dialog box
                  onSelected: (value) {
                    viewModel.onMenuItemSelected(value, context: context);
                  },
                ),
              )
                  .animate()
                  .fade(
                    duration: 1800.ms,
                    delay: 1000.ms,
                  )
                  .scale(delay: 1000.ms),
            ),
            Positioned(
              bottom: 100.h,
              left: 30,
              child: FloatingActionButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                onPressed: () {
                  viewModel.goToTheLake(_controller);
                },
                materialTapTargetSize: MaterialTapTargetSize.padded,
                backgroundColor: const Color(0xff737373),
                child: const Icon(
                  Icons.near_me,
                  size: 20.0,
                  color: Colors.white,
                ),
              )
                  .animate()
                  .fade(
                    duration: 1800.ms,
                    delay: 1000.ms,
                  )
                  .scale(delay: 1000.ms),
            ),
          ],
        );
      },
    );
  }
}
