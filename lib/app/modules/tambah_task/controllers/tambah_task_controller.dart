import 'package:get/get.dart';
import 'package:flutter/material.dart';

class TambahTaskController extends GetxController {
  RxInt selectedIndex = 5.obs;
  RxString selectedValue = ''.obs;
  TextEditingController titleCtrl = TextEditingController();
  TextEditingController descCtrl = TextEditingController();
  final List<String> statusItems = [
    'In Progress',
    'Done',
    'Pending',
  ];
}
