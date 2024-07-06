import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skycast/services/weather_api_service.dart';
import 'package:skycast/weather/controllers/location_controller.dart';
import 'package:skycast/weather/controllers/weather_controller.dart';
import 'package:skycast/weather/screens/home/widgets/comfort_level.dart';
import 'package:skycast/weather/screens/home/widgets/current_weather.dart';
import 'package:skycast/weather/screens/home/widgets/daily_weather.dart';
import 'package:skycast/weather/screens/home/widgets/hourly_weather.dart';
import 'package:skycast/weather/screens/home/widgets/header.dart';
import 'package:skycast/utils/constants/sizes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final LocationController locationController =
        Get.find<LocationController>();

    Get.put(WeatherApiService(), permanent: true);

    final WeatherController controller =
        Get.put(WeatherController(), permanent: true);

    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          // Still Loading
          if (locationController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          // Location not found
          if (locationController.lattitude.value == 0.0 &&
              locationController.longitude.value == 0.0) {
            return const Center(
              child: Icon(
                Icons.error,
                size: CSizes.iconLg,
              ),
            );
          }

          return ListView(
            shrinkWrap: true,
            children: [
              const SizedBox(
                height: CSizes.defaultSpace,
              ),

              // Header
              const HomeHeader(),

              const SizedBox(
                height: CSizes.spaceBtwSections,
              ),

              // Current Section
              const CurrentWeather(),

              // Space
              const SizedBox(
                height: CSizes.spaceBtwSections,
              ),

              // Hourly Section
              const HourlyWeather(),

              // Daily Section
              const DailyWeather(),

              // Divider Line
              Obx(() {
                if (controller.isLoading.value) {
                  return Container(
                    height: CSizes.spaceBtwInputFields,
                  );
                } else {
                  return const Divider(
                    indent: CSizes.defaultSpace,
                    endIndent: CSizes.defaultSpace,
                  );
                }
              }),

              // Comfort Section
              const HomeComfort(),
            ],
          );
        }),
      ),
    );
  }
}
