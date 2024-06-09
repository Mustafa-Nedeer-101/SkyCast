import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skycast/utils/constants/colors.dart';
import 'package:skycast/utils/constants/sizes.dart';
import 'package:skycast/utils/device/device_utility.dart';
import 'package:skycast/utils/helpers/helper_functions.dart';

class CustomSearchContainer extends StatelessWidget {
  const CustomSearchContainer(
      {super.key,
      required this.text,
      this.icon = Iconsax.search_normal,
      this.showBorder = true,
      this.showBackground = true,
      this.padding =
          const EdgeInsets.symmetric(horizontal: CSizes.defaultSpace)});

  final String text;
  final IconData? icon;
  final bool showBorder, showBackground;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    bool dark = UHelperFunctions.isDarkMode(context);
    return Padding(
      padding: padding,
      child: Container(
        width: UDeviceUtils.getScreenWidth(context),
        padding: const EdgeInsets.all(CSizes.md),
        decoration: BoxDecoration(
          color: showBackground
              ? dark
                  ? CColors.dark
                  : CColors.light
              : Colors.transparent,
          borderRadius: BorderRadiusDirectional.circular(16),
          border: showBorder
              ? Border.all(color: dark ? CColors.darkerGrey : CColors.grey)
              : null,
        ),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(
              width: CSizes.spaceBtwItems,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
      ),
    );
  }
}
