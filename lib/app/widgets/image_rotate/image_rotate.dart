// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:ffi';
import 'dart:math' as math;

import 'package:flutter/material.dart';

class ImageRotate extends StatelessWidget {
  final String image;
  final double width;
  final double height;
  final double? left;
  final double? right;
  final double? bottom;
  final double? top;
  final double angle;
  const ImageRotate({
    Key? key,
    required this.image,
    required this.width,
    required this.height,
    this.left,
    this.right,
    this.bottom,
    this.top,
    required this.angle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      bottom: bottom,
      right: right,
      top: top,
      child: Transform.rotate(
        angle: angle,
        child: SizedBox(
          width: width,
          height: height,
          child: Image.asset(
            image
          ),
        ),
      ),
    );
  }
}
