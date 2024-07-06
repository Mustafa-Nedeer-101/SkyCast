import 'package:flutter/material.dart';
import 'package:skycast/common/shimmers/shimmer.dart';
import 'package:skycast/utils/constants/sizes.dart';

class CustomListTileShimmer extends StatelessWidget {
  const CustomListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            CustomShimmerEffect(
              width: 50,
              height: 50,
              radius: 50,
            ),
            SizedBox(
              width: CSizes.spaceBtwItems,
            ),
            Column(
              children: [
                CustomShimmerEffect(width: 100, height: 15),
                SizedBox(
                  height: CSizes.spaceBtwItems / 2,
                ),
                CustomShimmerEffect(width: 80, height: 12),
              ],
            )
          ],
        )
      ],
    );
  }
}
