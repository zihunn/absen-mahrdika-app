// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../utils/color.dart';
import '../../../utils/style.dart';
import '../../../widgets/button/button_icon.dart';
import '../../../widgets/textfield/custom_textfield.dart';
import '../../../widgets/textfield/textfield_dropdown.dart';
import '../../form_perizinan/views/form_perizinan_view.dart';
import '../controllers/tambah_task_controller.dart';

class TambahTaskView extends GetView<TambahTaskController> {
  const TambahTaskView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(TambahTaskController());
    return Scaffold(
      // backgroundColor: context.theme.primaryColor,
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.bgColor,
      appBar: AppBar(
        backgroundColor: AppColor.bgColor,

        // backgroundColor: context.theme.primaryColor,
        elevation: 0,
        title: Text(
          'Buat Tugas Baru',
          style: Style.Header1.copyWith(color: AppColor.blackSoftColor),
        ),
        centerTitle: true,
        leading: ButtonIcon(
          height: 50,
          width: 50,
          icon: Ionicons.arrow_back,
          onTap: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFieldTodo(
                nama: "Title",
                sub: 'Nama Tugas',
                line: 1,
                controller: controller.titleCtrl,
              ),
              const SizedBox(height: 20.0),
              TextFieldTodo(
                nama: "Deskripsi",
                sub: 'Deskripsi Tugas',
                line: 5,
                controller: controller.descCtrl,
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFieldDropdown(
                Items: controller.statusItems,
                selectedValue: controller.selectedValue,
                colorFill: AppColor.greyColor.withOpacity(0.2),
                colorOutline: Colors.transparent,
                textStyle: Style.Subtitle1.copyWith(
                  color: AppColor.blackSoftColor.withOpacity(0.5),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                "Kategori",
                style: Style.Header1.copyWith(color: AppColor.blackSoftColor),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                height: Get.height / 20,
                width: Get.width,
                decoration: const BoxDecoration(),
                child: ListView.builder(
                    itemCount: 4,
                    physics: const ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      List type = [
                        'Pekerjaan',
                        'Rutinitas',
                        'Waktu Senggang',
                        'Perkuliahan'
                      ];
                      return Obx(() => CardType(
                            text: type[index],
                            fontSize: 14,
                            color: controller.selectedIndex.value == index
                                ? AppColor.bluePrimary.withOpacity(0.3)
                                : AppColor.bluePrimary.withOpacity(0.05),
                            colorOutline:
                                controller.selectedIndex.value == index
                                    ? AppColor.bluePrimary.withOpacity(0.8)
                                    : Colors.grey.withOpacity(0.5),
                            colorText: controller.selectedIndex.value == index
                                ? Colors.white
                                : AppColor.blackSoftColor,
                            onTap: () {
                              controller.selectedIndex.value = index;
                              print(controller.selectedIndex.value);
                            },
                          ));
                    }),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                "Batas Waktu",
                style: Style.Header1.copyWith(color: AppColor.blackSoftColor),
              ),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: Get.width / 2.3,
                      padding: const EdgeInsets.all(13),
                      decoration: BoxDecoration(
                        color: AppColor.greyColor.withOpacity(0.2),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(16.0),
                        ),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.calendar_month_outlined,
                            color: AppColor.blackSoftColor,
                            size: 24.0,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "Pilih Tanggal",
                            style: TextStyle(
                              color: AppColor.blackSoftColor,
                              fontFamily: 'Signika',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(13),
                        decoration: BoxDecoration(
                          color: AppColor.greyColor.withOpacity(0.2),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(16.0),
                          ),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.access_time_sharp,
                              color: AppColor.blackSoftColor,
                              size: 24.0,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              "Pilih Jam",
                              style: TextStyle(
                                color: AppColor.blackSoftColor,
                                fontFamily: 'Signika',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        margin: const EdgeInsets.fromLTRB(15, 0, 15, 15),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        child: ElevatedButton(
          onPressed: () {},
          child: const Center(
            child: Text('Kirim'),
          ),
        ),
      ),
    );
  }
}

class TextFieldTodo extends StatelessWidget {
  final String nama;
  final String sub;
  final int line;
  final TextEditingController controller;
  const TextFieldTodo({
    Key? key,
    required this.nama,
    required this.sub,
    required this.line,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          nama,
          style: Style.Header1.copyWith(color: AppColor.blackSoftColor),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          decoration: BoxDecoration(
            color: AppColor.greyColor.withOpacity(0.2),
            borderRadius: const BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
          child: TextField(
            controller: controller,
            maxLines: line,
            decoration: InputDecoration(
              hintText: sub,
              hintStyle: Style.Subtitle1.copyWith(
                color: AppColor.blackSoftColor.withOpacity(0.5),
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
