import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:real_estate_app/gen/assets.gen.dart';
import 'package:real_estate_app/utils/app_colors.dart';
import 'package:real_estate_app/utils/app_theme.dart';
import 'package:real_estate_app/utils/ui_utils.dart';
import 'package:stacked/stacked.dart';
import 'package:image/image.dart' as img;
import 'package:flutter/services.dart';

class MapViewModel extends BaseViewModel {
  BitmapDescriptor? customIcon;

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

  Future<void> loadCustomMarker(BuildContext context,
      {bool loadPriceMarker = false}) async {
    try {
      // Load the image from assets
      ByteData byteData;
      if (loadPriceMarker) {
        byteData = await bitmapDescriptorFromSvgAsset(context, '\$500') ??
            await DefaultAssetBundle.of(context)
                .load('assets/icons/orange_container.png');
      } else {
        byteData = await DefaultAssetBundle.of(context)
            .load('assets/icons/orange_container.png');
      }
      final Uint8List imageData = byteData.buffer.asUint8List();

      // Decode the image
      img.Image? originalImage = img.decodeImage(imageData);

      // Resize the image (increase the size)
      img.Image resizedImage = img.copyResize(originalImage!,
          width: loadPriceMarker ? 180 : 125, height: 125);

      // Convert the image to a Uint8List
      final Uint8List resizedImageData =
          Uint8List.fromList(img.encodePng(resizedImage));

      // Create a BitmapDescriptor from the resized image
      customIcon = BitmapDescriptor.fromBytes(resizedImageData);
      notifyListeners();
    } catch (e, stackTrace) {
      logThis(' ************** failed to load custom marker: $e');
      logThis('stackTrace is $stackTrace');
    }
  }

  Future<ByteData?> bitmapDescriptorFromSvgAsset(
      BuildContext context, String price) async {
    // Read SVG file as String

    String svgStrings =
        '''<svg xmlns="http://www.w3.org/2000/svg" width="100" height="50" viewBox="0 0 100 50">
    <rect x="5" y="5" rx="10" ry="10" width="190" height="140" style="fill:#FFA500;stroke-width:1;stroke:#FFA500"/>
     <text x="50" y="30" font-family="Arial" font-size="26" fill="white" text-anchor="middle" dominant-baseline="middle">$price</text> 
</svg>
''';

    // Convert to ui.Picture
    final PictureInfo pictureInfo =
        await vg.loadPicture(SvgStringLoader(svgStrings), null);

    // Convert to ui.Image. toImage() takes width and height as parameters
    // you need to find the best size to suit your needs and take into account the
    // screen DPI
    ui.Image image = await pictureInfo.picture.toImage(180, 125);
    return await image.toByteData(format: ui.ImageByteFormat.png);
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

  Set<Marker> getMarkers() {
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

  void onMenuItemSelected(int value, {required BuildContext context}) {
// if value 1 show dialog
    selectedIndex = value;
    if (value == 1) {
      currentMenuIcon =
          const Icon(Icons.verified_user, color: Pallete.whiteColor);
      loadCustomMarker(context, loadPriceMarker: false);
      // if value 2 show dialog
    } else if (value == 2) {
      currentMenuIcon = Assets.icons.wallet.svg(
          width: 20,
          height: 20,
          colorFilter:
              const ColorFilter.mode(Pallete.whiteColor, BlendMode.srcIn));
      loadCustomMarker(context, loadPriceMarker: true);
      // if value 3 show dialog
    } else if (value == 3) {
      currentMenuIcon = Assets.icons.basketShopping.svg(
          width: 20,
          height: 20,
          colorFilter:
              const ColorFilter.mode(Pallete.whiteColor, BlendMode.srcIn));
      loadCustomMarker(context, loadPriceMarker: false);
      // if value 4 show dialog
    } else if (value == 4) {
      currentMenuIcon = Assets.icons.layerGroup.svg(
          width: 20,
          height: 20,
          colorFilter:
              const ColorFilter.mode(Pallete.whiteColor, BlendMode.srcIn));
      loadCustomMarker(context, loadPriceMarker: false);
    }
    notifyListeners();
  }

  Color getIconColor(int index) {
    return selectedIndex == index ? kPrimaryColor : kSecondary;
  }
}
