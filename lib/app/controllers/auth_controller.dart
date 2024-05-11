import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
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

  Future<String> getDeviceId() async {
    var deviceInfo = DeviceInfoPlugin();
    late String deviceId;

    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      deviceId = iosDeviceInfo.identifierForVendor!;
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
    } else {
      deviceId = 'null';
    }
    return deviceId;
  }

  Future getInfo() async {
    if (Platform.isAndroid) {
      return await deviceInfo.androidInfo;
    } else if (Platform.isIOS) {
      return await deviceInfo.iosInfo;
    }
  }

  Future register(requestBody) async {
    try {
      print('1');
      var res = await dio.post(registerUrl, data: jsonEncode(requestBody));
      print('ini print regis ' '$res');
      print(registerUrl);
      if (res.statusCode == 200) {
        bottomsheet(
          title: 'Yay Berhasil!',
          subtitle: 'Anda berhasil membuat akun. Silahkan login',
          image: 'assets/images/happy-illustration.png',
          onTap: () {
            Get.back();
            Get.back();
          },
        );
        print(res.statusCode);

        return res.data;
      }
      if (res.statusCode == 401) {
        bottomsheet(
          title: 'Yah Gagal!',
          subtitle: 'Npm yang anda masukan tidak terdaftar',
          image: 'assets/images/sad-illustration.png',
          onTap: () {
            Get.back();
          },
        );
      }
      if (res.statusCode == 402) {
        bottomsheet(
          title: 'Yah Gagal!',
          subtitle: 'Npm yang anda masukan sudah terdaftar',
          image: 'assets/images/sad-illustration.png',
          onTap: () {
            Get.back();
          },
        );
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
    }
  }

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

        if (box.read('dataUser') != null) {
          box.remove('dataUser');
        }
        box.write('dataUser', dataUser.value);

        dataUser.value = userModel.fromJson(result);
        print('4');

        if (box.read('skipIntro') != null) {
          box.remove('skipIntro');
        }
        box.write('skipIntro', true);
        print('5');
        if (box.read('token') != null) {
          box.remove('token');
        }
        isAuth.value = true;
        var data = box.write('token', dataUser.value.account!.rememberToken!);
        print(data);

        Get.offAllNamed(dataUser.value.account!.role == 'Dosen'
            ? Routes.NAVIGATIONS_DOSEN
            : Routes.NAVIGATION_BAR);

        return dataUser;
      }
      if (response.statusCode == 400) {
        bottomsheet(
          title: 'Yah Gagal Login!',
          subtitle: 'Npm atau password yang anda masukan salah',
          image: 'assets/images/sad-illustration.png',
          onTap: () {
            Get.back();
          },
        );
      }

      if (response.statusCode == 401) {
        bottomsheet(
          title: 'Yah Gagal Login!',
          subtitle: 'Silahkan login menggunakan device saat mendaftar',
          image: 'assets/images/sad-illustration.png',
          onTap: () {
            Get.back();
          },
        );
      }
    } catch (e) {
      print(e);
      bottomsheet(
        title: 'Yah Gagal Login!',
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

  Future dashboardLogin(String token) async {
    try {
      isDataLoading(true);
      print('1.1');
      http.Response response = await http.get(
        Uri.parse(dashboardUrl),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ).timeout(const Duration(minutes: 2));
      print('2.2');
      print(token);
      print(response.body);

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        print('3.3');

        if (box.read('dataUser') != null) {
          box.remove('dataUser');
        }
        box.write('dataUser', dataUser.value);
        isAuth.value = true;

        dataUser.value = userModel.fromJson(result);
        print('4.4');

        if (box.read('skipIntro') != null) {
          box.remove('skipIntro');
        }
        box.write('skipIntro', true);
        print('5');

        if (box.read('token') != null) {
          box.remove('token');
        }
        var data = box.write('token', dataUser.value.account!.rememberToken!);
        print(result);

        return dataUser;
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
    // box.remove('token');
    if (box.read('token') == null) {
      return false;
    }

    var myData = await box.read('token');
    dashboardLogin(myData);
    return true;
  }

  Future<void> firstInitialized() async {
    await autoLogin().then((value) {
      // box.remove('token');
      print('firstInitialized');
      print(value);
      print(isAuth.value);
      if (value) {
        isAuth.value = true;
        print('firstInitialized');
        print(value);
      }
    });

    await skipIntro().then((value) {
      print('skipIntro');
      print(value);
      print(isSkipIntro.value);
      if (value) {
        isSkipIntro.value = true;
        print('skipIntro');
        print(value);
      }
    });
  }
}
