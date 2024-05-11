import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/color.dart';

class JadwalShimmer extends StatelessWidget {
  const JadwalShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.white,
      child: Container(
        height: 130,
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.only(bottom: 20),
        width: Get.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          color: Colors.transparent,
        ),
        child: Stack(
          children: [
            Row(
              children: [
                Skeleton(
                  width: Get.width / 3,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 70,
                          child: Skeleton(
                            height: 15,
                          ),
                        ),
                        SizedBox(
                          height: 11.0,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Skeleton(
                                height: 12,
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Skeleton(
                                height: 12,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HistoryShimmer extends StatelessWidget {
  const HistoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.white,
      child: Container(
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.only(bottom: 15),
        height: 100,
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
          boxShadow: [
            BoxShadow(
              color: context.theme.shadowColor,
              blurRadius: 5,
              blurStyle: BlurStyle.outer,
              offset: const Offset(0, 3),
            ),
          ],
          color: Colors.transparent,
          // color: context.theme.primaryColor,
        ),
        child: Row(
          children: [
            Skeleton(
              height: Get.height,
              width: 6,
            ),
            const SizedBox(
              width: 20.0,
            ),
            SizedBox(
              width: Get.width / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 70,
                    width: Get.width,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Skeleton(
                          height: 15,
                          width: 150,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Skeleton(
                          height: 15,
                          width: 150,
                        ),
                      ],
                    ),
                  ),
                  const Skeleton(
                    height: 15,
                    width: 150,
                  ),
                ],
              ),
            ),
            const Expanded(child: Skeleton())
          ],
        ),
      ),
    );
  }
}

class CardMhswShimmer extends StatelessWidget {
  const CardMhswShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.white,
      child: Container(
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
              Skeleton(
                height: Get.height,
                width: Get.width / 7,
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
                      Skeleton(
                        height: Get.height / 45,
                        width: Get.width / 3,
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Skeleton(
                        height: Get.height / 45,
                        width: Get.width / 3,
                      ),
                    ],
                  ),
                ),
              ),
              Skeleton(
                height: Get.height / 35,
                width: Get.width / 7,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Skeleton extends StatelessWidget {
  final double? height;
  final double? width;
  const Skeleton({
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2),
        borderRadius: const BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
    );
  }
}
