import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skycast/common/shimmers/daily_shimmer.dart';
import 'package:skycast/weather/controllers/weather_controller.dart';
import 'package:skycast/weather/models/forecasting.dart';
import 'package:skycast/utils/constants/colors.dart';
import 'package:skycast/utils/formatters/foramtter.dart';

class DailyWeather extends StatelessWidget {
  const DailyWeather({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final WeatherController controller = WeatherController.instance;

    return Obx(() {
      // Loading
      if (controller.isLoading.value) {
        return const DailyWeatherShimmer();
      } else {
        return Container(
          height: 300,
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: const Color(0xffE4E4EE).withAlpha(150),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(bottom: 10),
                child: const Text(
                  "Next Days",
                  style: TextStyle(color: Color(0xff171717), fontSize: 17),
                ),
              ),
              DailyList(
                days: controller.currentWeather.forecast?.forecastday ?? [],
              ),
            ],
          ),
        );
      }
    });
  }
}

class DailyList extends StatelessWidget {
  const DailyList({super.key, required this.days});

  final List<Forecastday> days;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: days.length,
        itemBuilder: (context, index) {
          // If the URL still starts with '//', add 'http:' prefix
          final String imageUrl = days[index].day?.condition?.icon ?? '';
          final String validImageUrl =
              imageUrl.startsWith('//') ? 'http:$imageUrl' : imageUrl;

          // Date as a string
          final String dateString = days[index].date ?? '';
          final String reOrderedDate =
              UFormatterUtils.convertDateFormat(dateString);

          return Column(
            children: [
              Container(
                  height: 60,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Date
                      SizedBox(
                        width: 80,
                        child: Text(
                          UFormatterUtils.formatDateWord(reOrderedDate),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),

                      // Image
                      SizedBox(
                        height: 35,
                        width: 35,
                        child: Image.network(validImageUrl, loadingBuilder:
                            (BuildContext context, Widget child,
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
                        }, errorBuilder: (BuildContext context, Object error,
                            StackTrace? stackTrace) {
                          return const Icon(Icons.error);
                        }),
                      ),

                      // Temperature
                      Text(
                        "${days[index].day?.mintempC?.toInt()}°  /  ${days[index].day?.maxtempC?.toInt()}°",
                        style: Theme.of(context).textTheme.bodyLarge,
                      )
                    ],
                  )),
              Container(
                height: 1,
                color: CColors.dividerLine,
              )
            ],
          );
        },
      ),
    );
  }
}
