import 'package:absensi_mahardika/app/modules/history_absen/controllers/history_absen_controller.dart';
import 'package:absensi_mahardika/app/utils/style.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:get/get.dart';

class CardAbsen extends StatefulWidget {
  final String title;
  final String matkul;
  final String tanggal;
  final String point;
  final Color color;
  const CardAbsen(
      {super.key,
      required this.title,
      required this.matkul,
      required this.tanggal,
      required this.point,
      required this.color});

  @override
  State<CardAbsen> createState() => _CardAbsenState();
}

class _CardAbsenState extends State<CardAbsen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HistoryAbsenController());
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.only(bottom: 15),
      height: 100,
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
        boxShadow: [
          BoxShadow(
            color: context.theme.shadowColor,
            blurRadius: 5,
            blurStyle: BlurStyle.outer,
            offset: const Offset(0, 3),
          ),
        ],
        color: context.theme.primaryColor,
      ),
      child: Row(
        children: [
          Container(
            height: Get.height,
            width: 6,
            decoration: BoxDecoration(
              color: widget.color,
              borderRadius: const BorderRadius.all(
                Radius.circular(1.0),
              ),
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          SizedBox(
            width: Get.width / 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 70,
                  width: Get.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: Style.Header1.copyWith(
                          fontFamily: 'SignikaSemi',
                          color: context.theme.textTheme.bodyLarge!.color,
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        controller.capitalizeAllWord(
                          widget.matkul.toLowerCase(),
                        ),
                        style: Style.Subtitle1.copyWith(
                          fontFamily: 'SignikaSemi',
                          fontSize: 12.0,
                          color: context.theme.textTheme.bodyLarge!.color,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  widget.tanggal,
                  style: Style.Subtitle1.copyWith(
                    fontFamily: 'SignikaSemi',
                    fontSize: 12.0,
                    color: context.theme.textTheme.bodyLarge!.color,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(),
              child: Stack(
                children: [
                  Positioned(
                    right: 10,
                    top: -10,
                    child: Transform.rotate(
                      angle: math.pi / -3,
                      child: SizedBox(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                          "assets/images/logo.png",
                          opacity: const AlwaysStoppedAnimation(.1),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      '${widget.point}.0',
                      style: Style.Header1.copyWith(
                        fontSize: 52.0,
                        color: widget.color,
                        fontFamily: 'SignikaSemi',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
