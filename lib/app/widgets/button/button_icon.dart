// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../utils/color.dart';

class ButtonIcon extends StatelessWidget {
  final double height;
  final double width;
  final IconData icon;
  final Function onTap;
  const ButtonIcon({
    Key? key,
    required this.height,
    required this.width,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.only(
        left: 15,
        top: 9,
        bottom: 8,
      ),
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: AppColor.bluePrimary.withOpacity(0.2),
        borderRadius: const BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      child: TextButton(
        clipBehavior: Clip.antiAlias,
        style: ButtonStyle(
            overlayColor: MaterialStateColor.resolveWith(
              (states) => AppColor.greyColor.withOpacity(0.8),
            ),
            iconColor: const MaterialStatePropertyAll(
              AppColor.blackSoftColor,
            )),
        onPressed: () => onTap(),
        child: Icon(
          icon,
          size: 22.0,
        ),
      ),
    );
  }
}
