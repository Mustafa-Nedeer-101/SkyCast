import 'package:flutter/material.dart';
import 'package:skycast/common/widgets/shimmers/shimmer.dart';
import 'package:skycast/utils/constants/sizes.dart';

class DailyWeatherShimmer extends StatelessWidget {
  const DailyWeatherShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
      child: CustomShimmerEffect(
        width: 200,
        height: 180,
        radius: 20,
      ),
    );
  }
}
