import 'package:absensi_mahardika/app/modules/pertemuan/controllers/pertemuan_controller.dart';
import 'package:absensi_mahardika/app/widgets/date_capsule/capsule.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import '../../../utils/bottomsheet.dart';
import '../../../utils/color.dart';
import '../../../widgets/animation/loading.dart';
import '../../../widgets/card/card_mk_dosen.dart';
import '../../pertemuan/views/pertemuan_view.dart';
import '../controllers/home_dosen_controller.dart';

class HomeDosenView extends GetView<HomeDosenController> {
  const HomeDosenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HomeDosenController());
    final pertemuanCtrl = Get.put(PertemuanController());
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(180),
        child: Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(35.0),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(15, 66, 64, 64),
                blurRadius: 10,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            children: [
              AppBar(
                centerTitle: true,
                backgroundColor: Colors.transparent,
                title: Text(
                  DateFormat('EEEE, d MMM yyyy', 'id_ID')
                      .format(controller.date),
                  style: const TextStyle(
                    fontFamily: 'SignikaBold',
                    color: Colors.black,
                  ),
                ),
                
                elevation: 0,
              ),
              Container(
                height: 114,
                width: Get.width,
                decoration: const BoxDecoration(
                    // color: Colors.amber,
                    ),
                child: Container(
                  height: 85,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white,
                        Colors.grey[100]!,
                        Colors.grey[100]!,
                        Colors.grey[100]!,
                        Colors.white,
                      ],
                    ),
                  ),
                  child: hrizontalCapsuleListView(),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
          child: controller.isLoading.value == true
              ? ListView.builder(
                  itemCount: 3,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return const JadwalShimmer();
                  },
                )
              : controller.jadwalDosen.value.data == null
                  ? Container(
                      padding: const EdgeInsets.only(top: 30),
                      child: Lottie.asset(
                        'assets/lottie/empty.json',
                        fit: BoxFit.cover,
                      ),
                    )
                  : ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.jadwalDosen.value.total,
                      itemBuilder: (BuildContext context, int index) {
                        var data = controller.jadwalDosen.value.data![index];
                        var jadwalId = data.jadwalId.toString();
                        var jamMulai = data.jamMulai.toString().substring(0, 5);
                        var jamSelesai =
                            data.jamSelesai.toString().substring(0, 5);
                        var prodi = data.prodi;
                        var mk = data.namaMk;
                        var semester = data.semester.toString();
                        var image = controller.imageAndColor[index]['image'];
                        var colorLine =
                            controller.imageAndColor[index]['colorLine'];
                        var colorShadow =
                            controller.imageAndColor[index]['colorShadow'];
                        return CardMkDosen(
                          image: image,
                          jamMulai: jamMulai ?? '',
                          jamSelesai: jamSelesai ?? '',
                          mk: mk ?? '-',
                          prodi: prodi ?? '-',
                          colorLine: colorLine,
                          colorShadow: colorShadow,
                          jadwal_id: jadwalId,
                          semester: semester ?? '',
                          totalPertemuan: data.totalPertemuan ?? 0,
                          onTap: () {
                            Map<String, dynamic> requestParams = {
                              'jadwal_id': jadwalId,
                            };

                            pertemuanCtrl.getMeet(requestParams);

                            Get.to(() => const PertemuanView(),
                                transition: Transition.rightToLeft,
                                arguments: [jadwalId, mk]);
                          },
                        );
                      },
                    ),
        ),
      ),
    );
  }
}
