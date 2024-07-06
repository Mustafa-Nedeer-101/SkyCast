import 'package:flutter/material.dart';
import 'package:skycast/weather/models/forecasting.dart';
import 'package:skycast/utils/constants/sizes.dart';

import '../../../../common/widgets/state.dart';
import '../../../../common/widgets/temperature.dart';

class CurrentSearch extends StatelessWidget {
  const CurrentSearch({
    super.key,
    this.weatherForecast,
  });

  final WeatherForecast? weatherForecast;

  @override
  Widget build(BuildContext context) {
    final String imageUrl = weatherForecast?.current?.condition?.icon ?? '';

    // Ensure the URI starts with 'http://' after replacing 'file://'
    final String httImageUrl = imageUrl.replaceFirst('file://', 'http://');

    // If the URL still starts with '//', add 'http:' prefix
    final String validImageUrl =
        httImageUrl.startsWith('//') ? 'http:$imageUrl' : imageUrl;

    return Column(
      children: [
        TemperatureArea(
          temp: weatherForecast?.current?.tempC ?? 0,
          iconString: validImageUrl,
          desctiption: weatherForecast?.current?.condition?.text ?? '',
        ),
        const SizedBox(
          height: CSizes.spaceBtwSections,
        ),
        CurrentWeatherArea(
          windSpeed: weatherForecast?.current?.windKph.toString() ?? '',
          cloud: weatherForecast?.current?.clouds.toString() ?? '',
          humidity: weatherForecast?.current?.humidity.toString() ?? '',
        ),
      ],
    );
  }
}
