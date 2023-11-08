import 'package:absensi_mahardika/models/device_info_model.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with GetTickerProviderStateMixin {
  final npmCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  FocusNode focusNode = FocusNode();
  late AnimationController _controller;
  // ignore: unused_field
  late Animation _animation;
  RxBool showPasword = true.obs;
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo? androidInfo;
  String? id = '';
  String? version = '';
  String? model = '';

  Future<AndroidDeviceInfo> getInfo() async {
    deviceInfo.androidInfo.asStream().forEach((element) {
      id = element.id;
      version = element.version.incremental;
      model = element.model;
    });

    DeviceInfoModel(id: id, model: model, version: version);

    return await deviceInfo.androidInfo;
  }
  

  @override
  void onInit() {
    getInfo();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _animation = Tween(begin: 300.0, end: 50.0).animate(_controller)
      ..addListener(() {
        update();
      });
    update();

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
    super.onInit();
  }
}
