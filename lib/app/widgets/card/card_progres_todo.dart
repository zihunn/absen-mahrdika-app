import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../utils/color.dart';
import '../../utils/style.dart';

class CardProgresTodo extends StatelessWidget {
  const CardProgresTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 7,
      width: Get.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(14.0),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 10,
            left: 15,
            right: 15,
            child: Container(
              clipBehavior: Clip.antiAlias,
              height: 100,
              width: Get.width,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(14.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(8, 0, 0, 0),
                    blurRadius: 1,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  SizedBox(
                    child: CircularPercentIndicator(
                      radius: 30.0,
                      lineWidth: 6.0,
                      percent: 0.08333333333 * 4,
                      backgroundColor: const Color(0xffE8EBF9),
                      progressColor: const Color(0xff30CF80),
                      center: Text(
                        "1/12",
                        style: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey.withOpacity(0.8),
                        ),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                    ),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  SizedBox(
                    width: Get.width / 2.2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Progres Tugasmu",
                          style: Style.Header1.copyWith(
                              color: AppColor.blackSoftColor),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "11/19 Selesai",
                          style: Style.Subtitle1.copyWith(
                              color: AppColor.blackSoftColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 5,
            right: 0,
            child: Image.asset(
              "assets/images/progress.png",
              height: 130,
              width: 150,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
