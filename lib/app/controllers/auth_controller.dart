import 'dart:convert';
import 'dart:developer';
import 'package:absensi_mahardika/app/data/user_model.dart';
import 'package:absensi_mahardika/app/routes/app_pages.dart';
import 'package:absensi_mahardika/app/utils/bottomsheet.dart';
import 'package:absensi_mahardika/app/utils/network.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart' as dioPackage;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import "package:http/http.dart" as http;

class AuthController extends GetxController {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  var isDataLoading = false.obs;
  var dataUser = userModel().obs;
  var accountUser = Account().obs;
  var nama = ''.obs;
  AndroidDeviceInfo? androidInfo;
  final box = GetStorage();
  var isSkipIntro = false.obs;
  var isAuth = false.obs;

  Future<AndroidDeviceInfo> getInfo() async {
    return await deviceInfo.androidInfo;
  }

  Future register(requestBody) async {
    try {
      print('1');
      var res = await dio.post(
        'http://192.168.1.16:8000/api/register',
        data: {
          'email': 'test@gmail.com',
          'npm': '322E0008',
          'password': 'test12',
          'device_id': '322E0008TQ1A.230205.0021676739431Pocophone F1'
        },
      );
      print('ini print regis ' '$res');
      if (res.statusCode == 200) {
        bottomsheet(
          'Yay! Berhasil',
          'Anda Berhasil Membuat Akun, Silahkan Login',
          () {
            Get.back();
            Get.back();
          },
        );
        print(res.statusCode);

        return res.data;
      }
       if (res.statusCode == 401) {
        bottomsheet('Yah! Gagal', 'Npm Yang Ada Masukan Tidak Terdaftar', () {
          Get.back();
        });
      }
      if (res.statusCode == 402) {
        bottomsheet('Yah! Gagal', 'Npm Yang Anda Masukan Sudah Terdaftar', () {
          Get.back();
        });
      }
    } catch (e) {
        print(e);
        bottomsheet('Yah! Gagal', 'Kesalahan Tidak Diketahui', () {
          Get.back();
        });
    }
  }

  Future getJadwal(requestBody) async {
    try {
      var res = await dio.post(
        jadwalUrl,
        data: dioPackage.FormData.fromMap(requestBody),
      );
      print(res);
      log(res.realUri.toString());
      if (res.statusCode == 200) {
        return res.data;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  // Future register( Map<String, dynamic>  requestBody) async {
  //   try {
  //     print('1');
  //     http.Response response = await http.post(
  //       Uri.tryParse(registerUrl)!,
  //       // headers: {'Content-Type': 'application/json'},
  //       body: {
  //         'email': 'test@gmail.com',
  //         'npm': '322E0008',
  //         'password': 'test12',
  //         'device_id': '322E0008TQ1A.230205.0021676739431Pocophone F1'
  //       },
  //     );
  //     print('2');
  //     if (response.statusCode == 200) {
  //       bottomsheet(
  //         'Yay! Berhasil',
  //         'Anda Berhasil Membuat Akun, Silahkan Login',
  //         () {
  //           Get.back();
  //           Get.back();
  //         },
  //       );
  //       print(response.statusCode);

  //       return response.body;
  //     }
  //   } catch (e) {}
  // }

  Future Login(requestBody) async {
    try {
      isDataLoading(true);
      print('1.p');
      http.Response response = await http.post(
        Uri.parse(loginUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestBody),
      );
      print('2.p');

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        print('3.p');

        dataUser.value = userModel.fromJson(result);
        print('4');

        if (box.read('skipIntro') != null) {
          box.remove('skipIntro');
        }
        box.write('skipIntro', true);
        print('5');

        var data = box.write('token', dataUser.value.account!.rememberToken!);
        print(data);

        Get.offAllNamed(Routes.NAVIGATION_BAR);

        return dataUser;
      }
      if (response.statusCode == 400) {
        bottomsheet(
          'Yah! Gagal Login',
          'Npm atau password yang anda masukan salah',
          () {
            Get.back();
          },
        );
      }

      if (response.statusCode == 401) {
        bottomsheet(
          'Yah! Gagal Login',
          'Silahkan login menggunakan device saat mendaftar',
          () {
            Get.back();
          },
        );
      }
    } catch (e) {
      print(e);
      bottomsheet(
        'Yah! Gagal Login',
        'Kesalahan Tidak Diketahui',
        () {
          Get.back();
        },
      );
    } finally {
      isDataLoading(false);
    }
  }

  Future dashboardLogin(String token) async {
    try {
      isDataLoading(true);
      print('1.1');
      http.Response response = await http.get(
        Uri.parse(dashboardUrl),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      print('2.2');
      // print(jsonDecode(response.body));

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        print('3.3');

        dataUser.value = userModel.fromJson(result);
        print('4.4');

        if (box.read('skipIntro') != null) {
          box.remove('skipIntro');
        }
        box.write('skipIntro', true);
        print('5');

        var data = box.write('token', dataUser.value.account!.rememberToken!);
        print(result);

        return dataUser;
      }
    } catch (e) {
      print(e);
      bottomsheet(
        'Yah! Gagal Login',
        'Kesalahan Tidak Diketahui',
        () {
          Get.back();
        },
      );
    } finally {
      isDataLoading(false);
    }
  }

  Future<bool> skipIntro() async {
    if (box.read('skipIntro') != null || box.read('skipIntro') == true) {
      return true;
    }
    return false;
  }

  Future<bool> autoLogin() async {
    if (box.read('token') == null) {
      return false;
    }

    var myData = box.read('token');
    dashboardLogin(myData);
    return true;
  }

  Future<void> firstInitialized() async {
    await autoLogin().then((value) {
      if (value) {
        isAuth.value = true;
      }
    });

    await skipIntro().then((value) {
      if (value) {
        isSkipIntro.value = true;
      }
    });
  }
}
