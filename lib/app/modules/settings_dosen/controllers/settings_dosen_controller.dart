import 'package:absensi_mahardika/app/controllers/auth_controller.dart';
import 'package:absensi_mahardika/app/modules/edit_profil/views/edit_profil_view.dart';
import 'package:absensi_mahardika/app/modules/ubah_password/views/ubah_password_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:http/http.dart" as http;
import '../../../routes/app_pages.dart';
import '../../../utils/color.dart';
import '../../../utils/network.dart';
import '../../faq/views/faq_view.dart';
import '../../tambah_dosen/views/tambah_dosen_view.dart';

class SettingsDosenController extends GetxController {
  static var authCtrl = Get.put(AuthController());
  List<Map<String, dynamic>> listFiturGeneral = [
    {
      'title': 'Edit Profil',
      'subtitle': 'Ubah Foto Profil,Email,Nomor Hp',
      'icon': const Icon(
        Icons.person_2_outlined,
        size: 18,
        color: Colors.blue,
      ),
      'BColor': AppColor.blueColor.withOpacity(0.2),
      'textColor': AppColor.blackSoftColor,
      'onTap': () {
        Get.to(
          () => const EditProfilView(),
          transition: Transition.rightToLeft,
        );
      }
    },
    {
      'title': 'Ubah Password',
      'subtitle': 'Ubah dan Memperkuat Keamanan Akun',
      'icon': const Icon(
        Icons.lock_outline,
        size: 18,
        color: Colors.blue,
      ),
      'BColor': AppColor.blueColor.withOpacity(0.2),
      'textColor': AppColor.blackSoftColor,
      'onTap': () {
        Get.to(
          () => const UbahPasswordView(),
          transition: Transition.rightToLeft,
        );
      }
    },
    {
      'title': 'Tambah Dosen',
      'subtitle': 'Menambahkan Dosen lain Kedalam MK',
      'icon': const Icon(
        Icons.person_add_alt_1_outlined,
        size: 18,
        color: Colors.blue,
      ),
      'BColor': AppColor.blueColor.withOpacity(0.2),
      'textColor': AppColor.blackSoftColor,
      'onTap': () {
        Get.to(() => const TambahDosenView(),
            transition: Transition.rightToLeft);
      }
    },
  ];

  List<Map<String, dynamic>> listFiturOther = [
    {
      'title': 'FAQ',
      'subtitle': 'Ubah dan Memperkuat Keamanan Akun',
      'icon': const Icon(
        Icons.info_outlined,
        size: 18,
        color: Colors.blue,
      ),
      'BColor': AppColor.blueColor.withOpacity(0.2),
      'textColor': AppColor.blackSoftColor,
      'onTap': () {
        Get.to(() => const FaqView(), transition: Transition.rightToLeft);
        print(token);
      }
    },
    {
      'title': 'Log Out',
      'subtitle': 'Keluar dari Akun',
      'icon': const Icon(
        Icons.logout_outlined,
        size: 18,
        color: Colors.red,
      ),
      'BColor': Colors.red.withOpacity(0.1),
      'textColor': Colors.red,
      'onTap': () {
        // Get.offAllNamed(Routes.LOGIN);
        logout(token);
      }
    },
  ];

  static void logout(String token) async {
    try {
      http.Response response = await http.get(
        Uri.tryParse(logoutUrl)!,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        box.remove('token');
        authCtrl.isAuth.value = false;
        print(box.read('token'));
        print(authCtrl.isAuth.value);
        Get.offAllNamed(Routes.LOGIN);
      }
    } catch (e) {}
  }
}
