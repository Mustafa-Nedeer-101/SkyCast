import 'package:get/get.dart';
import 'package:skycast/common/loaders/loaders.dart';
import 'package:skycast/services/geolocation_service.dart';

class LocationController extends GetxController {
  static LocationController get instance => Get.find();

  // Variables
  final locationRepo = Get.put(GeolocationService());
  final RxBool isLoading = true.obs;
  final RxDouble lattitude = 0.0.obs;
  final RxDouble longitude = 0.0.obs;

  // instances
  RxBool checkLoading() => isLoading;
  RxDouble getLattitude() => lattitude;
  RxDouble getLongitude() => longitude;

  // Get Current Location
  getLocation() async {
    try {
      final location = await locationRepo.getLocation();

      // Set variables
      lattitude.value = location.latitude;
      longitude.value = location.longitude;
      isLoading.value = false;

      return;
    } catch (e) {
      isLoading.value = false;
      CustomLoaders.errorSnackbar(title: 'Location', message: e.toString());
    }
  }
}
