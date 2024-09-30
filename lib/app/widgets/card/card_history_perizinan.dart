import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/color.dart';
import '../../utils/style.dart';

class CustomCard {
  static Widget CardHistoryPerizinan(
      {required String name, date, status, required Color color}) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 10.0,
      ),
      padding: const EdgeInsets.all(12.0),
      height: Get.height / 7.5,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      child: Row(
        children: [
          Container(
            height: Get.height / 12,
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(),
            child: const Image(
              image: AssetImage('assets/icons/approved.png'),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Get.width / 2,
                      child: Text(
                        name,
                        overflow: TextOverflow.ellipsis,
                        style: Style.Header1.copyWith(
                            color: AppColor.blackSoftColor),
                      ),
                    ),
                    Container(
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.edit_note_sharp,
                            size: 24.0,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Icon(
                            Icons.more_horiz_outlined,
                            size: 24.0,
                            color: AppColor.bluePrimary,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      date,
                      style: Style.Subtitle1.copyWith(
                          color: AppColor.blackSoftColor.withOpacity(0.5)),
                    ),
                    Container(
                      height: 30,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(4.0),
                        ),
                        color: color.withOpacity(0.13),
                      ),
                      child: Center(
                        child: Text(
                          status,
                          style: Style.Subtitle1.copyWith(
                            color: color,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
