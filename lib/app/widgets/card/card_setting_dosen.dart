// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:absensi_mahardika/app/utils/color.dart';

class CardSettingDosen extends StatelessWidget {
  final String title;
  final String subtitle;
  final Icon icon;
  final Color BColor;
  final Color textColor;
  final Function onTap;
  const CardSettingDosen({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.BColor,
    required this.textColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      elevation: 0,
      child: Row(
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: BColor,
              shape: BoxShape.circle,
            ),
            child: icon,
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'SignikaRegular',
                  fontSize: 16.0,
                  color: textColor,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontFamily: 'SignikaRegular',
                  fontSize: 14.0,
                  color: Colors.grey.withOpacity(0.5),
                ),
              ),
            ],
          )),
          IconButton(
            onPressed: () => onTap(),
            icon: Icon(Icons.arrow_forward_ios_rounded,
                color: Colors.grey.withOpacity(0.5)),
            splashRadius: 20,
          ),
        ],
      ),
    );
  }
}
