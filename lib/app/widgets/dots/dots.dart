import 'package:absensi_mahardika/app/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

DotsDecorator getDotsDecorator() {
  return DotsDecorator(
    spacing: const EdgeInsets.symmetric(horizontal: 2),
    activeColor: AppColor.blueColor,
    color: AppColor.greyColor!,
    activeSize: const Size(12, 5),
    activeShape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
    ),
  );
}
