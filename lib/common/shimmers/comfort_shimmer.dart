import 'package:flutter/material.dart';
import 'package:skycast/common/shimmers/shimmer.dart';

class ComfortWeatherShimmer extends StatelessWidget {
  const ComfortWeatherShimmer({super.key});

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
          height: 100,
          width: 100,
          radius: 100,
        )
      ],
    );
  }
}
