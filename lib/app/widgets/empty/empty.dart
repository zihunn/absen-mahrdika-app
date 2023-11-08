// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../utils/style.dart';

class Empty extends StatelessWidget {
  final Function function;
  const Empty({
    Key? key,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: Get.height / 12,
          right: 8,
          child: GestureDetector(
            onTap: () => function(),
            child: SizedBox(
              height: 350,
              width: 350,
              child: Lottie.asset(
                'assets/lottie/empty.json',
              ),
            ),
          ),
        ),
        Positioned(
          bottom: Get.height / 3.5,
          left: Get.width / 2.6,
          child: const Text(
            "Tap to refresh",
            style: Style.Subtitle1,
          ),
        ),
      ],
    );
  }
}
