import 'package:absensi_mahardika/app/widgets/animation/loading.dart';
import 'package:absensi_mahardika/app/widgets/list_builder/list_history.dart';
import 'package:get/get.dart';
import 'package:absensi_mahardika/app/utils/color.dart';
import 'package:absensi_mahardika/app/utils/style.dart';
import 'package:absensi_mahardika/app/widgets/appbar/custom_appbar.dart';
import 'package:absensi_mahardika/app/widgets/image_rotate/image_rotate.dart';
import 'package:flutter/material.dart';
import '../../../widgets/empty/empty.dart';
import '../controllers/history_absen_controller.dart';
import 'dart:math' as math;

class HistoryAbsenView extends GetView<HistoryAbsenController> {
  const HistoryAbsenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HistoryAbsenController());
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: context.theme.primaryColor,
        body: Column(
          children: [
            Container(
              height: 75,
              width: Get.width,
              decoration: BoxDecoration(
                color: context.theme.appBarTheme.backgroundColor,
              ),
              child: Stack(
                children: [
                  const ImageRotate(
                    image: "assets/images/image7.png",
                    width: 200,
                    height: 200,
                    angle: -math.pi / 3,
                    left: -90,
                    bottom: -120,
                  ),
                  CustomAppbar(text: 'riwayat_absen'.tr),
                  const ImageRotate(
                    image: "assets/images/image7.png",
                    width: 200,
                    height: 200,
                    angle: -math.pi / 1.8,
                    top: -70,
                    right: -90,
                  ),
                ],
              ),
            ),
            Container(
              height: 50.0,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Stack(children: [
                Positioned(
                  bottom: 9.5,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    height: 2,
                    width: Get.width - 55,
                    decoration: BoxDecoration(
                      color: AppColor.greyColor.withOpacity(0.5),
                    ),
                  ),
                ),
                TabBar(
                  splashFactory: NoSplash.splashFactory,
                  enableFeedback: true,
                  onTap: (value) {
                    var status = '';

                    if (value == 0) {
                      status = 'hadir';
                    }
                    if (value == 1) {
                      status = 'izin';
                    }
                    if (value == 2) {
                      status = 'sakit';
                    }
                    if (value == 3) {
                      status = 'alpa';
                    }

                    controller.status.value = status;

                    print(controller.status.value);
                  },
                  labelStyle: Style.Header1.copyWith(
                    fontSize: 15.0,
                    fontFamily: 'SignikaSemi',
                  ),
                  unselectedLabelStyle: Style.Header1.copyWith(
                    fontSize: 15.0,
                    fontFamily: 'Signika',
                  ),
                  labelColor: context.theme.textTheme.bodyLarge!.color,
                  indicator: const UnderlineTabIndicator(
                    borderRadius: BorderRadius.all(
                      Radius.circular(2),
                    ),
                    borderSide:
                        BorderSide(color: AppColor.blueColor2, width: 1.5),
                  ),
                  padding: const EdgeInsets.all(10),
                  tabs: [
                    Tab(
                      text: 'hadir'.tr,
                    ),
                    Tab(
                      text: 'izin'.tr,
                    ),
                    Tab(
                      text: 'sakit'.tr,
                    ),
                    Tab(
                      text: 'alpa'.tr,
                    ),
                  ],
                ),
              ]),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  /** HADIR **/
                  Obx(
                    () {
                      return controller.isShowShammer.value
                          ? Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: ListView.builder(
                                itemCount: 5,
                                itemBuilder: (BuildContext context, int index) {
                                  return const HistoryShimmer();
                                },
                              ),
                            )
                          : controller.historyHadir.isEmpty
                              ? Empty(
                                  function: () {
                                    controller.getHistory(
                                        controller.requestParamsHadir);
                                  },
                                )
                              : ListBuilderHistory(
                                  title: 'hadir',
                                  color: AppColor.greenColor,
                                  controller: controller.scrollControllerHadir,
                                  list: controller.historyHadir,
                                  isDataLoading: controller.isDataLoading,
                                );
                    },
                  ),
                  /** IZIN **/
                  Obx(
                    () {
                      return controller.isShowShammer.value
                          ? Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: ListView.builder(
                                itemCount: 5,
                                itemBuilder: (BuildContext context, int index) {
                                  return const HistoryShimmer();
                                },
                              ),
                            )
                          : controller.historyizin.isEmpty
                              ? Empty(
                                  function: () {
                                    controller.getHistory(
                                        controller.requestParamsIzin);
                                  },
                                )
                              : ListBuilderHistory(
                                  title: 'izin',
                                  color: AppColor.yellowColor,
                                  controller: controller.scrollControllerIzin,
                                  list: controller.historyizin,
                                  isDataLoading: controller.isDataLoading,
                                );
                    },
                  ),
                  /** SAKIT **/
                  Obx(
                    () {
                      return controller.isShowShammer.value
                          ? Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: ListView.builder(
                                itemCount: 5,
                                itemBuilder: (BuildContext context, int index) {
                                  return const HistoryShimmer();
                                },
                              ),
                            )
                          : controller.historySakit.isEmpty
                              ? Empty(
                                  function: () {
                                    controller.getHistory(
                                        controller.requestParamsSakit);
                                  },
                                )
                              : ListBuilderHistory(
                                  title: 'sakit',
                                  color: Colors.indigoAccent,
                                  controller: controller.scrollControllerSakit,
                                  list: controller.historySakit,
                                  isDataLoading: controller.isDataLoading,
                                );
                    },
                  ),
                  /** APLA **/
                  Obx(
                    () {
                      return controller.isShowShammer.value
                          ? Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: ListView.builder(
                                itemCount: 5,
                                itemBuilder: (BuildContext context, int index) {
                                  return const HistoryShimmer();
                                },
                              ),
                            )
                          : controller.historyAlpa.isEmpty
                              ? Empty(
                                  function: () {
                                    controller.getHistory(
                                        controller.requestParamsAlpa);
                                  },
                                )
                              : ListBuilderHistory(
                                  title: 'alpa',
                                  color: Colors.redAccent,
                                  controller: controller.scrollControllerAlpa,
                                  list: controller.historyAlpa,
                                  isDataLoading: controller.isDataLoading,
                                );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
