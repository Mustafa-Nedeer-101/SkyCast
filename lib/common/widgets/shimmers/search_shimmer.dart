import 'package:flutter/material.dart';
import 'package:skycast/common/widgets/shimmers/shimmer.dart';

class SearchShimmer extends StatelessWidget {
  const SearchShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomShimmerEffect(
          width: 100,
          height: 15,
          radius: 5,
        ),
        CustomShimmerEffect(
          height: 15,
          width: 25,
          radius: 4,
        )
      ],
    );
  }
}
