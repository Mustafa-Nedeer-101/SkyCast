import 'package:flutter/material.dart';
import 'package:skycast/utils/constants/colors.dart';

// The circle in the background
class CustomCircularContainer extends StatelessWidget {
  const CustomCircularContainer({
    super.key,
    this.width,
    this.height,
    this.padding = 0,
    this.margin,
    this.radius = 80,
    this.backgroundColor = CColors.white,
    this.child,
  });

  final double? width;
  final double? height;
  final double padding;
  final EdgeInsets? margin;
  final double radius;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
