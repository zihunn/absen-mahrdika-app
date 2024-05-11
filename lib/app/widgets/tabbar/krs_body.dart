// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

import 'package:absensi_mahardika/app/data/krs_model.dart';
import 'package:absensi_mahardika/app/modules/krs/controllers/krs_controller.dart';
import 'package:absensi_mahardika/app/utils/network.dart';

import '../../utils/color.dart';
import '../animation/loading.dart';
import '../card/bg_container.dart';
import '../card/card_home.dart';
import '../card/card_krs.dart';

class KrsBody extends StatefulWidget {
  const KrsBody({super.key});

  @override
  State<KrsBody> createState() => _KrsBodyState();
}

class _KrsBodyState extends State<KrsBody> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(KrsController());
    Map<String, dynamic> requestParams = {
      'npm': dataUser.value.account?.npm ?? dataUserLocal['account']['npm']
    };
    return Container(
        margin: const EdgeInsets.only(top: 95),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        child: FutureBuilder(
          future: controller.getKrs(requestParams),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              krsModel datas = controller.dataKrs.value;
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: BgContainer(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListView.builder(
                                itemCount:
                                    controller.dataKrs.value.data?.length ?? 0,
                                physics: const NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  var loopedIndex =
                                      index % controller.imageAndColor.length;

                                  var image = controller
                                      .imageAndColor[loopedIndex]['image'];
                                  var color = controller
                                      .imageAndColor[loopedIndex]['colorLine'];
                                  var colorShadow =
                                      controller.imageAndColor[loopedIndex]
                                          ['colorShadow'];

                                  Data data =
                                      controller.dataKrs.value.data![index];
                                  return CardKrs(
                                    image: image,
                                    color: color,
                                    colorShadow: colorShadow,
                                    dosen: data.dosen ?? '-',
                                    jamMulai: data.jamMulai ?? '-',
                                    jamSelesai: data.jamSelesai ?? '-',
                                    namaMk: data.nama ?? '-',
                                    sks: data.sks ?? 0, 
                                    isAvail: datas.availKrs ?? false,
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 18,
                      child: CardTabKrs(
                        namaDosen: datas.dosen ?? '-',
                        mulaiKrs: datas.mulaiKrs ?? '-',
                        selesaiKrs: datas.selesaiKrs ?? '-',
                        totalSKS: datas.totalSks ?? '-',
                        statusKrs: datas.statusKrs ?? '-',
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ));
  }
}

class CardTabKrs extends StatelessWidget {
  final String namaDosen;
  final String mulaiKrs;
  final String selesaiKrs;
  final String totalSKS;
  final String statusKrs;
  const CardTabKrs({
    Key? key,
    required this.namaDosen,
    required this.mulaiKrs,
    required this.selesaiKrs,
    required this.totalSKS,
    required this.statusKrs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width / 1.10,
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Dosen Wali",
            style: TextStyle(
              fontFamily: 'SignikaBold',
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            namaDosen,
            style: const TextStyle(
              fontFamily: 'Signika',
              fontSize: 15.0,
            ),
          ),
          Divider(
            color: AppColor.greyColor.withOpacity(0.7),
            thickness: 0.7,
          ),
          const Text(
            "Masa KRS",
            style: TextStyle(
              fontFamily: 'SignikaBold',
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            "$mulaiKrs - $selesaiKrs",
            style: const TextStyle(
              fontFamily: 'Signika',
              fontSize: 15.0,
            ),
          ),
          Divider(
            color: AppColor.greyColor.withOpacity(0.7),
            thickness: 0.7,
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text(
                      "Status KRS",
                      style: TextStyle(
                        fontFamily: 'SignikaBold',
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.green[100],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      child: Text(
                        statusKrs,
                        style: const TextStyle(
                          fontFamily: 'Signika',
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ],
                ),
                VerticalDivider(
                  color: AppColor.greyColor.withOpacity(0.7),
                  thickness: 0.7,
                ),
                Column(
                  children: [
                    const Text(
                      "       SKS       ",
                      style: TextStyle(
                        fontFamily: 'SignikaBold',
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      totalSKS,
                      style: const TextStyle(
                        fontFamily: 'Signika',
                        fontSize: 15.0,
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
