// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:absensi_mahardika/app/utils/style.dart';

class JadwalCard extends StatefulWidget {
  final Color color;
  final String image;
  final String matkul;
  final String dosen;
  final String jamMulai;
  final String jamSelesai;
  const JadwalCard({
    Key? key,
    required this.color,
    required this.image,
    required this.matkul,
    required this.dosen,
    required this.jamMulai,
    required this.jamSelesai,
  }) : super(key: key);

  @override
  State<JadwalCard> createState() => _JadwalCardState();
}

class _JadwalCardState extends State<JadwalCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.only(bottom: 20),
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(20.0),
        ),
        color: widget.color,
      ),
      child: Stack(
        children: [
          Positioned(
            right: -70,
            top: -100,
            child: SizedBox(
              height: 200,
              width: 200,
              child: Transform.rotate(
                angle: -math.pi / 0.06,
                child: Image.asset(
                  "assets/images/oval.png",
                  opacity: const AlwaysStoppedAnimation(.2),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -110,
            left: -100,
            child: SizedBox(
              height: 200,
              width: 200,
              child: Transform.rotate(
                angle: -math.pi / 0.06,
                child: Image.asset(
                  "assets/images/oval.png",
                  opacity: const AlwaysStoppedAnimation(.2),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Container(
                width: Get.width / 3,
                padding: const EdgeInsets.all(5),
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 70,
                        child: Text(
                          widget.matkul,
                          maxLines: 3,
                          style: Style.Header2.copyWith(
                            overflow: TextOverflow.ellipsis,
                            color: Colors.white,
                            fontSize: 15.0,
                            fontFamily: 'SignikaSemi',
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.dosen,
                              style: Style.Header2.copyWith(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontFamily: 'SignikaSemi',
                              ),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              "${widget.jamMulai} - ${widget.jamSelesai}",
                              style: Style.Header2.copyWith(
                                color: Colors.white,
                                fontSize: 13.0,
                                fontFamily: 'SignikaSemi',
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
