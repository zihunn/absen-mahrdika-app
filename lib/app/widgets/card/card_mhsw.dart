// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/color.dart';

class CardMahasiswa extends StatelessWidget {
  final int no;
  final String nama;
  final String npm;
  final String image;
  final Widget widget;
  const CardMahasiswa({
    Key? key,
    required this.no,
    required this.nama,
    required this.npm,
    required this.image,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      height: Get.height / 10,
      width: Get.width,
      decoration: BoxDecoration(
        color: AppColor.bluePrimary.withOpacity(0.04),
        borderRadius: const BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      child: SizedBox(
        height: 100.0,
        child: Row(
          children: [
            Container(
              height: Get.height,
              width: Get.width / 7,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(12.0),
                ),
                image: image == 'null'
                    ? const DecorationImage(
                        image: AssetImage('assets/images/6605525.jpg'),
                        fit: BoxFit.cover)
                    : DecorationImage(
                        image: NetworkImage(image),
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            const SizedBox(
              width: 15.0,
            ),
            Expanded(
              child: SizedBox(
                width: 80.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      nama,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontFamily: 'SignikaSemi',
                        fontSize: 18.0,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      npm,
                      style: const TextStyle(
                        fontFamily: 'SignikaSemi',
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            widget
          ],
        ),
      ),
    );
  }
}
