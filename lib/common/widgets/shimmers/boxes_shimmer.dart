import 'package:flutter/material.dart';
import 'package:skycast/common/widgets/shimmers/shimmer.dart';
import 'package:skycast/utils/constants/sizes.dart';

class CustomBoxesShimmer extends StatelessWidget {
  const CustomBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: CustomShimmerEffect(width: 150, height: 110)),
            SizedBox(
              width: CSizes.spaceBtwItems,
            ),
            Expanded(child: CustomShimmerEffect(width: 150, height: 110)),
            SizedBox(
              width: CSizes.spaceBtwItems,
            ),
            Expanded(child: CustomShimmerEffect(width: 150, height: 110)),
          ],
        )
      ],
    );
  }
}
