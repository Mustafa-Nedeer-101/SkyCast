import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class GeolocationService extends GetxController {
  static get instance => Get.find();

  // Variables
  bool isServiceEnabled = false;

  // Return the current location
  Future<Position> getLocation() async {
    // Check for service
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isServiceEnabled) {
      throw "Location service is no enabled";
    }

    // Check for location permission
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.deniedForever) {
      throw "Location Permission is denied forever";
    } else if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw "Location permission is denied";
      }
    }

    // return location

    Position location = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);

    return location;
  }

  // Return the current Placemark
  Future<List<Placemark>> getPlacemark(double lat, double lon) async {
    try {
      List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);
      return placemark;
    } catch (e) {
      throw "Could not get Placemark";
    }
  }

  //
}
