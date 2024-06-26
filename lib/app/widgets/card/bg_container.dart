// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:absensi_mahardika/app/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BgContainer extends StatefulWidget {
  final Widget child;
  const BgContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<BgContainer> createState() => _BgContainerState();
}

class _BgContainerState extends State<BgContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      margin: const EdgeInsets.only(top: 60),
      padding: const EdgeInsets.only(top: 100, left: 15, right: 15),
      decoration: const BoxDecoration(
        // color: context.theme.primaryColor,
        color: AppColor.bgColor,
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      child: widget.child,
    );
  }
}
