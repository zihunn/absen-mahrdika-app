import 'package:absensi_mahardika/app/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  List data = [1, 1, 1];

  List categoryList = [
    {
      'nama': 'Pekerjaan',
      'image': 'assets/icons/work.png',
      'total': 2,
      'bgColor': AppColor.bluePrimary.withOpacity(0.2),
      'primary': AppColor.bluePrimary,
      'onTap': () {
        print('work');
      }
    },
    {
      'nama': 'Rutinitas',
      'image': 'assets/icons/routine.png',
      'total': 1,
      'bgColor': AppColor.greenColor.withOpacity(0.3),
      'primary': Colors.green,
      'onTap': () {
        print('Rutinitas');
      }
    },
    {
      'nama': 'Waktu Senggang',
      'image': 'assets/icons/free_time.png',
      'total': 2,
      'bgColor': Colors.red.withOpacity(0.2),
      'primary': Colors.red,
      'onTap': () {
        print('Waktu Senggang');
      }
    },
    {
      'nama': 'Perkuliahan',
      'image': 'assets/icons/university.png',
      'total': 2,
      'bgColor': Colors.purple.withOpacity(0.2),
      'primary': Colors.purple,
      'onTap': () {
        print('Perkuliahan');
      }
    },
  ];
}
