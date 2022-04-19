import 'package:flutter/material.dart';

import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_text.dart';

class AppButtons extends StatelessWidget {
  AppButtons(
      {Key? key,
      this.text = '1',
      this.icon,
      this.isIcon = false,
      required this.color,
      required this.backgroundColor,
      required this.borderColor,
      required this.size})
      : super(key: key);

  final Color color;
  String? text;
  IconData? icon;
  final Color backgroundColor;
  double size;
  final Color borderColor;
  bool isIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
      ),
      child: isIcon == false
          ? Center(
              child: AppText(
                text: text!,
                color: color,
              ),
            )
          : Center(
              child: Icon(
                icon,
                color: color,
              ),
            ),
    );
  }
}
