import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skycast/common/shimmers/current_weather_shimmer.dart';
import 'package:skycast/weather/controllers/weather_controller.dart';
import 'package:skycast/utils/constants/sizes.dart';

import '../../../../common/widgets/state.dart';
import '../../../../common/widgets/temperature.dart';

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final WeatherController controller = WeatherController.instance;
    return Obx(() {
      if (controller.isLoading.value) {
        return const CurrentWeatherShimmer();
      } else {
        final String imageUrl =
            controller.currentWeather.current?.condition?.icon ?? '';

        // Ensure the URI starts with 'http://' after replacing 'file://'
        final String httImageUrl = imageUrl.replaceFirst('file://', 'http://');

        // If the URL still starts with '//', add 'http:' prefix
        final String validImageUrl =
            httImageUrl.startsWith('//') ? 'http:$imageUrl' : imageUrl;

        return Column(
          children: [
            TemperatureArea(
              temp: controller.currentWeather.current?.tempC ?? 0,
              iconString: validImageUrl,
              desctiption:
                  controller.currentWeather.current?.condition?.text ?? '',
            ),
            const SizedBox(
              height: CSizes.spaceBtwSections,
            ),
            CurrentWeatherArea(
              windSpeed:
                  controller.currentWeather.current?.windKph.toString() ?? '',
              cloud: controller.currentWeather.current?.clouds.toString() ?? '',
              humidity:
                  controller.currentWeather.current?.humidity.toString() ?? '',
            ),
          ],
        );
      }
    });
  }
}
