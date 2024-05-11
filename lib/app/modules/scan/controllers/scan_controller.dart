import 'dart:async';
import 'dart:io';
import 'package:absensi_mahardika/app/modules/home/controllers/home_controller.dart';
import 'package:absensi_mahardika/app/utils/bottomsheet.dart';
import 'package:absensi_mahardika/app/utils/network.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:scan/scan.dart';
import 'package:geolocator/geolocator.dart';
import '../../../data/user_location.dart';
import "package:dio/dio.dart" as diopack;

class ScanController extends GetxController {
  File? image;
  Barcode? result;
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  String textQrCodeScan = "";
  final picker = ImagePicker();
  late bool _isFlashOn = false;
  QRViewController? controller;
  late Future<void> cameraInitializeFuture;
  var homeCtrl = Get.put(HomeController());
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final StreamController<UserLocation> _locationStreamController =
      StreamController<UserLocation>();
  Stream<UserLocation> get locationStream => _locationStreamController.stream;

  Future<Map<String, dynamic>> locationService() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return {
        'Message': 'Location services are disabled.',
        'Error': true,
      };
      // return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return {
          'Message': 'Location permissions are denied.',
          'Error': true,
        };
        // return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return {
        'Message':
            'Location permissions are permanently denied, we cannot request permissions.',
        'Error': true,
      };
      // return Future.error(
      //     'Location permissions are permanently denied, we cannot request permissions.',);
    }
    Position position = await Geolocator.getCurrentPosition();
    return {
      'Position': position,
      'Message': 'success get location',
      'Error': false
    };
  }

 

  Future<void> getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      var result = await Scan.parse(pickedFile.path);
      print('=====================');
      print(result);
    } else {
      print('No image selected.');
    }
    update();
  }

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      result = scanData;
      print(result);
      String jadwalId =
          result!.code.toString().split(' ').first.split('.').first;
      String presensiId =
          result!.code.toString().split(' ').first.split('.').last;

      String dateQr = result!.code
          .toString()
          .split(' ')
          .last
          .split('&')
          .first
          .split('.')
          .last;

      String pertemuan = result!.code
          .toString()
          .split(' ')
          .last
          .split('&')
          .first
          .split('.')
          .first;

      int hourQr = int.parse(
        result!.code
            .toString()
            .split(' ')
            .last
            .split('&')
            .last
            .split(':')
            .first,
      );

      int minuteQr = int.parse(
        result!.code.toString().split(' ').last.split('&').last.split(':').last,
      );

      String hoursQr = result!.code.toString().split(' ').last.split('&').last;

      TimeOfDay now = TimeOfDay.now();
      TimeOfDay closingTime = TimeOfDay(hour: hourQr, minute: minuteQr);

      DateTime dt1 = DateTime.parse("$dateQr 11:47:00");
      DateTime dt2 = DateTime.now();

      DateTime date1 = DateTime(dt1.year, dt1.month, dt1.day);
      DateTime date2 = DateTime(dt2.year, dt2.month, dt2.day);

      Map<String, dynamic> requestBody = {
        'npm': dataUser.value.account!.npm,
        'presensi_id': presensiId,
        'status': 'H',
        'nilai': '1',
        'jadwal_id': jadwalId
      };

      int shopCloseTimeInSeconds = closingTime.hour * 60 + closingTime.minute;
      int timeNowInSeconds = now.hour * 60 + now.minute;

      if (timeNowInSeconds <= shopCloseTimeInSeconds &&
          date1.compareTo(date2) == 0) {
        print("success");
        absen(requestBody);

        controller.stopCamera();
      } else {
        print("failed");

        controller.stopCamera();

        bottomsheet(
          title: 'Yah Gagal!',
          subtitle: 'Waktu absen sudah ditutup',
          image: 'assets/images/sad-illustration.png',
          onTap: () {
            Get.back();
            controller.resumeCamera();
          },
        );
      }

      update();
    });
  }

  Future absen(requestBody) async {
    try {
      var response = await dio.post(
        absensiUrl,
        options: diopack.Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          sendTimeout: const Duration(minutes: 2),
        ),
        data: diopack.FormData.fromMap(requestBody),
      );
      if (response.statusCode == 200) {
        controller?.stopCamera();

        bottomsheet(
          title: 'Yah Berhasil!',
          subtitle: 'Anda berhasil absen',
          image: 'assets/images/happy-illustration.png',
          onTap: () {
            Get.back();
            controller?.resumeCamera();
          },
        );

        print(response.data);

        return response.data;
      }

      if (response.statusCode == 400) {
        controller?.stopCamera();
        bottomsheet(
          title: 'Yah Gagal!',
          subtitle: 'Qr code tidak valid',
          image: 'assets/images/sad-illustration.png',
          onTap: () {
            Get.back();
            controller?.resumeCamera();
          },
        );
        print(response.statusCode);
      }

      if (response.statusCode == 401) {
        controller?.stopCamera();

        bottomsheet(
          title: 'Yah Gagal!',
          subtitle: 'Anda sudah absen pada matkul ini',
          image: 'assets/images/sad-illustration.png',
          onTap: () {
            Get.back();
            controller?.resumeCamera();
          },
        );

        print(response.statusCode);
      }
      if (response.statusCode == 402) {
        controller?.stopCamera();

        bottomsheet(
          title: 'Yah Gagal!',
          subtitle: 'Gagal absen',
          image: 'assets/images/sad-illustration.png',
          onTap: () {
            Get.back();
            controller?.resumeCamera();
          },
        );

        print(response.statusCode);
      }
    } catch (e) {
      print(e);

      controller?.stopCamera();

      bottomsheet(
        title: 'Yah Gagal!',
        subtitle: 'Kesalahan tidak diketahui',
        image: 'assets/images/sad-illustration.png',
        onTap: () {
          Get.back();
          controller?.resumeCamera();
        },
      );
    }
  }

  @override
  void onInit() {
    controller?.resumeCamera();

    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // controller!.pauseCamera();
    super.onClose();
  }
}
