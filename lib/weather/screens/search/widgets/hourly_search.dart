import 'package:flutter/material.dart';
import 'package:skycast/weather/models/forecasting.dart';
import 'package:skycast/weather/screens/home/widgets/hourly_icon.dart';

class HourlySearch extends StatelessWidget {
  const HourlySearch({super.key, this.weatherForecast});

  final WeatherForecast? weatherForecast;
  @override
  Widget build(BuildContext context) {
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
          hours: weatherForecast?.forecast?.forecastday?[0].hours,
        ),
      ],
    );
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
                index: 0,
                cardIndex: index,
                hourElement: hours?[index],
              ),
          itemCount: hours?.length),
    );
  }
}
