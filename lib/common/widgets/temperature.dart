//
import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class TemperatureArea extends StatelessWidget {
  const TemperatureArea({
    super.key,
    required this.temp,
    required this.desctiption,
    required this.iconString,
  });

  final double temp;
  final String desctiption;
  final String iconString;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Image
        Expanded(
          flex: 1,
          child: Center(
            child: Image.network(
              iconString,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
              errorBuilder:
                  (BuildContext context, Object error, StackTrace? stackTrace) {
                return const Icon(Icons.error);
              },
            ),
          ),
        ),

        // Divider
        Container(
          height: 50,
          width: 1,
          color: CColors.darkGrey,
        ),

        // Temp
        Expanded(
          flex: 3,
          child: Center(
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "$temp°",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 50,
                      color: CColors.black,
                    )),
                TextSpan(
                    text: desctiption,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.grey,
                    )),
              ]),
            ),
          ),
        ),
      ],
    );
  }
}
