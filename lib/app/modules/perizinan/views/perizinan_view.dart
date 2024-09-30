import 'dart:convert';

import 'package:absensi_mahardika/app/data/history_perizinan_model.dart';
import 'package:absensi_mahardika/app/modules/MkPerizinan/views/mk_perizinan_view.dart';
import 'package:absensi_mahardika/app/modules/form_perizinan/views/form_perizinan_view.dart';
import 'package:absensi_mahardika/app/widgets/animation/loading.dart';
import 'package:absensi_mahardika/app/widgets/card/card_history_perizinan.dart';
import 'package:absensi_mahardika/app/widgets/card/card_mk_dosen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';

import '../../../data/mk_perizinan_model.dart';
import '../../../utils/color.dart';
import '../../../utils/network.dart';
import '../../../utils/style.dart';
import '../../../widgets/button/button_icon.dart';
import '../controllers/perizinan_controller.dart';

class PerizinanView extends GetView<PerizinanController> {
  const PerizinanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(PerizinanController());
    Map<String, dynamic> requestParams = {
      'npm': dataUserLocal['account']['npm']
    };
    return Scaffold(
      backgroundColor: context.theme.primaryColor,
      appBar: AppBar(
        backgroundColor: context.theme.primaryColor,
        elevation: 0,
        title: Text(
          'Perizinan',
          style: Style.Header1.copyWith(
              color: context.theme.textTheme.bodyLarge!.color),
        ),
        centerTitle: true,
        leading: ButtonIcon(
          height: 50,
          width: 50,
          icon: Ionicons.arrow_back,
          onTap: () => Get.back(),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 15, 10),
            child: Row(
              children: [
                Text(
                  "12",
                  style: Style.Subtitle1,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Icon(
                  Icons.bookmark,
                  size: 24.0,
                  color: AppColor.bluePrimary,
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
        child: FutureBuilder<HistoryPerizinanModel?>(
          future: controller.show(requestParams),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return ListView.builder(
                itemCount: 3,
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return const CardPerizinanShimmer();
                },
              );
              // return Center(
              //   child: Lottie.asset('assets/lottie/loading.json',
              //       height: Get.height / 3, width: Get.width / 3),
              // );
            }
            return ListView.builder(
              itemCount: snapshot.data?.data?.length ?? 0,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                var dataAsset = controller.imageAndColor[index];
                var data = snapshot.data!.data![index];
                List listDataPertemuan = [];
                print(snapshot.data);
                return CustomCard.CardHistoryPerizinan(
                  name: controller.allWordsCapitilize(data.namaMk ?? ''),
                  date: data.tanggal,
                  status: data.disetujui ?? 'Pending',
                  color:
                      data.disetujui != null ? AppColor.greenColor : Colors.red,
                );
                // return CardMkDosen(
                //   colorLine: dataAsset['colorLine'],
                //   colorShadow: dataAsset['colorShadow'],
                //   image: dataAsset['image'],
                //   mk: data.nama ?? 'null',
                //   totalPertemuan: 2,
                //   jamMulai: data.jamMulai ?? 'null',
                //   jamSelesai: data.jamSelesai ?? 'null',
                //   prodi: data.dosen ?? 'null',
                //   jadwal_id: '2',
                //   semester: '',
                //   onTap: () {
                //     int length = 1;
                //     listDataPertemuan.clear();
                //     if (data.dataPresensi != null) {
                //       length = data.dataPresensi!.length;
                //       for (var i = 1; i <= length; i++) {
                //         listDataPertemuan.add('Pertemuan $i');
                //       }
                //     } else {
                //       listDataPertemuan.add('Tidak Ada Pertemuan');
                //     }

                //     print(data.dataPresensi?.length ?? 0);
                //     print(listDataPertemuan);
                //     print(data.dataPresensi);
                //     print(data.id);
                //     print(data.krsId);
                //     Get.to(() => const FormPerizinanView(),
                //         arguments: [
                //           listDataPertemuan,
                //           data.dataPresensi,
                //           data.id,
                //           data.krsId
                //         ],
                //         transition: Transition.rightToLeft);
                //   },
                // );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Get.to(() => const MkPerizinanView(),
              transition: Transition.rightToLeft);
        },
      ),
    );
  }
}
