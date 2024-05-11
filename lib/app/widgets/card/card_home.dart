// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:absensi_mahardika/app/modules/home/controllers/home_controller.dart';
import 'package:absensi_mahardika/app/utils/color.dart';
import 'package:absensi_mahardika/app/utils/style.dart';

class CardTabbar extends StatefulWidget {
  final bool showClock;
  final String days;
  final String name1;
  final String value1;
  final String name2;
  final String value2;
  final Function? onTap1;
  final Function? onTap2;
  final Function? onTapDatePicker;
  final String image;
  const CardTabbar({
    Key? key,
    required this.showClock,
    required this.days,
    required this.name1,
    required this.value1,
    required this.name2,
    required this.value2,
    this.onTap1,
    this.onTap2,
    this.onTapDatePicker,
    required this.image,
  }) : super(key: key);

  @override
  State<CardTabbar> createState() => _CardTabbarState();
}

class _CardTabbarState extends State<CardTabbar> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Container(
      width: Get.width / 1.12,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        // color: context.theme.primaryColor,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: context.theme.shadowColor,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: const BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.showClock == true
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/icons/calendar.png",
                          width: 15,
                          height: 15,
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          widget.days,
                          style: Style.Subtitle1.copyWith(
                            color: context.theme.textTheme.bodyLarge!.color,
                            fontFamily: 'SignikaSemi',
                          ),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/icons/clock.png",
                          width: 17,
                          height: 17,
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        StreamBuilder<DateTime>(
                          stream: controller.getTime(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.active) {
                              return Text(
                                controller.date.format(snapshot.data!),
                                style: Style.Subtitle1.copyWith(
                                  color:
                                      context.theme.textTheme.bodyLarge!.color,
                                  fontFamily: 'SignikaSemi',
                                ),
                              );
                            }
                            return Text(
                              DateFormat('HH:mm').format(DateTime.now()),
                              style: Style.Subtitle1.copyWith(
                                color: context.theme.textTheme.bodyLarge!.color,
                                fontFamily: 'SignikaSemi',
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ],
                )
              : GestureDetector(
                  onTap: () => widget.onTapDatePicker!(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/icons/calendar.png",
                            width: 15,
                            height: 15,
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            widget.days,
                            style: Style.Subtitle1.copyWith(
                              color: context.theme.textTheme.bodyLarge!.color,
                              fontFamily: 'SignikaSemi',
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
          const SizedBox(
            height: 5.0,
          ),
          Divider(
            color: AppColor.greyColor.withOpacity(0.7),
            thickness: 0.7,
          ),
          const SizedBox(
            height: 5.0,
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 120,
                  child: GestureDetector(
                    onTap: () => widget.onTap1!(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.name1,
                          style: Style.Subtitle1.copyWith(
                            color: context.theme.textTheme.bodyLarge!.color,
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          widget.value1,
                          style: Style.Subtitle1.copyWith(
                            color: AppColor.greenColor.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                VerticalDivider(
                  color: AppColor.greyColor.withOpacity(0.7),
                  thickness: 0.7,
                ),
                SizedBox(
                  width: 120,
                  child: GestureDetector(
                    onTap: () => widget.onTap2!(),
                    child: Column(
                      children: [
                        Text(
                          widget.name2,
                          style: Style.Subtitle1.copyWith(
                            color: context.theme.textTheme.bodyLarge!.color,
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          widget.value2,
                          style: Style.Subtitle1.copyWith(
                            color: AppColor.greenColor.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
