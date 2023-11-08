// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import 'package:absensi_mahardika/app/utils/style.dart';
import 'package:get/get.dart';

class FiturCard extends StatefulWidget {
  final String image;
  final String name;
  const FiturCard({
    Key? key,
    required this.image,
    required this.name,
  }) : super(key: key);

  @override
  State<FiturCard> createState() => _FiturCardState();
}

class _FiturCardState extends State<FiturCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 105,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: context.theme.primaryColor,
        boxShadow: [
          BoxShadow(
            color: context.theme.shadowColor,
            blurRadius: 5,
            blurStyle: BlurStyle.outer,
          ),
          BoxShadow(
            color: context.theme.shadowColor,
            blurRadius: 5,
            blurStyle: BlurStyle.outer,
          ),
        ],
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            widget.image,
            width: 30,
            height: 30,
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            widget.name,
            style: Style.Header1.copyWith(
              fontSize: 12.0,
              color: context.theme.textTheme.bodyLarge!.color,
            ),
          ),
        ],
      ),
    );
  }
}
