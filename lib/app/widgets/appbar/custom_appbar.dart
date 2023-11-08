// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:absensi_mahardika/app/utils/style.dart';

class CustomAppbar extends StatelessWidget {
  final String text;
  const CustomAppbar({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: Get.width,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Align(
          alignment: Alignment.topCenter,
          child: Text(
            text,
            style: Style.Subtitle1.copyWith(
              fontFamily: 'Signika',
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
