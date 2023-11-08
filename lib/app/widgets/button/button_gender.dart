// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../utils/color.dart';
import '../../utils/style.dart';

class ButtonGender extends StatelessWidget {
  final String icon;
  final String label;
  final Function onTap;
  final Color borderColor;
  final Color backgroundColor;
  const ButtonGender({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
    required this.borderColor,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 73,
      width: 73,
      child: ElevatedButton(
        onPressed: () => onTap(),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: backgroundColor,
          minimumSize: Size.zero, // Set this
          padding: const EdgeInsets.all(7),
          side: BorderSide(color: borderColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Column(
          children: [
            Image.asset(
              icon,
              width: 40,
              height: 40,
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              label,
              style: Style.Subtitle1.copyWith(
                  fontSize: 10.0, color: AppColor.blackSoftColor),
            ),
          ],
        ),
      ),
    );
  }
}
