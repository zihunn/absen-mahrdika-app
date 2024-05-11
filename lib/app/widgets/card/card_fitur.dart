// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:absensi_mahardika/app/utils/style.dart';

class FiturCard extends StatefulWidget {
  final String image;
  final String name;
  final String? subtitle;
  const FiturCard({
    Key? key,
    required this.image,
    required this.name,
    this.subtitle,
  }) : super(key: key);

  @override
  State<FiturCard> createState() => _FiturCardState();
}

class _FiturCardState extends State<FiturCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
            width: 50,
            height: 50,
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            widget.name,
            style: Style.Header1.copyWith(
              fontSize: 14.0,
              color: context.theme.textTheme.bodyLarge!.color,
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            widget.subtitle ?? '',
            overflow: TextOverflow.ellipsis,
            style: Style.Header1.copyWith(
              fontSize: 12.0,
              fontFamily: 'Signika',
              color: context.theme.textTheme.bodyLarge!.color,
            ),
          ),
        ],
      ),
    );
  }
}
