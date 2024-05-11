import 'package:absensi_mahardika/app/data/list_presensi_hadir_model.dart';
import 'package:absensi_mahardika/app/widgets/animation/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/color.dart';
import '../../../widgets/button/button_qr_presensi.dart';
import '../../../widgets/card/card_mhsw.dart';
import '../controllers/detail_pertemuan_controller.dart';

class DetailPertemuanView extends GetView<DetailPertemuanController> {
  const DetailPertemuanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final dataMk = Get.arguments;
    Map<String, dynamic> requestParams = {'presensi_id': dataMk[3]};
    Get.put(DetailPertemuanController());
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppBar(
        backgroundColor: AppColor.bluePrimary,
        elevation: 2,
        title: Text(
          'Pertemuan ${dataMk[0]}',
          style: const TextStyle(
            fontFamily: 'SignikaSemi',
            fontSize: 19.0,
          ),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<PresensiHadirModel>(
        stream: controller.streamDataHadir(requestParams),
        builder: (context, snapshot) {
          var dataMhsw = snapshot.data;

          return snapshot.connectionState == ConnectionState.waiting
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        ButtonQrAndPreseni(dataMk: dataMk),
                        const SizedBox(
                          height: 20.0,
                        ),
                        ListView.builder(
                          itemCount: 6,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.all(0),
                          itemBuilder: (BuildContext context, int index) {
                            return const CardMhswShimmer();
                          },
                        ),
                      ],
                    ),
                  ),
                )
              : controller.listMhsw.value.data != null
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            ButtonQrAndPreseni(dataMk: dataMk),
                            const SizedBox(
                              height: 20.0,
                            ),
                            ListView.builder(
                              itemCount: snapshot.data?.total ?? 0,
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              padding: const EdgeInsets.all(0),
                              itemBuilder: (BuildContext context, int index) {
                                var mhsw = dataMhsw!.data![index];
                                print(mhsw);
                                return CardMahasiswa(
                                  no: index++,
                                  nama: mhsw.nama ?? 'null',
                                  npm: mhsw.npm ?? 'null',
                                  image: mhsw.image ?? 'null',
                                  widget: Container(
                                    height: Get.height / 35,
                                    width: Get.width / 7,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(8.0),
                                      ),
                                      color:
                                          AppColor.greenColor.withOpacity(0.2),
                                      border: Border.all(
                                          color: AppColor.greenColor),
                                    ),
                                    child: Center(
                                      child: Text(
                                        mhsw.status ?? 'null',
                                        style: const TextStyle(
                                          fontFamily: 'SignikaSemi',
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Column(
                        children: [
                          Container(
                            child: ButtonQrAndPreseni(dataMk: dataMk),
                          ),
                          Expanded(
                            child: Center(
                                child: Container(
                              child: Lottie.asset(
                                'assets/lottie/empty.json',
                                fit: BoxFit.cover,
                              ),
                            )),
                          ),
                        ],
                      ),
                    );
        },
      ),
    );
  }
}
