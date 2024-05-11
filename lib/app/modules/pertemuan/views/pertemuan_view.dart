import 'package:absensi_mahardika/app/utils/color.dart';
import 'package:absensi_mahardika/app/widgets/button/button_confirm.dart';
import 'package:absensi_mahardika/app/widgets/dialog/dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'dart:math' as math;
import '../../../utils/bottomsheet.dart';
import '../../../widgets/animation/loading.dart';
import '../../../widgets/card/card_pertemuan.dart';
import '../../presensi_manual/controllers/presensi_manual_controller.dart';
import '../controllers/pertemuan_controller.dart';

class PertemuanView extends GetView<PertemuanController> {
  const PertemuanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(PertemuanController());
    Get.put(PresensiManualController());

    final data = Get.arguments;
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppBar(
        backgroundColor: AppColor.bluePrimary,
        elevation: 2,
        leading: IconButton(
          splashRadius: 20,
          onPressed: () => Get.back(),
          icon: const Icon(
            CupertinoIcons.arrow_left,
            size: 24.0,
          ),
        ),
        title: Text(data[1]),
        actions: const [
          Icon(
            Icons.chat_outlined,
            size: 24.0,
          ),
        ],
      ),
      body: Obx(
        () => controller.isLoading.value == true
            ? Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView.builder(
                  itemCount: 3,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return const JadwalShimmer();
                  },
                ),
              )
            : controller.listMeet.value.total == 0
                ? Center(
                    child: Container(
                      child: Lottie.asset(
                        'assets/lottie/empty.json',
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                //gfore experience
                : Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    margin: const EdgeInsets.only(top: 15.0),
                    height: Get.height,
                    width: Get.width,
                    child: ListView.builder(
                      itemCount: controller.listMeet.value.total,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        var datas = controller.listMeet.value.data![index];
                        GlobalKey<FormState> formKey = GlobalKey<FormState>();
                        return Slidable(
                          startActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            key: formKey,
                            children: [
                              SlidableAction(
                                padding: const EdgeInsets.all(20),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                onPressed: (context) {
                                  dialogShow().dialog(
                                      context: context,
                                      dialogType: DialogType.question,
                                      title: 'Apakah Anda Yakin?',
                                      desc:
                                          'Jika Anda Menghapus Pertemuan ${datas.pertemuan.toString()} Maka Semua Data Mahasiswa Yang Sudah Absen Akan Ikut Terhapus',
                                      onTap: () async {
                                        Map<String, dynamic> requestParams = {
                                          'jadwal_id': data[0],
                                        };
                                        controller.deleteMeet(
                                            datas.presensiID.toString());
                                        controller.getMeet(requestParams);
                                        Get.back();
                                      });
                                },
                                backgroundColor: const Color(0xFFFE4A49),
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: 'Delete',
                              ),
                            ],
                          ),
                          child: CardPertemuan(
                            color: controller.listColor[index],
                            meet: int.parse(datas.pertemuan.toString()),
                            jam_mulai: datas.jamMulai!,
                            jam_selesai: datas.jamSelesai!,
                            tanggal: DateTime.parse(datas.tanggal!),
                            jadwal_id: datas.jadwalID.toString(),
                            nama_mk: data[1],
                            presensi_id: datas.presensiID.toString(),
                            onTap: () {
                              dialogShow().dialog(
                                  context: context,
                                  dialogType: DialogType.question,
                                  title: 'Apakah Anda Yakin?',
                                  desc:
                                      'Jika Anda Menghapus Pertemuan ${datas.pertemuan.toString()} Maka Semua Data Mahasiswa Yang Sudah Absen Akan Ikut Terhapus',
                                  onTap: () async {
                                    Map<String, dynamic> requestParams = {
                                      'jadwal_id': data[0],
                                    };
                                    controller.deleteMeet(
                                      datas.presensiID.toString(),
                                    );
                                    controller.getMeet(requestParams);
                                    Get.back();
                                  });
                            },
                          ),
                        );
                      },
                    ),
                  ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.blueColor,
        child: const Icon(CupertinoIcons.add),
        onPressed: () => MeetingBottomsheet(context, controller, data[0]),
      ),
    );
  }
}
