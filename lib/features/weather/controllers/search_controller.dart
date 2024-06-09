import 'package:get/get.dart';
import 'package:skycast/common/widgets/loaders/loaders.dart';
import 'package:skycast/data/services/weather_api_service.dart';
import 'package:skycast/features/weather/controllers/location_controller.dart';
import 'package:skycast/features/weather/models/forecasting.dart';

class WeatherSearchController extends GetxController {
  static WeatherSearchController get instance => Get.find();

  // Variables
  final LocationController locationController = LocationController.instance;
  final WeatherApiService service = WeatherApiService.instance;
  RxList<Location> locationsList = <Location>[].obs;
  Location selectedLocation = Location();
  RxBool isLoading = true.obs;

  getSearchCities(String query) async {
    try {
      // Start Loading
      isLoading.value = true;

      // Get Locations from Api Service
      final locations = await service.fetchSearchCities(query);

      // Assign them to locationsList
      locationsList.assignAll(locations ?? []);

      // End Loading
      isLoading.value = false;
      return locations;
    } catch (e) {
      CustomLoaders.errorSnackbar(title: 'Error', message: e);

      // EndLoading
      isLoading.value = false;

      return [];
    }
  }

  //
}
