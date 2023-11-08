import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:absensi_mahardika/app/modules/home/controllers/home_controller.dart';
import 'package:absensi_mahardika/app/utils/bottomsheet.dart';
import 'package:absensi_mahardika/app/utils/network.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import "package:http/http.dart" as http;
import 'package:scan/scan.dart';
import 'package:geolocator/geolocator.dart';
import '../../../data/user_location.dart';
import 'package:geocoding/geocoding.dart';

class ScanController extends GetxController {
  File? image;
  Barcode? result;
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  String textQrCodeScan = "";
  final picker = ImagePicker();
  late bool _isFlashOn = false;
  QRViewController? controller;
  late CameraController cameraController;
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

  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    final backCamera = cameras.firstWhere(
      (camera) => camera.lensDirection == CameraLensDirection.front,
      orElse: () => cameras.first,
    );

    cameraController = CameraController(
      backCamera,
      ResolutionPreset.veryHigh,
    );

    await cameraController.initialize();
  }

  Future<void> toggleFlashLight() async {
    try {
      if (_isFlashOn) {
        await cameraController.setFlashMode(FlashMode.always);
      } else {
        await cameraController.setFlashMode(FlashMode.always);
      }
      _isFlashOn = !_isFlashOn;
      update();
    } catch (e) {}
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
      String jadwalId = result!.code.toString().split(' ').first;

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


      Map<String, dynamic> requestBody = {
        'npm': dataUser.value.account!.npm,
        'nama_mhsw': dataUser.value.account!.nama,
        'pertemuan': pertemuan,
        'status': 'alpa',
        'jadwal_id': jadwalId
      };

      if (homeCtrl.time == dateQr &&
          hourQr >= homeCtrl.hour &&
          homeCtrl.minute <= minuteQr) {
        print("success");

        absen(requestBody); 

        controller.stopCamera();
      } else {
        print("failed");

        controller.stopCamera();

        bottomsheet('Yah! Gagal', 'Waktu absen sudah ditutup', () {
          Get.back();
          controller.resumeCamera();
        });
      }
      update();
    });
  }

  Future absen(requestBody) async {
    try {
      http.Response res = await http.post(
        Uri.tryParse(absensiUrl)!,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(requestBody),
      );
      if (res.statusCode == 200) {
        controller?.stopCamera();

        bottomsheet(
          'Yay! Berhasil',
          'Anda Berhasil Absen',
          () {
            Get.back();
            controller?.resumeCamera();
          },
        );

        print(res.body);

        return res.body;
      }

      if (res.statusCode == 400) {
        controller?.stopCamera();

        bottomsheet('Yah! Gagal', 'Qr code', () {
          Get.back();
          controller?.resumeCamera();
        });

        print(res.statusCode);
      }

      if (res.statusCode == 401) {
        controller?.stopCamera();

        bottomsheet('Yah! Gagal', 'Anda sudah absen pada matkul ini', () {
          Get.back();
          controller?.resumeCamera();
        });

        print(res.statusCode);
      }
      if (res.statusCode == 402) {
        controller?.stopCamera();

        bottomsheet('Yah! Gagal', 'Gagal absen', () {
          Get.back();
          controller?.resumeCamera();
        });

        print(res.statusCode);
      }
    } catch (e) {
      print(e);

      controller?.stopCamera();

      bottomsheet(
        'Yah! Gagal Login',
        'Kesalahan Tidak Diketahui',
        () {
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
