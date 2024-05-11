// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:absensi_mahardika/app/utils/color.dart';

import '../date_capsule/capsule.dart';

class CardKrs extends StatelessWidget {
  final String image;
  final Color color;
  final Color colorShadow;
  final String namaMk;
  final String dosen;
  final String jamMulai;
  final String jamSelesai;
  final int sks;
  final bool isAvail;
  final bool? isAddKrs;
  const CardKrs({
    Key? key,
    required this.image,
    required this.color,
    required this.colorShadow,
    required this.namaMk,
    required this.dosen,
    required this.jamMulai,
    required this.jamSelesai,
    required this.sks,
    required this.isAvail,
    this.isAddKrs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: Get.height / 7.5,
      width: Get.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: Get.width / 5,
            height: Get.height,
            child: SizedBox(
              height: Get.height,
              child: Row(
                children: [
                  // Container Left
                  SizedBox(
                    width: Get.width / 20,
                    height: Get.height,
                    child: Stack(
                      children: [
                        Positioned(
                          left: -12,
                          top: Get.height / 20,
                          child: Transform.rotate(
                            angle: -math.pi / 2,
                            child: curveShape(
                              color,
                              colorShadow,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: Get.height / 15,
                      child: Image.asset(image),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Container Center
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    namaMk,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'SignikaBold',
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    dosen,
                    style: TextStyle(
                      fontFamily: 'SignikaSemi',
                      color: Colors.grey.withOpacity(0.8),
                      fontSize: 15.0,
                    ),
                  ),
                  const SizedBox(
                    height: 2.0,
                  ),
                  Text(
                    '${jamMulai} - ${jamSelesai}',
                    style: TextStyle(
                      fontFamily: 'SignikaSemi',
                      color: Colors.grey.withOpacity(0.8),
                      fontSize: 15.0,
                    ),
                  ),
                  const SizedBox(
                    height: 2.0,
                  ),
                  Text(
                    '${sks} SKS',
                    style: TextStyle(
                      fontFamily: 'SignikaSemi',
                      color: Colors.grey.withOpacity(0.8),
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Container Right
          SizedBox(
            // padding: const EdgeInsets.only(right: 10),
            width: Get.width / 7,
            child:isAvail == true ? SizedBox(
              height: 100.0,
              child:isAddKrs == false ? IconButton(
                onPressed: () {},
                splashRadius: 10,
                icon: const Icon(
                  CupertinoIcons.trash,
                  size: 32,
                ),
                color: Colors.red.withOpacity(0.8),
              ) :IconButton(
                onPressed: () {},
                splashRadius: 10,
                icon: const Icon(
                  CupertinoIcons.trash,
                  size: 32,
                ),
                color: Colors.red.withOpacity(0.8),
              ),
            ) :SizedBox()
          ),
        ],
      ),
    );
  }
}
