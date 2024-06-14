import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:real_estate_app/gen/assets.gen.dart';
import 'package:real_estate_app/utils/app_colors.dart';
import 'package:real_estate_app/utils/app_theme.dart';
import 'package:stacked/stacked.dart';

class MapViewModel extends BaseViewModel {
  int _selectedIndex = 1;
  int get selectedIndex => _selectedIndex;
  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }

  Widget _currentMenuIcon = Assets.icons.wallet.svg(
      width: 20,
      height: 20,
      colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn));
  Widget get currentMenuIcon => _currentMenuIcon;
  set currentMenuIcon(Widget value) {
    _currentMenuIcon = value;
    notifyListeners();
  }

  Future<void> goToTheLake(Completer<GoogleMapController> _controller) async {
    const CameraPosition _kLake = CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(59.8175, 30.5936),
        tilt: 59.440717697143555,
        zoom: 15.151926040649414);
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  Set<Marker> getMarkers(BitmapDescriptor? customIcon) {
    return <Marker>{
      Marker(
        markerId: const MarkerId('1'),
        position: const LatLng(59.8175, 30.5936),
        infoWindow: const InfoWindow(title: 'Saint Petersburg', snippet: '5.0'),
        icon: customIcon ?? BitmapDescriptor.defaultMarker,
      ),
      Marker(
        markerId: const MarkerId('2'),
        position: const LatLng(59.9505, 30.5936),
        infoWindow:
            const InfoWindow(title: 'North of Original', snippet: '5.0'),
        icon: customIcon ?? BitmapDescriptor.defaultMarker,
      ),
      Marker(
        markerId: const MarkerId('3'),
        position: const LatLng(59.6845, 30.5936),
        infoWindow:
            const InfoWindow(title: 'South of Original', snippet: '5.0'),
        icon: customIcon ?? BitmapDescriptor.defaultMarker,
      ),
      Marker(
        markerId: const MarkerId('4'),
        position: const LatLng(59.8175, 30.8982),
        infoWindow: const InfoWindow(title: 'East of Original', snippet: '5.0'),
        icon: customIcon ?? BitmapDescriptor.defaultMarker,
      ),
      Marker(
        markerId: const MarkerId('5'),
        position: const LatLng(59.8175, 30.4450),
        infoWindow: const InfoWindow(title: 'West of Original', snippet: '5.0'),
        icon: customIcon ?? BitmapDescriptor.defaultMarker,
      ),
      Marker(
        markerId: const MarkerId('6'),
        position: const LatLng(59.8840, 30.7624),
        infoWindow:
            const InfoWindow(title: 'Northeast of Original', snippet: '5.0'),
        icon: customIcon ?? BitmapDescriptor.defaultMarker,
      ),
    };
  }

  void onMenuItemSelected(int value) {
// if value 1 show dialog
    selectedIndex = value;
    if (value == 1) {
      currentMenuIcon =
          const Icon(Icons.verified_user, color: Pallete.whiteColor);
      // if value 2 show dialog
    } else if (value == 2) {
      currentMenuIcon = Assets.icons.wallet.svg(
          width: 20,
          height: 20,
          colorFilter:
              const ColorFilter.mode(Pallete.whiteColor, BlendMode.srcIn));
      // if value 3 show dialog
    } else if (value == 3) {
      currentMenuIcon = Assets.icons.basketShopping.svg(
          width: 20,
          height: 20,
          colorFilter:
              const ColorFilter.mode(Pallete.whiteColor, BlendMode.srcIn));
      // if value 4 show dialog
    } else if (value == 4) {
      currentMenuIcon = Assets.icons.layerGroup.svg(
          width: 20,
          height: 20,
          colorFilter:
              const ColorFilter.mode(Pallete.whiteColor, BlendMode.srcIn));
    }
    notifyListeners();
  }

  Color getIconColor(int index) {
    return selectedIndex == index ? kPrimaryColor : kSecondary;
  }
}
