import 'package:absensi_mahardika/app/data/krs_model.dart';
import 'package:absensi_mahardika/app/widgets/appbar/custom_appbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../utils/color.dart';
import '../../../utils/style.dart';
import '../../../widgets/button/button_icon.dart';
import '../../../widgets/card/card_krs.dart';
import '../controllers/tambah_krs_controller.dart';

class TambahKrsView extends GetView<TambahKrsController> {
  const TambahKrsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(TambahKrsController());
    return Scaffold(
      backgroundColor: context.theme.primaryColor,
      appBar: AppBar(
        backgroundColor: context.theme.primaryColor,
        elevation: 0,
        title: Text(
          'Tambah KRS',
          style: Style.Header1.copyWith(color: AppColor.blackSoftColor),
        ),
        centerTitle: true,
        leading: ButtonIcon(
          height: 50,
          width: 50,
          icon: Ionicons.arrow_back,
          onTap: () => Get.back(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: ButtonIcon(
              height: 45,
              width: 45,
              icon: Icons.shopping_cart_outlined,
              widget: const Badge(
                label: Text(
                  "4",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                child: Icon(Icons.shopping_cart_outlined),
              ),
              onTap: () {},
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
        child: Container(
          height: Get.width,
          width: Get.height,
          decoration: const BoxDecoration(),
          child: ListView.builder(
            itemCount: 3,
            physics: const ScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              var loopedIndex = index % controller.imageAndColor.length;

              var image = controller.imageAndColor[loopedIndex]['image'];
              var color = controller.imageAndColor[loopedIndex]['colorLine'];
              var colorShadow =
                  controller.imageAndColor[loopedIndex]['colorShadow'];

              // Data data = controller.dataKrs.value.data![index];
              return CardKrs(
                image: image,
                color: color,
                colorShadow: colorShadow,
                dosen: 'Indra Surya Permana',
                jamMulai: '09:40:00',
                jamSelesai: '10:40:00',
                namaMk: 'Kalkulus',
                sks: 2,
                isAvail: true,
              );
            },
          ),
        ),
      ),
    );
  }
}
