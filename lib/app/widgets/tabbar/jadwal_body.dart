import 'package:absensi_mahardika/app/modules/jadwal_kuliah/controllers/jadwal_kuliah_controller.dart';
import 'package:absensi_mahardika/app/widgets/animation/loading.dart';
import 'package:absensi_mahardika/app/widgets/card/bg_container.dart';
import 'package:absensi_mahardika/app/widgets/card/card_home.dart';
import 'package:absensi_mahardika/app/widgets/card/card_jadwal_pelajaran.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../utils/network.dart';

class JadwalBody extends StatefulWidget {
  const JadwalBody({Key? key}) : super(key: key);

  @override
  State<JadwalBody> createState() => _JadwalTabStBody();
}

class _JadwalTabStBody extends State<JadwalBody> {
  @override
  Widget build(BuildContext context) {
    final jadwalCtrl = Get.put(JadwalKuliahController());
    return Container(
      margin: const EdgeInsets.only(top: 75),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Stack(
          children: [
            BgContainer(
              child: Obx(
                () => jadwalCtrl.isDataLoading.value
                    ? ListView.builder(
                        itemCount: 3,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return const JadwalShimmer();
                        },
                      )
                    : jadwalCtrl.isConnection.value
                        ? Padding(
                            padding: const EdgeInsetsDirectional.symmetric(
                              horizontal: 40,
                              vertical: 140,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Map<String, dynamic> requestParams = {
                                  'npm': dataUser.value.account!.npm,
                                  'date': jadwalCtrl.selectedDate.value
                                      .toString()
                                      .split(' ')
                                      .first
                                };
                                jadwalCtrl.getJadwal(requestParams);
                              },
                              child: const Text(
                                "Something went wrong, Tap to try again.",
                              ),
                            ),
                          )
                        : jadwalCtrl.jadwalData?.data == null
                            ? Padding(
                                padding: const EdgeInsetsDirectional.only(
                                  top: 30,
                                  bottom: 10,
                                ),
                                child: Lottie.asset('assets/lottie/empty.json'),
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListView.builder(
                                    itemCount: jadwalCtrl.jadwalData!.total,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      var data =
                                          jadwalCtrl.jadwalData!.data![index];
                                      return JadwalCard(
                                        matkul: jadwalCtrl
                                            .allWordsCapitilize(data.matkul!),
                                        dosen: data.dosen!,
                                        jamMulai:
                                            data.jamMulai!.substring(0, 5),
                                        jamSelesai:
                                            data.jamSelesai!.substring(0, 5),
                                        // matkul: 'asd',
                                        // dosen: 'asd',
                                        // jamMulai: 'asd',
                                        // jamSelesai: 'asdsd',
                                        color: jadwalCtrl.imageAndColor[index]
                                            ['color'],
                                        image: jadwalCtrl.imageAndColor[index]
                                            ['image'],
                                      );
                                    },
                                  ),
                                ],
                              ),
              ),
            ),
            Positioned(
              left: 22,
              child: Obx(
                () => CardTabbar(
                    days: DateFormat('EEEE, d MMM yyyy', "id_ID")
                        .format(jadwalCtrl.selectedDate.value),
                    onTapDatePicker: () {
                      jadwalCtrl.datePicker();
                    },
                    onTap1: () {},
                    onTap2: () {},
                    image: "assets/icons/calendar.png",
                    showClock: false,
                    name1: "matkul_hari_ini".tr,
                    // value1: '2',
                    value1: jadwalCtrl.isDataLoading.value
                        ? '0'
                        : jadwalCtrl.jadwalData!.total.toString(),
                    name2: "SKS",
                    // value2:'asd'
                    value2: dataUser.value.account!.sks.toString(),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
