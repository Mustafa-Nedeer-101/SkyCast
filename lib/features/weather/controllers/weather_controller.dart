import 'package:get/get.dart';
import 'package:skycast/common/widgets/loaders/loaders.dart';
import 'package:skycast/data/services/weather_api_service.dart';
import 'package:skycast/features/weather/controllers/location_controller.dart';
import 'package:skycast/features/weather/models/forecasting.dart';

class WeatherController extends GetxController {
  static WeatherController get instance => Get.find();

  // Varialbles
  final LocationController locationController = LocationController.instance;
  final WeatherApiService weatherApiService = WeatherApiService.instance;
  WeatherForecast currentWeather = WeatherForecast();
  RxBool isLoading = true.obs;

  @override
  onInit() async {
    await locationController.getLocation();

    // Set currentWeather varialbe
    currentWeather = await getCurrentWeather(
        locationController.lattitude.value, locationController.longitude.value);
    isLoading.value = false;

    // Set up the ever listener to react to future changes
    everAll([locationController.lattitude, locationController.longitude],
        (val) => onlocationChanged());

    super.onInit();
  }

  // when location changes
  void onlocationChanged() {
    getCurrentWeather(locationController.lattitude.value,
            locationController.longitude.value)
        .then((value) => currentWeather = value);
  }

  // Get Current Weather
  Future<WeatherForecast> getCurrentWeather(
      double lattitude, double longitude) async {
    try {
      final String query = '$lattitude, $longitude';
      final currentWeather =
          await weatherApiService.fetchForcastingWeather(query);

      return currentWeather;
    } catch (e) {
      CustomLoaders.errorSnackbar(title: 'Error Occured', message: e);
      return Future.error(e);
    }
  }

  //
}
