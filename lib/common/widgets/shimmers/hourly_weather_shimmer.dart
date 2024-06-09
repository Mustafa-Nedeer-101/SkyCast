import 'package:flutter/material.dart';
import 'package:skycast/common/widgets/shimmers/shimmer.dart';
import 'package:skycast/utils/constants/sizes.dart';

class HourlyWeatherShimmer extends StatelessWidget {
  const HourlyWeatherShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomShimmerEffect(
          width: 60,
          height: 20,
          radius: 10,
        ),
        SizedBox(
          height: 16,
        ),
        CustomShimmerEffect(
          height: 60,
          width: 260,
          radius: 26,
        ),
        SizedBox(
          height: CSizes.spaceBtwSections,
        ),
      ],
    );
  }
}
