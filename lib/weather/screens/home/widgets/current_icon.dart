import 'package:flutter/material.dart';
import 'package:skycast/common/custom_shapes/containers/circular_container.dart';
import 'package:skycast/utils/constants/colors.dart';

class CurrentIcon extends StatelessWidget {
  const CurrentIcon({super.key, required this.imageUrl, required this.info});

  final String imageUrl;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCircularContainer(
          width: 60,
          height: 60,
          backgroundColor: CColors.lightGrey,
          radius: 15,
          padding: 16,
          child: Image(image: AssetImage(imageUrl)),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          info,
          style: Theme.of(context).textTheme.bodySmall,
        )
      ],
    );
  }
}
