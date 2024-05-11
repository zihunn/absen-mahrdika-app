import 'package:absensi_mahardika/app/utils/color.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../controllers/detail_pusat_bantuan_controller.dart';

class DetailPusatBantuanView extends GetView<DetailPusatBantuanController> {
  const DetailPusatBantuanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    return Scaffold(
      backgroundColor: const Color(0xffF4F4F4),
      appBar: AppBar(
        title: Text(data[0]['title']),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: data[0]['total'],
        physics: const ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 15, 15, 0),
            child: Column(
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: AppColor.bluePrimary.withOpacity(0.2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: AppColor.bluePrimary.withOpacity(0.2),
                        ),
                        child: Text(
                          '${index + 1}. ${data[index]['text']}',
                          style: const TextStyle(
                            fontFamily: 'SignikaSemi',
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        width: Get.width,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Image.asset(
                          data[index]['image'],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
