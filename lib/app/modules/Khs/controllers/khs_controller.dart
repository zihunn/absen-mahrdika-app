import 'package:absensi_mahardika/app/data/coba.dart';
import 'package:get/get.dart';

class KhsController extends GetxController {
  RxString value = '20231'.obs;
  List<Map<String, dynamic>> user = [
    {
      'Mata Kuliah': 'PANCASILA',
      'Semester': '1',
      'SKS': '2',
      'Nilai': '94.00',
      'Bobot': '4.00',
      'Grade': 'A'
    },
    {
      'Mata Kuliah': 'PANCASILA',
      'Semester': '1',
      'SKS': '2',
      'Nilai': '94.00',
      'Bobot': '4.00',
      'Grade': 'A'
    },
    {
      'Mata Kuliah': 'PANCASILA',
      'Semester': '1',
      'SKS': '2',
      'Nilai': '94.00',
      'Bobot': '4.00',
      'Grade': 'A'
    },
    {
      'Mata Kuliah': 'PANCASILA',
      'Semester': '1',
      'SKS': '2',
      'Nilai': '94.00',
      'Bobot': '4.00',
      'Grade': 'A'
    },
    {
      'Mata Kuliah': 'KALKULUS',
      'Semester': '1',
      'SKS': '3	',
      'Nilai': '89.00',
      'Bobot': '4.00',
      'Grade': 'A'
    },
    {
      'Mata Kuliah': 'KALKULUS',
      'Semester': '1',
      'SKS': '3	',
      'Nilai': '89.00',
      'Bobot': '4.00',
      'Grade': 'A'
    },
    {
      'Mata Kuliah': 'KALKULUS',
      'Semester': '1',
      'SKS': '3	',
      'Nilai': '89.00',
      'Bobot': '4.00',
      'Grade': 'A'
    },
    {
      'Mata Kuliah': 'ALGORITMA DAN PEMROGRAMAN	PEMROGRAMAN PEMROGRAMAN',
      'Semester': '1',
      'SKS': '3		',
      'Nilai': '88.00',
      'Bobot': '4.00',
      'Grade': 'D'
    },
    {
      'Mata Kuliah': 'ALGORITMA DAN PEMROGRAMAN	',
      'Semester': '1',
      'SKS': '3		',
      'Nilai': '88.00',
      'Bobot': '4.00',
      'Grade': 'A'
    },
    {
      'Mata Kuliah': 'ALGORITMA DAN PEMROGRAMAN	',
      'Semester': '1',
      'SKS': '3		',
      'Nilai': '88.00',
      'Bobot': '4.00',
      'Grade': 'A'
    },
    {
      'Mata Kuliah': 'PENDIDIKAN PANCASILA DAN KEWARGANEGARAAN',
      'Semester': '1',
      'SKS': '3		',
      'Nilai': '88.00',
      'Bobot': '4.00',
      'Grade': 'A'
    },
    {
      'Mata Kuliah': 'KETERAMPILAN DASAR PRAKTIK KLINIK	',
      'Semester': '1',
      'SKS': '3		',
      'Nilai': '88.00',
      'Bobot': '4.00',
      'Grade': 'A'
    },
    {
      'Mata Kuliah': 'ALGORITMA DAN PEMROGRAMAN	',
      'Semester': '1',
      'SKS': '3		',
      'Nilai': '88.00',
      'Bobot': '4.00',
      'Grade': 'C'
    },
    {
      'Mata Kuliah': 'ALGORITMA DAN PEMROGRAMAN	',
      'Semester': '1',
      'SKS': '3		',
      'Nilai': '88.00',
      'Bobot': '4.00',
      'Grade': 'B'
    },
  ];

  allWordsCapitilize(String str) {
    return str.toLowerCase().split(' ').map((word) {
      String leftText = (word.length > 1) ? word.substring(1, word.length) : '';
      return word[0].toUpperCase() + leftText;
    }).join(' ');
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
