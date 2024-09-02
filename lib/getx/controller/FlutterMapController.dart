import 'package:ecommerce/getx/controller/NotificationController.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';
import 'package:ecommerce/basic_flutter/LocationDetails.dart';

class MapScreenController extends GetxController {
  final NotificationController notificationController;

  MapScreenController(this.notificationController);

  final Rx<LatLng> point = const LatLng(40.730610, -73.935242).obs;
  final Rx<LocationDetails> locationDetails = LocationDetails().obs;
  final MapController mapController = MapController();

  Future<void> citName() async {
    try {
      List<Placemark> placeMark = await placemarkFromCoordinates(
          point.value.latitude, point.value.longitude);
      locationDetails.value.setCountry(placeMark[0].country ?? '');
      locationDetails.value.setStreet(placeMark[0].street ?? '');
      locationDetails.value.setZipCode(placeMark[0].postalCode ?? '');
    }
    catch (e) {
      Get.snackbar(
        'Error',
        'No location found',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    }
  }

  void onMapTap(LatLng newPoint) {
    point.value = newPoint;
    citName();
  }

  void onFloatingActionButtonPressed() {
    Get.back(result: locationDetails.value);
    notificationController.onFloatingActionButtonPressed();
  }
}