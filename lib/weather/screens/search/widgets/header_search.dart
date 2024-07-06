import 'package:flutter/material.dart';
import 'package:skycast/weather/models/forecasting.dart';
import 'package:skycast/utils/constants/colors.dart';
import 'package:skycast/utils/constants/sizes.dart';

class HeaderSearch extends StatelessWidget {
  const HeaderSearch({super.key, this.weatherForecast});

  final WeatherForecast? weatherForecast;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
        child: RichText(
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              children: <TextSpan>[
                // City name with its own style
                TextSpan(
                  text: weatherForecast?.location?.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: CColors.secondary,
                  ),
                ),

                // Comma and space
                const TextSpan(
                  text: ', ',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),

                TextSpan(
                  text: weatherForecast?.location?.country,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              ],
            )));
  }
}
