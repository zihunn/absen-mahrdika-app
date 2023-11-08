// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/color.dart';

class ButtonConfirm extends StatelessWidget {
  final Function onTap;
  final double height;
  final double width;
  const ButtonConfirm({
    Key? key,
    required this.onTap, required this.height, required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          backgroundColor: AppColor.bluePrimary,
        ),
        onPressed: () => onTap(),
        child: const Text(
          "Save",
          style: TextStyle(
            fontFamily: 'SignikaSemi',
          ),
        ),
      ),
    );
  }
}
