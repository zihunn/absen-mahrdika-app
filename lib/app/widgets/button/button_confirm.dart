// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ButtonConfirm extends StatelessWidget {
  final Function onTap;
  final double height;
  final double width;
  final double widthOutline;
  final double radius;
  final Color color;
  final Color colorOutline;
  final bool isOutline;
  final Widget widget;
  const ButtonConfirm({
    Key? key,
    required this.onTap,
    required this.height,
    required this.width,
    required this.widthOutline,
    required this.radius,
    required this.color,
    required this.colorOutline,
    required this.isOutline,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            side:isOutline == true ?  BorderSide(color: colorOutline, width: widthOutline) : BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
          ),
          backgroundColor: color,
        ),
        onPressed: () => onTap(),
        child: widget
      ),
    );
  }
}
