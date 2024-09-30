import 'package:absensi_mahardika/app/data/mk_perizinan_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/network.dart';
import '../../../widgets/card/card_mk_dosen.dart';
import '../../form_perizinan/views/form_perizinan_view.dart';
import '../controllers/mk_perizinan_controller.dart';

class MkPerizinanView extends GetView<MkPerizinanController> {
  const MkPerizinanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(MkPerizinanController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mata Kuliah'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
        child: FutureBuilder<MkPerizinanModel?>(
          future: controller.getMk(dataUserLocal['account']['npm']),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Lottie.asset('assets/lottie/loading.json',
                    height: Get.height / 3, width: Get.width / 3),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data?.data?.length ?? 0,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                var dataAsset = controller.imageAndColor[index];
                var data = snapshot.data!.data![index];
                List listDataPertemuan = [];
                print(snapshot.data);
                return CardMkDosen(
                  colorLine: dataAsset['colorLine'],
                  colorShadow: dataAsset['colorShadow'],
                  image: dataAsset['image'],
                  mk: data.nama ?? 'null',
                  totalPertemuan: 2,
                  jamMulai: data.jamMulai ?? 'null',
                  jamSelesai: data.jamSelesai ?? 'null',
                  prodi: data.dosen ?? 'null',
                  jadwal_id: '2',
                  semester: '',
                  onTap: () {
                    int length = 1;
                    listDataPertemuan.clear();
                    if (data.dataPresensi != null) {
                      length = data.dataPresensi!.length;
                      for (var i = 1; i <= length; i++) {
                        listDataPertemuan.add('Pertemuan $i');
                      }
                    } else {
                      listDataPertemuan.add('Tidak Ada Pertemuan');
                    }

                    print(data.dataPresensi?.length ?? 0);
                    print(listDataPertemuan);
                    print(data.dataPresensi);
                    print(data.id);
                    print(data.krsId);
                    Get.to(() => const FormPerizinanView(),
                        arguments: [
                          listDataPertemuan,
                          data.dataPresensi,
                          data.id,
                          data.krsId
                        ],
                        transition: Transition.rightToLeft);
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
