import 'package:absensi_mahardika/app/modules/detail_pusat_bantuan/views/detail_pusat_bantuan_view.dart';
import 'package:absensi_mahardika/app/utils/color.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/faq_controller.dart';

class FaqView extends GetView<FaqController> {
  const FaqView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => FaqController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pusat Bantuan'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        width: Get.width,
        child: ListView.builder(
          itemCount: controller.faqList.length,
          physics: const ScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            var data = controller.faqList[index];
            return Container(
              margin: const EdgeInsets.only(top: 15),
              height: Get.height / 18,
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    data['image'],
                    width: 40.0,
                    height: 40.0,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  SizedBox(
                    width: Get.width / 1.4,
                    child: Text(
                      data['text'],
                      style: const TextStyle(
                        fontFamily: 'SignikaRegular',
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: data['onTap'],
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: AppColor.bluePrimary.withOpacity(0.3),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                        child: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 18.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
