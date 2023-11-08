import 'package:get/get.dart';
import 'dart:io';

import "package:dio/dio.dart" as dio;
import 'package:absensi_mahardika/app/widgets/button/button_icon.dart';
import 'package:absensi_mahardika/app/utils/bottomsheet.dart';
import 'package:absensi_mahardika/app/utils/color.dart';
import 'package:absensi_mahardika/app/utils/style.dart';
import 'package:absensi_mahardika/app/widgets/button/button_confirm.dart';
import 'package:absensi_mahardika/app/widgets/textfield/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../../../utils/network.dart';
import '../controllers/edit_profil_controller.dart';

class EditProfilView extends GetView<EditProfilController> {
  const EditProfilView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(EditProfilController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Edit Profil',
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
      body: Container(
        width: Get.width,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => controller.getImage(),
                child: Container(
                  height: 90,
                  width: 90,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: Stack(
                    children: [
                      Obx(() {
                        return Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: controller.image.value == ''
                                ? dataUser.value.account!.image == null
                                    ? const DecorationImage(
                                        image: AssetImage(
                                            'assets/images/noimage.png'),
                                      )
                                    : DecorationImage(
                                        image: NetworkImage(
                                            dataUser.value.account!.image!),
                                      )
                                : DecorationImage(
                                    image: FileImage(
                                      File(controller.image.value),
                                    ),
                                  ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                "Muhammad Rizki",
                style: Style.Header1.copyWith(
                  fontFamily: 'SignikaSemi',
                  color: AppColor.blackSoftColor,
                  fontSize: 20.0,
                ),
              ),
              Text(
                "Teknik Informatika",
                style: Style.Header1.copyWith(
                  fontFamily: 'SignikaRegular',
                  color: AppColor.greyColor,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Divider(
                thickness: 1,
                color: AppColor.greyColor.withOpacity(0.4),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFieldEditProfil(
                readOnly: true,
                label: 'Full Name',
                isTextField: true,
                controller: controller.nameCtrl,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => GenderBottomsheet(),
                      child: SizedBox(
                        width: 175,
                        child: TextFieldEditProfil(
                          readOnly: true,
                          label: 'Gender',
                          isTextField: false,
                          text: controller.gender.value,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.datePicker();
                        print(controller.selectedDate.value);
                      },
                      child: SizedBox(
                        width: 175,
                        child: TextFieldEditProfil(
                          readOnly: true,
                          label: 'Birthday',
                          isTextField: false,
                          text: controller.selectedDate.value,
                        ),
                      ),
                    ),
                  ],
                );
              }),
              const SizedBox(
                height: 20.0,
              ),
              TextFieldEditProfil(
                type: TextInputType.number,
                readOnly: false,
                label: 'Phone number',
                isTextField: true,
                controller: controller.noCtrl,
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFieldEditProfil(
                readOnly: false,
                label: 'Email',
                isTextField: true,
                type: TextInputType.emailAddress,
                controller: controller.emailCtrl,
              ),
              const SizedBox(
                height: 30.0,
              ),
              ButtonConfirm(
                onTap: () async {
                  Map<String, dynamic> requestBody = {
                    'jenis_kelamin': controller.gender.value,
                    'tanggal_lahir': controller.selectedDate.value,
                    'no_hp': controller.noCtrl.value.text,
                    'email': controller.emailCtrl.value.text,
                    'image': controller.image.value == ''
                        ? null
                        : dio.MultipartFile.fromFileSync(
                            controller.image.value),
                    '_method': 'put'
                  };
                  print(requestBody);
                  controller.editProfil(requestBody, dataUser.value.account!.npm!);
                },
                height: 50,
                width: Get.width,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
