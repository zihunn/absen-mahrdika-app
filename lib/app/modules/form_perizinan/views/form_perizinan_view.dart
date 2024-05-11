import 'package:absensi_mahardika/app/data/mk_perizinan_model.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
import "package:dio/dio.dart" as dio;
import 'package:absensi_mahardika/app/widgets/textfield/textfield_dropdown.dart';

import '../../../utils/color.dart';
import '../../../utils/network.dart';
import '../../../utils/style.dart';
import '../../../widgets/button/button_icon.dart';
import '../controllers/form_perizinan_controller.dart';

class FormPerizinanView extends GetView<FormPerizinanController> {
  const FormPerizinanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(FormPerizinanController());
    var arguments = Get.arguments;
    List<DataPresensi>? data = arguments[1];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.bgColor,
      appBar: AppBar(
        backgroundColor: AppColor.bgColor,
        elevation: 0,
        title: Text(
          'Form Perizinan',
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
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: Get.width / 2,
                alignment: Alignment.center,
                decoration: const BoxDecoration(),
                child: ListView.builder(
                  itemCount: 3,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    List type = ['Izin', 'Sakit', 'Alpha'];
                    return Obx(() => CardType(
                          text: type[index],
                          color: controller.selectedIndex.value == index
                              ? AppColor.bluePrimary.withOpacity(0.3)
                              : AppColor.bluePrimary.withOpacity(0.05),
                          colorOutline: controller.selectedIndex.value == index
                              ? AppColor.bluePrimary.withOpacity(0.8)
                              : Colors.grey.withOpacity(0.5),
                          colorText: controller.selectedIndex.value == index
                              ? Colors.white
                              : AppColor.blackSoftColor,
                          onTap: () {
                            controller.selectedIndex.value = index;
                            controller.categoryName.value = type[index];
                            print(controller.selectedIndex.value);
                          },
                        ));
                  },
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                margin: const EdgeInsets.only(),
                child: TextField(
                  maxLines: 8,
                  autofocus: true,
                  controller: controller.textCtrl,
                  decoration: InputDecoration(
                    hintText: 'Keterangan......',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(
                        color: AppColor.bluePrimary.withOpacity(0.8),
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFieldDropdown(
                Items: arguments[0],
                selectedValue: controller.selectedValue,
              ),
              const SizedBox(
                height: 20.0,
              ),
              controller.isNullImage.value == true
                  ? SizedBox(
                      width: Get.width,
                      child: DottedBorder(
                        color: Colors.grey,
                        padding: const EdgeInsets.all(20),
                        borderType: BorderType.RRect,
                        strokeWidth: 1,
                        radius: const Radius.circular(18),
                        dashPattern: const [9, 9],
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () =>
                                    controller.pickImage(ImageSource.gallery),
                                child: SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: Image.asset(
                                    "assets/icons/upload.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Text("Upload Foto (.jpg, .jpeg, .png)"),
                            ],
                          ),
                        ),
                      ),
                    )
                  : ListTile(
                      leading: Image.asset(
                        "assets/icons/file.png",
                        fit: BoxFit.fill,
                      ),
                      title: Text(controller.imageName!),
                      trailing: IconButton(
                        onPressed: () => controller.removeImage(),
                        icon: const Icon(
                          Icons.restore_from_trash_rounded,
                          size: 24.0,
                        ),
                      ),
                    ),
              const Spacer(),
              Container(
                height: 50,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(18.0),
                  ),
                ),
                margin: const EdgeInsets.only(bottom: 10),
                child: ElevatedButton(
                  onPressed: () {
                    print(controller.imageName);
                    print(controller.textCtrl.text);
                    print(controller.selectedIndex.value);
                    print(controller.selectedValue.value);
                    print(controller.imageFile?.path);
                    if (controller.textCtrl.text == '' ||
                        controller.selectedIndex.value == 5 ||
                        controller.selectedValue.value == '' ||
                        controller.selectedValue.value ==
                            'Tidak Ada Pertemuan') {
                      print('sad');
                    } else {
                      int index = int.parse(controller.selectedValue.value
                          .split(' ')[1]
                          .toString());

                      print(data?[index - 1].presensiId);

                      Map<String, dynamic> requestBody = {
                        'npm': dataUser.value.account?.npm ??
                            dataUserLocal['account']['npm'],
                        'jadwal_id': arguments[2],
                        'presensi_id': data?[index - 1].presensiId,
                        'description': controller.textCtrl.text,
                        'category': controller.categoryName.value,
                        'file': controller.imageFile == null
                            ? null
                            : dio.MultipartFile.fromFileSync(
                                controller.imageFile!.path),
                        'krs_id': arguments[3],
                      };

                      // controller.createPerizinan(requestBody);
                    }
                  },
                  child: const Center(
                    child: Text('Kirim'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardType extends StatelessWidget {
  final String text;
  final Color color;
  final Color colorText;
  final Color colorOutline;
  final Function onTap;
  final double? fontSize;
  const CardType({
    Key? key,
    required this.text,
    required this.color,
    required this.colorText,
    required this.colorOutline,
    required this.onTap,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(12),
        height: Get.height,
        decoration: BoxDecoration(
          // color: AppColor.bluePrimary.withOpacity(0.05),
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          ),
          border: Border.all(
              // color: AppColor.bluePrimary.withOpacity(0.8),
              color: colorOutline),
        ),
        child: Center(
          child: Text(
            text,
            style: Style.Header2.copyWith(
              color: colorText,
              fontSize: fontSize ?? 16,
            ),
          ),
        ),
      ),
    );
  }
}
