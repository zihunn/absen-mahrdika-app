import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as diopack;


import '../../../utils/bottomsheet.dart';
import '../../../utils/network.dart';

class FormPerizinanController extends GetxController {
  RxString selectedValue = ''.obs;
  RxString categoryName = ''.obs;
  RxInt selectedIndex = 5.obs;
  final formKey = GlobalKey<FormState>();
  RxString image = ''.obs;
  final ImagePicker _picker = ImagePicker();
  XFile? imageFile;
  RxBool isNullImage = true.obs;
  TextEditingController textCtrl = TextEditingController();

  // Fungsi untuk mengambil gambar
  Future<void> pickImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        imageFile = pickedFile;
        isNullImage.value = false;
        print("Image Selected: ${imageFile!.path}");
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print('Error occurred while picking the image: $e');
    }
  }

  // Fungsi untuk mendapatkan nama gambar
  String? get imageName => imageFile?.name;

  // Fungsi untuk menghapus gambar
  void removeImage() {
    if (imageFile != null) {
      File(imageFile!.path).delete().then((_) {
        imageFile = null;
        isNullImage.value = true;
        print('Image removed');
      }).catchError((error) {
        print('Error occurred while deleting the image: $error');
      });
    }
  }

  Future createPerizinan(requestBody) async {
    try {
      var url = Uri.http(baseUrl, 'api/perizinan');

      var response = await dio.post(
        '$perizinanUrl',
        options: diopack.Options(headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        }),
        data: diopack.FormData.fromMap(requestBody),
      ).timeout(Duration(minutes: 1));

      // print(response.body);
      print(url);
      if (response.statusCode == 200) {
        bottomsheet(
          title: 'Yay Berhasil!',
          subtitle: 'Berhasil Membuat Perizinan',
          image: 'assets/images/happy-illustration.png',
          onTap: () {
            Get.back();
          },
        );
      }
    } on TimeoutException catch (_) {
      bottomsheet(
        title: 'Yah Gagal!',
        subtitle: 'Perikas kembali koneksi anda',
        image: 'assets/images/sad-illustration.png',
        onTap: () {
          Get.back();
        },
      );
    } on SocketException catch (_) {
      bottomsheet(
        title: 'Yah Gagal!',
        subtitle: 'Kesalahan tidak diketahui',
        image: 'assets/images/sad-illustration.png',
        onTap: () {
          Get.back();
        },
      );
    }
  }

  final List<String> genderItems = [
    'Male',
    'Female',
  ];
}
