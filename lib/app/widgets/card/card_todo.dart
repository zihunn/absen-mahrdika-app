// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../utils/color.dart';
import '../../utils/style.dart';

class CardTodo extends StatelessWidget {
  final List data;
  const CardTodo({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 15,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Dashboard Login",
                style: Style.Header1.copyWith(color: AppColor.blackSoftColor),
              ),
              const Icon(
                Icons.more_vert_outlined,
                size: 24.0,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0, top: 10),
            child: Row(
              children: [
                for (var i = 0; i < data.length; i++)
                  Align(
                    widthFactor: 0.8,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                        ),
                        image: const DecorationImage(
                          image: NetworkImage(
                            "https://i.ibb.co/PGv8ZzG/me.jpg",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 30,
                width: Get.width / 1.5,
                decoration: const BoxDecoration(),
                child: const Row(
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      size: 24.0,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("Senin, 21 April 2024 : 08.00 WIB"),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                    color: AppColor.greenColor.withOpacity(0.2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(6.0),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Selesai",
                      style: Style.Subtitle1.copyWith(
                        color: AppColor.greenColor,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
