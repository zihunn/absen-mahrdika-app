// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:absensi_mahardika/app/utils/color.dart';

import '../../utils/style.dart';

class CardCategory extends StatelessWidget {
  final String nama;
  final String image;
  final int total;
  final Function onTap;
  final Color bgColor;
  final Color primary;
  const CardCategory({
    Key? key,
    required this.nama,
    required this.image,
    required this.total,
    required this.onTap,
    required this.bgColor,
    required this.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(14.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                image,
                width: 45,
                height: 45,
                color: primary,
              ),
              GestureDetector(
                onTap: () => onTap(),
                child:  Icon(
                  Icons.arrow_forward,
                  size: 24.0,
                  color: primary,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            nama,
            style: Style.Subtitle1.copyWith(color: primary),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            '${total} Tugas',
            style: TextStyle(
              fontFamily: 'Signika',
              color: primary,
            ),
          ),
        ],
      ),
    );
  }
}
