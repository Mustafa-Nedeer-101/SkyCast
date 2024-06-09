import 'package:flutter/material.dart';
import 'package:skycast/features/weather/models/forecasting.dart';
import 'package:skycast/features/weather/screens/home/widgets/current_icon.dart';
import 'package:skycast/utils/constants/colors.dart';
import 'package:skycast/utils/constants/image_strings.dart';
import 'package:skycast/utils/constants/sizes.dart';

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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: CSizes.defaultSpace * 2),
      child: Column(
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
      ),
    );
  }
}

//
class TemperatureArea extends StatelessWidget {
  const TemperatureArea({
    super.key,
    required this.temp,
    required this.desctiption,
    required this.iconString,
  });

  final double temp;
  final String desctiption;
  final String iconString;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // Image
        Image.network(
          iconString,
          height: 100,
          width: 100,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
          errorBuilder:
              (BuildContext context, Object error, StackTrace? stackTrace) {
            return const Icon(Icons.error);
          },
        ),

        // Divider
        Container(
          height: 50,
          width: 1,
          color: CColors.black,
        ),

        // Temp
        RichText(
          text: TextSpan(children: [
            TextSpan(
                text: "$temp°",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 68,
                  color: CColors.black,
                )),
            TextSpan(
                text: desctiption,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.grey,
                )),
          ]),
        ),
      ],
    );
  }
}

//
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
