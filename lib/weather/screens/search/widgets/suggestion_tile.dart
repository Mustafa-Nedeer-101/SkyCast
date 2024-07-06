import 'package:flutter/material.dart';
import 'package:skycast/weather/models/forecasting.dart';
import 'package:skycast/utils/constants/colors.dart';
import 'package:skycast/utils/constants/sizes.dart';

class SuggestionTile extends StatelessWidget {
  const SuggestionTile({super.key, required this.location});

  final Location location;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        alignment: Alignment.topLeft,
        color: CColors.lightGrey,
        width: double.infinity,
        child: RichText(
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
            children: <TextSpan>[
              // City name with its own style
              TextSpan(
                text: location.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: CColors.secondary,
                ),
              ),

              // Comma and space For region
              const TextSpan(
                text: ', ',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),

              TextSpan(
                text: location.region,
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),

              // Comma and space for country
              const TextSpan(
                text: ', ',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),

              TextSpan(
                text: location.country,
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ));
  }
}
