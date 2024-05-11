import 'package:absensi_mahardika/app/utils/bottomsheet.dart';
import 'package:absensi_mahardika/app/utils/color.dart';
import 'package:absensi_mahardika/app/widgets/button/button_confirm.dart';
import 'package:absensi_mahardika/app/widgets/textfield/custom_textfield.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../controllers/ubah_password_controller.dart';

class UbahPasswordView extends GetView<UbahPasswordController> {
  const UbahPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(UbahPasswordController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubah Password'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: controller.form,
          child: Obx(
            () => Column(
              children: [
                Container(
                  height: Get.height / 2,
                  width: Get.width,
                  decoration: const BoxDecoration(
                      // color: Colors.amber,
                      ),
                  child: Image.asset(
                    "assets/images/image3.png",
                    // fit: BoxFit.fill,
                  ),
                ),
                textFieldNormal(
                    label: "Password Baru",
                    textCtrl: controller.pass,
                    readOnly: false,
                    ontap: () {},
                    textInputType: TextInputType.text,
                    maxLines: 1,
                    obscureText: controller.isShowPw.value,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        controller.isShowPw.value = !controller.isShowPw.value;
                      },
                      child: controller.isShowPw.value
                          ? const Icon(
                              Ionicons.eye_off_outline,
                            )
                          : const Icon(
                              Ionicons.eye_outline,
                            ),
                    ),
                    icon: const Icon(
                      Icons.lock_open_sharp,
                      size: 24.0,
                    ),
                    onChanged: (value) {
                      controller.pass.text = value;
                    },
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Password is required please enter';
                      }

                      return null;
                    }),
                const SizedBox(
                  height: 20,
                ),
                textFieldNormal(
                    label: "Konfirmasi Password",
                    textCtrl: controller.confirmPass,
                    readOnly: false,
                    ontap: () {},
                    textInputType: TextInputType.text,
                    maxLines: 1,
                    obscureText: controller.isShowPwConfirm.value,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        controller.isShowPwConfirm.value =
                            !controller.isShowPwConfirm.value;
                      },
                      child: controller.isShowPwConfirm.value
                          ? const Icon(
                              Ionicons.eye_off_outline,
                            )
                          : const Icon(
                              Ionicons.eye_outline,
                            ),
                    ),
                    icon: const Icon(
                      Icons.lock_outlined,
                      size: 24.0,
                    ),
                    onChanged: (value) {
                      controller.confirmPass.text = value;
                    },
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Conform password is required please enter';
                      }
                      if (value != controller.pass.text) {
                        return 'Konfirmasi password tidak cocok';
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 40,
                ),
                ButtonConfirm(
                  onTap: () {
                    Map<String, dynamic> requestBody = {
                      'new_password': controller.confirmPass.text
                    };
                    if (controller.form.currentState!.validate() == true) {
                      controller.changePassword(requestBody);
                      
                    }
                  },
                  height: 40,
                  width: Get.width / 2,
                  widthOutline: 0,
                  radius: 8,
                  color: AppColor.bluePrimary,
                  colorOutline: Colors.amber,
                  isOutline: false,
                  widget: const Text("Simpan"),
                )
              ],
            ),
          ),
        ),
      ),

      // To validate call
    );
  }
}
