import 'package:get/get.dart';
import 'package:absensi_mahardika/app/modules/edit_profil/controllers/edit_profil_controller.dart';
import 'package:absensi_mahardika/app/utils/color.dart';
import 'package:absensi_mahardika/app/utils/style.dart';
import 'package:absensi_mahardika/app/widgets/button/button_gender.dart';
import 'package:flutter/material.dart';

void bottomsheet(String title, String subtitle, Function function) {
  showModalBottomSheet<void>(
    context: Get.context!,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25.0),
      ),
    ),
    builder: (BuildContext context) {
      return SizedBox(
        height: Get.height / 4,
        child: SizedBox(
          height: 100.0,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                width: Get.width / 1.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Text(
                        title,
                        style: Style.Header1.copyWith(),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      height: 60,
                      child: Text(
                        subtitle,
                        style: Style.Subtitle1.copyWith(fontFamily: 'Signika'),
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    SizedBox(
                      width: Get.width,
                      height: Get.height / 22,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.bluePrimary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        onPressed: () => function(),
                        child: const Text("Okay"),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/sad.png"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void GenderBottomsheet() {
  final ctrl = Get.put(EditProfilController());
  showModalBottomSheet<void>(
    context: Get.context!,
    isDismissible: false,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25.0),
      ),
    ),
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(20.0),
        child: Wrap(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        alignment: Alignment.topRight,
                        width: Get.width / 1.8,
                        child: const Text(
                          'Select gender',
                          style: Style.Header2,
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () {
                              if (ctrl.indexGender.value == 0) {
                                ctrl.gender.value = 'Laki-Laki';
                              } else {
                                ctrl.gender.value = 'Perempuan';
                              }
                              print(ctrl.gender.value);
                              Get.back();
                            },
                            child: Text(
                              "confirm",
                              style: Style.Header2.copyWith(
                                fontFamily: 'Signika',
                                color: AppColor.bluePrimary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Obx(() {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ButtonGender(
                          icon: "assets/icons/male.png",
                          label: "Laki-Laki",
                          onTap: () {
                            ctrl.indexGender.value = 0;
                          },
                          borderColor: AppColor.greyColor.withOpacity(0.7),
                          backgroundColor: ctrl.indexGender.value == 0
                              ? AppColor.blueColor2.withOpacity(0.5)
                              : AppColor.greyColor.withOpacity(0.2),
                        ),
                        ButtonGender(
                          icon: "assets/icons/female.png",
                          label: "Perempuan",
                          onTap: () {
                            ctrl.indexGender.value = 1;
                          },
                          borderColor: AppColor.greyColor.withOpacity(0.7),
                          backgroundColor: ctrl.indexGender.value == 1
                              ? AppColor.blueColor2.withOpacity(0.5)
                              : AppColor.greyColor.withOpacity(0.2),
                        ),
                      ],
                    );
                  }),
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
