import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/network.dart';
import '../../../widgets/card/card_mk_dosen.dart';
import '../../list_dosen/controllers/list_dosen_controller.dart';
import '../../list_dosen/views/list_dosen_view.dart';
import '../controllers/tambah_dosen_controller.dart';

class TambahDosenView extends GetView<TambahDosenController> {
  const TambahDosenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(TambahDosenController());
    // Get.lazyPut(() => ListDosenController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Daftar Mata Kuliah'),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
          width: Get.width,
          height: Get.height,
          child: FutureBuilder<List>(
            future: controller.getMK(dataUser.value.account?.dosenId ??
                dataUserLocal['account']['dosenID']),
            builder: (context, snapshot) => snapshot.connectionState ==
                    ConnectionState.waiting
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: snapshot.data?.length ?? 0,
                    physics: const ScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      var loopedIndex = index % controller.imageAndColor.length;

                      var image =
                          controller.imageAndColor[loopedIndex]['image'];
                      var colorLine =
                          controller.imageAndColor[loopedIndex]['colorLine'];
                      var colorShadow =
                          controller.imageAndColor[loopedIndex]['colorShadow'];
                      var data = controller.listMK[index];
                      return CardMkDosen(
                        totalPertemuan: 2,
                        image: image,
                        jamMulai: data['jam_mulai'],
                        jamSelesai: data['jam_selesai'],
                        mk: data['nama'],
                        prodi: data['prodi'],
                        colorLine: colorLine,
                        colorShadow: colorShadow,
                        jadwal_id: '${data['Jadwal_id']}',
                        semester: '${data['semester']}',
                        onTap: () {
                          Get.to(() => const ListDosenView(),
                              transition: Transition.rightToLeft,
                              arguments: [
                                '${data['Jadwal_id']}',
                                '${data['nama']}',
                                '${data['semester']}'
                              ]);
                        },
                      );
                    },
                  ),
          ),
        ));
  }
}
