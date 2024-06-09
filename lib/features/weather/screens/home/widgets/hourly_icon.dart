import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:skycast/features/weather/models/forecasting.dart';
import 'package:skycast/utils/constants/colors.dart';

class HourlyIcon extends StatelessWidget {
  const HourlyIcon({
    super.key,
    required this.index,
    this.hourElement,
    required this.cardIndex,
  });

  final int index;
  final int cardIndex;
  final HourElement? hourElement;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      margin: const EdgeInsets.only(left: 20, right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0.5, 0),
                blurRadius: 30,
                spreadRadius: 1,
                color: CColors.dividerLine.withAlpha(150))
          ],
          gradient: cardIndex == index
              ? const LinearGradient(colors: [
                  CColors.firstGradientColor,
                  CColors.secondGradientColor
                ])
              : null),
      child: HourlyDetails(
        index: index,
        cardIndex: cardIndex.toInt(),
        temp: hourElement?.tempC ?? 0.0,
        time: hourElement?.time ?? '',
        weatherIcon: hourElement?.condition.icon ?? '',
      ),
    );
  }
}

// hourly details class
class HourlyDetails extends StatelessWidget {
  final double temp;
  final int index;
  final int cardIndex;
  final String time;
  final String weatherIcon;

  const HourlyDetails(
      {super.key,
      required this.cardIndex,
      required this.index,
      required this.time,
      required this.temp,
      required this.weatherIcon});

  String getTime(final timeStamp) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    String x = DateFormat('jm').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    // If the URL still starts with '//', add 'http:' prefix
    final String validImageUrl =
        weatherIcon.startsWith('//') ? 'http:$weatherIcon' : weatherIcon;

    String dateTimeString = time;
    DateTime dateTime = DateTime.parse(dateTimeString);
    String formattedTime = DateFormat('HH:mm').format(dateTime);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(formattedTime,
              style: TextStyle(
                color:
                    cardIndex == index ? Colors.white : CColors.textColorBlack,
              )),
        ),
        Container(
            margin: const EdgeInsets.all(5),
            child: Image.network(validImageUrl, height: 40, width: 40,
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
            }, errorBuilder: (BuildContext context, Object error,
                    StackTrace? stackTrace) {
              return const Icon(Icons.error);
            })),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text("$temp°",
              style: TextStyle(
                color:
                    cardIndex == index ? Colors.white : CColors.textColorBlack,
              )),
        )
      ],
    );
  }
}
