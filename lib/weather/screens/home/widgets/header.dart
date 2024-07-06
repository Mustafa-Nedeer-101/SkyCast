import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skycast/common/shimmers/search_shimmer.dart';
import 'package:skycast/weather/controllers/weather_controller.dart';
import 'package:skycast/weather/screens/search/search_delegate.dart';
import 'package:skycast/utils/constants/colors.dart';
import 'package:skycast/utils/constants/sizes.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final WeatherController controller = WeatherController.instance;

    return Obx(() {
      // Loading
      if (controller.isLoading.value) {
        return const SearchShimmer();
      }

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: CSizes.sm),
        child: Row(
          children: [
            const Expanded(
              flex: 2,
              child: SearchContainer(),
            ),
            const SizedBox(
              width: CSizes.sm,
            ),
            Expanded(
                flex: 1,
                child: RichText(
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    children: <TextSpan>[
                      // City name with its own style
                      TextSpan(
                        text: controller.currentWeather.location?.name,
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
                        text: controller.currentWeather.location?.country,
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      );
    });
  }
}

class SearchContainer extends StatelessWidget {
  const SearchContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showSearch(context: context, delegate: SearchInSkyCast());
      },
      child: Container(
        height: 55,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            const SizedBox(
              width: CSizes.spaceBtwInputFields,
            ),
            const Icon(Icons.search),
            const SizedBox(
              width: CSizes.spaceBtwInputFields,
            ),
            Text(
              'Search in SkyCast',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }
}
