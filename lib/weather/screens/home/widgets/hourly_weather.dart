import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skycast/common/shimmers/hourly_weather_shimmer.dart';
import 'package:skycast/weather/controllers/weather_controller.dart';
import 'package:skycast/weather/models/forecasting.dart';
import 'package:skycast/weather/screens/home/widgets/hourly_icon.dart';

class HourlyWeather extends StatelessWidget {
  const HourlyWeather({super.key});

  @override
  Widget build(BuildContext context) {
    final WeatherController controller = WeatherController.instance;

    return Obx(() {
      // Loading
      if (controller.isLoading.value) {
        return const HourlyWeatherShimmer();
      } else {
        return Column(
          children: [
            // Header
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              alignment: Alignment.topCenter,
              child: const Text("Today", style: TextStyle(fontSize: 18)),
            ),

            // Horizontal List
            HourlyList(
              hours: controller.currentWeather.forecast?.forecastday?[0].hours,
            ),
          ],
        );
      }
    });
  }
}

class HourlyList extends StatelessWidget {
  const HourlyList({
    super.key,
    this.hours,
  });

  final List<HourElement>? hours;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => HourlyIcon(
                index: -1,
                cardIndex: index,
                hourElement: hours?[index],
              ),
          itemCount: hours?.length),
    );
  }
}
