import 'package:get/get.dart';
import 'package:skycast/common/loaders/loaders.dart';
import 'package:skycast/services/weather_api_service.dart';
import 'package:skycast/weather/controllers/location_controller.dart';
import 'package:skycast/weather/models/forecasting.dart';

class WeatherSearchController extends GetxController {
  static WeatherSearchController get instance => Get.find();

  // Variables
  final LocationController locationController = LocationController.instance;
  static final WeatherApiService service = WeatherApiService.instance;
  static RxList<Location> locationsList = <Location>[].obs;
  static Location selectedLocation = Location();
  static RxBool isLoading = true.obs;

  // Needed for searching for weather
  static String query = '';

  static getSearchCities(String query) async {
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

  // Future function to get Weather for a location
  static Future<WeatherForecast> getWeatherForecast() async {
    if (selectedLocation.lat == null && selectedLocation.lon == null) {
      final result = service.fetchForcastingWeather(query);
      return result;
    } else {
      final String query = '${selectedLocation.lat}, ${selectedLocation.lon}';
      final result = service.fetchForcastingWeather(query);

      return result;
    }
  }

  // Reset the variables after poping from the search results
  static void resetVariables() {
    locationsList.value = [];
    selectedLocation = Location();
    isLoading.value = true;

    // Needed for searching for weather
    query = '';
  }

  //
}
