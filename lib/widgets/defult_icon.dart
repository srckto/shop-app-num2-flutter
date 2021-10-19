import 'package:flutter/material.dart';
import 'package:shop_app_num2/constant.dart';

class DefultIcon extends StatelessWidget {
  final String label;
  final Function() onPressed;
  final Color primaryColor;
  final Color labelColor;
  final double elevation;
  final double fontSize;
  final double horizontalPadding;
  final double verticalPadding;

  const DefultIcon({
    required this.label,
    this.labelColor = Colors.white,
    required this.onPressed,
    this.primaryColor = k_primiryColor,
    this.elevation = 5.0,
    this.fontSize = 17,
    this.horizontalPadding = 30,
    this.verticalPadding = 10,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: primaryColor,
        elevation: elevation,
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          color: labelColor,
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
