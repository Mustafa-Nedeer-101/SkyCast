import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skycast/common/shimmers/comfort_shimmer.dart';
import 'package:skycast/weather/controllers/weather_controller.dart';
import 'package:skycast/utils/constants/colors.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class HomeComfort extends StatelessWidget {
  const HomeComfort({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final WeatherController controller = WeatherController.instance;

    return Obx(() {
      // Loading
      if (controller.isLoading.value) {
        return const ComfortWeatherShimmer();
      } else {
        return Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: const Text(
                "Comfort Level",
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(
              height: 180,
              child: Column(
                children: [
                  Center(
                    child: SleekCircularSlider(
                      min: 0,
                      max: 100,
                      initialValue: // Humidity
                          controller.currentWeather.current?.humidity
                                  ?.toDouble() ??
                              0.0,
                      appearance: CircularSliderAppearance(
                          customWidths: CustomSliderWidths(
                              handlerSize: 0,
                              trackWidth: 12,
                              progressBarWidth: 12),
                          infoProperties: InfoProperties(
                              bottomLabelText: "Humidity",
                              bottomLabelStyle: const TextStyle(
                                  letterSpacing: 0.1,
                                  fontSize: 14,
                                  height: 1.5)),
                          animationEnabled: true,
                          size: 140,
                          customColors: CustomSliderColors(
                              hideShadow: true,
                              trackColor:
                                  CColors.firstGradientColor.withAlpha(100),
                              progressBarColors: [
                                CColors.firstGradientColor,
                                CColors.secondGradientColor
                              ])),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(children: [
                          const TextSpan(
                              text: "Feels Like ",
                              style: TextStyle(
                                  fontSize: 14,
                                  height: 0.8,
                                  color: CColors.textColorBlack,
                                  fontWeight: FontWeight.w400)),
                          TextSpan(
                              // Feels Like
                              text: controller
                                      .currentWeather.current?.feelslikeC
                                      .toString() ??
                                  '0',
                              style: Theme.of(context).textTheme.bodyMedium)
                        ]),
                      ),
                      Container(
                        height: 25,
                        margin: const EdgeInsets.only(left: 40, right: 40),
                        width: 1,
                        color: CColors.dividerLine,
                      ),
                      RichText(
                        text: TextSpan(children: [
                          const TextSpan(
                              text: "UV Index ",
                              style: TextStyle(
                                  fontSize: 14,
                                  height: 0.8,
                                  color: CColors.textColorBlack,
                                  fontWeight: FontWeight.w400)),
                          TextSpan(
                              text: controller.currentWeather.current?.uv
                                  .toString(),
                              style: Theme.of(context).textTheme.bodyMedium)
                        ]),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        );
      }
    });
  }
}
