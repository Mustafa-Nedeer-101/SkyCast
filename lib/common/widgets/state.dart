//
import 'package:flutter/material.dart';

import '../../utils/constants/image_strings.dart';
import '../../weather/screens/home/widgets/current_icon.dart';

class CurrentWeatherArea extends StatelessWidget {
  const CurrentWeatherArea({
    super.key,
    required this.windSpeed,
    required this.cloud,
    required this.humidity,
  });

  final String windSpeed;
  final String cloud;
  final String humidity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Windspeed
        CurrentIcon(imageUrl: CImages.windspeedIcon, info: '$windSpeed km/h'),

        // Clouds
        CurrentIcon(imageUrl: CImages.cloudsIcon, info: '$cloud%'),

        // Humidity
        CurrentIcon(imageUrl: CImages.humidityIcon, info: '$humidity%'),
      ],
    );
  }
}
