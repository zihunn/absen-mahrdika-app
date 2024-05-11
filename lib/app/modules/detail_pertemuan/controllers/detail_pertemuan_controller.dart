import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:absensi_mahardika/app/data/list_presensi_hadir_model.dart';
import 'package:absensi_mahardika/app/utils/dio_hendler.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;
import "package:http/http.dart" as http;
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';

import '../../../utils/network.dart';

class DetailPertemuanController extends GetxController {
  Rx<TextEditingController> dateCtrl = TextEditingController().obs;
  Rx<TextEditingController> durasiCtrl = TextEditingController().obs;
  RxString selectedDate = ''.obs;
  final GlobalKey globalKey = GlobalKey();
  static String arr = '';
  Map<String, dynamic> requestParams = {'presensi_id': arr};
  late PresensiHadirModel listData;
  var listMhsw = PresensiHadirModel().obs;
  late StreamSubscription _sub;
  final StreamController<PresensiHadirModel> _controller =
      StreamController<PresensiHadirModel>.broadcast();
  StreamController<PresensiHadirModel> cancelController =
      StreamController<PresensiHadirModel>.broadcast();
  RxBool isLoading = false.obs;
  RxBool inArea = true.obs;

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
      dateCtrl.value = TextEditingController(text: selectedDate.value);
      print(selectedDate.value);
    }
  }

  Future<void> convertQrCodeToImage(String namaMk, pertemuan, durasi) async {
    RenderRepaintBoundary boundary =
        globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    final directory = (await getApplicationDocumentsDirectory()).path;
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List(
      byteData.offsetInBytes,
      byteData.lengthInBytes,
    );
    File imgFile = File("$directory/qrCode.png");
    await imgFile.writeAsBytes(pngBytes);
    await Share.shareFiles([imgFile.path],
        text:
            "Qr Code Presensi, Mata Kuliah $namaMk Pertemuan $pertemuan, Batas Waktu Absen Hingga $durasi WIB");
  }

  // Future<PresensiHadirModel> streamAbsen(requestParams) async {
  //   try {
  //     var url = Uri.http(baseUrl, 'api/presensi/mhsw', requestParams);
  //     http.Response res = await http.get(url, headers: {
  //       'Accept': 'application/json',
  //       'Authorization': 'Bearer $token',
  //     });

  //     print(res.statusCode.toString());
  //     if (res.statusCode == 200) {
  //       final data = json.decode(res.body);
  //       print(data);
  //       listData = PresensiHadirModel.fromJson(data);
  //       return listData;
  //     }
  //   } on DioException catch (e) {
  //     var error = DioHandler.parseDioErrorMessage(e);
  //   }
  //   return listData;
  // }

  Stream<PresensiHadirModel> streamDataHadir(requestParams,
      {StreamController<PresensiHadirModel>? cancelController}) async* {
    isLoading.value = true;
    var url = Uri.http(baseUrl, 'api/presensi/mhsw', requestParams);
    if (cancelController != null) {
      cancelController.stream.listen((_) {
        _controller.close();
      });
    }
    yield* Stream.periodic(const Duration(seconds: 5), (_) {
      return http.get(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
    }).asyncMap((event) async {
      var data = await event;

      if (data.statusCode == 200) {
        isLoading.value = false;
        var result = jsonDecode(data.body);

        listMhsw.value = PresensiHadirModel.fromJson(result);
        print(listMhsw.value);
        return listMhsw.value;
      }
      return listMhsw.value;
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    cancelController.close();
    super.onClose();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();

    arr = Get.arguments[3];
  }
}
