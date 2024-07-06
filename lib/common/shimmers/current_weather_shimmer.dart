import 'package:flutter/material.dart';
import 'package:skycast/common/shimmers/shimmer.dart';
import 'package:skycast/utils/constants/sizes.dart';

class CurrentWeatherShimmer extends StatelessWidget {
  const CurrentWeatherShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomShimmerEffect(
              width: 60,
              height: 60,
              radius: 60,
            ),
            SizedBox(
              width: CSizes.spaceBtwSections,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomShimmerEffect(width: 100, height: 25),
                SizedBox(
                  height: CSizes.spaceBtwItems,
                ),
                CustomShimmerEffect(width: 200, height: 50),
              ],
            )
          ],
        )
      ],
    );
  }
}
