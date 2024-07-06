import 'package:flutter/material.dart';
import 'package:skycast/weather/controllers/search_controller.dart';
import 'package:skycast/weather/models/forecasting.dart';
import 'package:skycast/weather/screens/search/widgets/comfort_search.dart';
import 'package:skycast/weather/screens/search/widgets/current_search.dart';
import 'package:skycast/weather/screens/search/widgets/daily_search.dart';
import 'package:skycast/weather/screens/search/widgets/header_search.dart';
import 'package:skycast/weather/screens/search/widgets/hourly_search.dart';
import 'package:skycast/utils/constants/sizes.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.zero,
        child: FutureBuilder(
            future: WeatherSearchController.getWeatherForecast(),
            builder: (context, snapshot) {
              // Loading and error
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return const Center(
                  child: Icon(Icons.error),
                );
              }

              // Actual Data
              final WeatherForecast? weather = snapshot.data;

              return ListView(
                shrinkWrap: true,
                children: [
                  const SizedBox(
                    height: CSizes.defaultSpace,
                  ),

                  // Header
                  HeaderSearch(
                    weatherForecast: weather,
                  ),

                  const SizedBox(
                    height: CSizes.spaceBtwSections,
                  ),

                  // Current Section
                  CurrentSearch(
                    weatherForecast: weather,
                  ),

                  // Space
                  const SizedBox(
                    height: CSizes.spaceBtwSections,
                  ),

                  // Hourly Section
                  HourlySearch(
                    weatherForecast: weather,
                  ),

                  // Daily Section
                  DailySearch(
                    weatherForecast: weather,
                  ),

                  // Divider Line
                  const Divider(
                    indent: CSizes.defaultSpace,
                    endIndent: CSizes.defaultSpace,
                  ),

                  // Comfort Section
                  ComfortSearch(
                    weatherForecast: weather,
                  ),
                ],
              );
            }),
      ),
    );
  }
}
