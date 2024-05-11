import 'dart:convert';

import 'package:absensi_mahardika/app/widgets/dialog/dialog.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../data/search_model_dosen.dart';
import '../../../utils/color.dart';
import '../../../utils/network.dart';
import '../../../widgets/button/button_confirm.dart';
import '../controllers/list_dosen_controller.dart';

class ListDosenView extends GetView<ListDosenController> {
  const ListDosenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(ListDosenController());
    var jadwalId = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Dosen'),
        centerTitle: true,
      ),
      body: Obx(
        () => Container(
          padding: const EdgeInsets.fromLTRB(12, 20, 15, 0),
          child: Column(
            children: [
              Container(
                height: 50,
                width: Get.width,
                padding: const EdgeInsets.symmetric(
                  vertical: 6.0,
                  horizontal: 12.0,
                ),
                decoration: BoxDecoration(
                  color: AppColor.bluePrimary.withOpacity(0.2),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                  border: Border.all(
                    width: 1.0,
                    color: Colors.grey[400]!,
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.grey[400],
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        initialValue: null,
                        controller: controller.searchCtrl,
                        decoration: InputDecoration.collapsed(
                          filled: true,
                          fillColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          hintText: "Search",
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                            fontFamily: 'Signika',
                            fontSize: 18.0,
                          ),
                        ),
                        onFieldSubmitted: (value) {
                          if (value.isNotEmpty) {
                            Map<String, dynamic> requestParams = {
                              'nama': value,
                              'excludeName': dataUser.value.account!.nama,
                            };
                            controller.isSearch.value = true;
                            controller.searchDosen(requestParams);
                          } else {
                            controller.isSearch.value = false;
                          }
                        },
                      ),
                    ),
                    controller.isSearch.value == true
                        ? Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: GestureDetector(
                              onTap: () {
                                print('object');
                                controller.searchCtrl.clear();
                                controller.getDosenMK(jadwalId[0]);
                                controller.isSearch.value = false;
                              },
                              child: Icon(
                                Icons.clear,
                                color: Colors.grey[400],
                              ),
                            ),
                          )
                        : const SizedBox()
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              controller.isSearch.value == false
                  ? Expanded(
                      child: controller.isDataLoading.value == true
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : ListView.builder(
                              itemCount: controller.dosenData.value.total ?? 0,
                              physics: const ScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                Data data =
                                    controller.dosenData.value.data![index];
                                return CardListDosen(
                                  nama: data.nama ?? '-',
                                  email: data.email ?? '-',
                                  widget: data.dosenUtama != 1
                                      ? IconButton(
                                          onPressed: () {
                                            dialogShow().dialog(
                                              context: context,
                                              dialogType: DialogType.question,
                                              title: 'Apakah anda yakin?',
                                              desc:
                                                  'apakah anda yakin ingin menghapus ${data.nama} dari dosen ${jadwalId[1]}?',
                                              onTap: () {
                                                controller.destroy(data.id!);
                                                controller
                                                    .getDosenMK(jadwalId[0]);
                                                Get.back();
                                              },
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.group_remove_outlined,
                                            size: 24.0,
                                          ),
                                        )
                                      : const SizedBox(),
                                );
                              },
                            ),
                    )
                  : controller.isDataLoading.value == true
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : controller.searchData.value.total == 0
                          ? Expanded(
                              child: Center(
                                child: Container(
                                  child: Lottie.asset(
                                    'assets/lottie/empty.json',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            )
                          : Expanded(
                              child: ListView.builder(
                                itemCount: controller.searchData.value.total,
                                physics: const ScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  Data data =
                                      controller.searchData.value.data![index];

                                  print(controller.isPrimaryLec.value);
                                  return CardListDosen(
                                    nama: data.nama ?? '-',
                                    email: data.email ?? '-',
                                    widget: !controller.isPrimaryLec.value
                                        ? const SizedBox()
                                        : IconButton(
                                            onPressed: () {
                                              dialogShow().dialog(
                                                  context: context,
                                                  dialogType:
                                                      DialogType.question,
                                                  title: 'Apakah Anda Yakin?',
                                                  desc:
                                                      "Apakah anda yakin ingin menambahkan ${data.nama} kedalam mata kuliah ${jadwalId[1]} semester ${jadwalId[2]} sebagai dosen?",
                                                  onTap: () {
                                                    final requestBody = {
                                                      'dosen_id': data.dosenId,
                                                      'jadwal_id': jadwalId[0],
                                                      'status': 'DSN',
                                                    };

                                                    print(jsonEncode(
                                                        requestBody));
                                                    controller
                                                        .addDosen(requestBody);
                                                    Get.back();
                                                  });
                                            },
                                            icon: const Icon(
                                              Icons.person_add_alt_outlined,
                                              size: 24.0,
                                            ),
                                          ),
                                  );
                                },
                              ),
                            ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardListDosen extends StatelessWidget {
  final Widget widget;
  final String nama;
  final String email;
  const CardListDosen({
    Key? key,
    required this.widget,
    required this.nama,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      height: Get.height / 11,
      width: Get.width,
      decoration: BoxDecoration(
        color: AppColor.bluePrimary.withOpacity(0.1),
        borderRadius: const BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
              "https://i.ibb.co/PGv8ZzG/me.jpg",
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nama,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: 'SignikaBold',
                    fontSize: 18.0,
                  ),
                ),
                Text(
                  email,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: 'Signika',
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
          widget
        ],
      ),
    );
  }
}
