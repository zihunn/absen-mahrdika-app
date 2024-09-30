import 'dart:convert';
import 'dart:io';

import 'package:absensi_mahardika/app/modules/home/controllers/home_controller.dart';
import 'package:absensi_mahardika/app/modules/navigation_bar/controllers/navigation_bar_controller.dart';
import 'package:absensi_mahardika/app/modules/profile/controllers/profile_controller.dart';
import 'package:absensi_mahardika/app/utils/color.dart';
import 'package:absensi_mahardika/app/utils/network.dart';
import 'package:dio/dio.dart' as diopack;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../../data/user_model.dart';
import '../../../utils/bottomsheet.dart';
import '../../profile/views/profile_view.dart';

class EditProfilController extends GetxController {
  RxInt indexGender = 0.obs;
  var isDataLoading = false.obs;
  static GetStorage box = GetStorage();
  static var homeCtrl = Get.put(HomeController()).dataUserLocal;
  static var profilCtrl = Get.put(ProfileController()).dataUserLocal;

  get dataUserLocal => (box.read('dataUser') ?? "");

  RxString gender = ''.obs;
  RxString image = ''.obs;
  final picker = ImagePicker();
  RxString selectedDate = ''.obs;
  var dataUserModel = userModel().obs;
  File? img;
  late var nameCtrl = TextEditingController(
    text: dataUserLocal['account']['nama'],
  );

  late var noCtrl = TextEditingController(
    text: dataUserLocal['account']['noHp'],
  );

  late var emailCtrl =
      TextEditingController(text: dataUserLocal['account']['email']);

  EditProfilController() {
    print('edit ctrl');
  }

//Crop Image
  cropImage(File imgFile) async {
    final croppedFile = await ImageCropper().cropImage(
        sourcePath: imgFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: "Image Cropper",
              toolbarColor: AppColor.blueColor,
              cropGridColor: AppColor.whiteColor,
              activeControlsWidgetColor: AppColor.blueColor,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: "Image Cropper",
          )
        ]);
    if (croppedFile != null) {
      // imageCache.clear();
      image.value = croppedFile.path;
      img = File(croppedFile.path);
      print(croppedFile.path);
      print(image.value);
      update();
    }
  }

// Get image
  void getImage() async {
    try {
      final checkDataImage =
          await picker.pickImage(source: ImageSource.gallery);
      if (checkDataImage != null) {
        cropImage(File(checkDataImage.path));
      }
      update();
    } catch (e) {
      print(e);
    }
  }

// edit profil
  Future editProfil(requestBody, String npm) async {
    try {
      var navCtrl = Get.put(NavigationBarController());
      var response = await dio.post(
        '$editProfilUrl$npm',
        options: diopack.Options(headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        }),
        data: diopack.FormData.fromMap(requestBody),
      );

      print(editProfilUrl + npm);
      if (response.statusCode == 200) {
        // print(dataUser.value.account!.image);
        print(response.data);
        if (box.read('dataUser') != null) {
          box.remove('dataUser');
        }
        await box.write('dataUser', response.data);
        homeCtrl = box.read('dataUser');
        profilCtrl = box.read('dataUser');

        bottomsheet(
          title: 'Yay Berhasil!',
          subtitle: 'Data kamu berhasil diubah',
          image: 'assets/images/happy-illustration.png',
          onTap: () async {
            Get.back();
          },
        );
        return dataUserLocal;
      }
    } catch (e) {
      print(e);
      bottomsheet(
        title: 'Yah Gagal!',
        subtitle: 'Kesalahan tidak diketahui',
        image: 'assets/images/sad-illustration.png',
        onTap: () {
          Get.back();
        },
      );
    } finally {
      isDataLoading(false);
    }
  }

  void datePicker() async {
    final DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(2002),
      lastDate: DateTime(2050),
    );
    if (pickedDate != null && pickedDate != selectedDate.value) {
      final DateFormat formatter = DateFormat('yyyy-MM-dd');

      selectedDate.value = formatter.format(pickedDate);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    box.listen(() => print('box changed edit controller'));
    // gender.value = '${dataUserLocal['account']['jenis_kelamin']}';
    // selectedDate.value = '${dataUserLocal['account']['tanggal_lahir']}';
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    // box.listen(() => print('box changed edit controller'));

    super.onClose();
  }
}
