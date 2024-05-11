// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'package:absensi_mahardika/app/modules/pertemuan/controllers/pertemuan_controller.dart';

import '../../modules/pertemuan/views/pertemuan_view.dart';
import '../../utils/network.dart';
import '../date_capsule/capsule.dart';

class CardMkDosen extends StatefulWidget {
  final Color colorLine;
  final Color colorShadow;
  final String image;
  final String mk;
  final int totalPertemuan;
  final String jamMulai;
  final String jamSelesai;
  final String prodi;
  final String jadwal_id;
  final String semester;
  final Function onTap;
  const CardMkDosen({
    Key? key,
    required this.colorLine,
    required this.colorShadow,
    required this.image,
    required this.mk,
    required this.totalPertemuan,
    required this.jamMulai,
    required this.jamSelesai,
    required this.prodi,
    required this.jadwal_id,
    required this.semester,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CardMkDosen> createState() => _CardMkDosenState();
}

class _CardMkDosenState extends State<CardMkDosen> {
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
                              widget.colorLine,
                              widget.colorShadow,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: Get.height / 15,
                      child: Image.asset(widget.image),
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
              width: 100.0,
              height: 100.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height / 28,
                    width: Get.width,
                    child: Text(
                      widget.mk,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontFamily: 'SignikaBold',
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  Container(
                    height: Get.height / 16,
                    width: Get.width,
                    decoration: const BoxDecoration(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '${widget.jamMulai} - ${widget.jamSelesai}',
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
                          '${widget.prodi} ${widget.semester}',
                          style: TextStyle(
                            fontFamily: 'SignikaSemi',
                            color: Colors.grey.withOpacity(0.8),
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Container Right
          SizedBox(
            // padding: const EdgeInsets.only(right: 10),
            width: 110.0,
            height: 100.0,
            child: SizedBox(
              height: 100.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      width: Get.width / 7,
                      child: Center(
                        child: CircularPercentIndicator(
                          radius: 23.0,
                          lineWidth: 6.0,
                          percent: 0.08333333333 * widget.totalPertemuan,
                          backgroundColor: const Color(0xffE8EBF9),
                          progressColor: widget.colorLine,
                          center: Text(
                            "${widget.totalPertemuan}/12",
                            style: TextStyle(
                              fontSize: 10.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey.withOpacity(0.8),
                            ),
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                        ),
                      )),
                  IconButton(
                    onPressed: () => widget.onTap(),
                 
                    splashRadius: 10,
                    icon: const Icon(
                      CupertinoIcons.right_chevron,
                      size: 28,
                    ),
                    color: Colors.grey.withOpacity(0.3),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
