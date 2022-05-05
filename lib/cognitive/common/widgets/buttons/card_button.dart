import 'package:auto_size_text/auto_size_text.dart';
import 'package:epsycheart/cognitive/common/constants/font_constants.dart';
import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {
  final String? label;

  final double? labelSize;

  final double? iconSize;

  final IconData? icon;

  final VoidCallback onPressed;

  final Color? primaryColor;

  final Color? onPrimaryColor;

  final int maxLines;

  const CardButton({
    Key? key,
    required this.onPressed,
    this.label,
    this.icon,
    this.primaryColor,
    this.onPrimaryColor,
    this.labelSize = FontConstants.fontSizeM,
    this.iconSize = FontConstants.fontSizeXXL,
    this.maxLines = 4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          if (icon != null) ...[Icon(icon, size: iconSize)],
          if (label != null) ...[
            AutoSizeText(
              label!,
              textAlign: TextAlign.center,
              minFontSize: FontConstants.fontSizeXS,
              maxFontSize: FontConstants.fontSizeXXL,
              style: TextStyle(fontSize: labelSize),
              maxLines: maxLines,
              overflow: TextOverflow.ellipsis,
            )
          ]
        ],
      ),
      style: ElevatedButton.styleFrom(
          primary: primaryColor, onPrimary: onPrimaryColor),
    );
  }
}
