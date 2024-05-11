import 'package:absensi_mahardika/app/data/user_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/auth_controller.dart';

Rx<userModel> dataUser = Get.put(AuthController()).dataUser;
GetStorage box = GetStorage();
var dataUserLocal = box.read('dataUser');

var dio = Dio();
String baseUrl = 'https://api-mobile.lkp-ppik.id';
String loginUrl = '$baseUrl/api/login';
String logoutUrl = '$baseUrl/api/user/logout';
String dashboardUrl = '$baseUrl/api/user/me';
String registerUrl = '$baseUrl/api/register';
String absensiUrl = '$baseUrl/api/absensi';
String jadwalUrl = '$baseUrl/api/jadwal';
String showMhswPresensiUrl = '$baseUrl/api/presensi/mhsw';
String presensiUrl = '$baseUrl/api/presensi';
String postJadwalDosenUrl = '$baseUrl/api/jadwal/dosen';
String getJadwalDosenUrl = '$baseUrl/api/jadwal/dosen';
String GetJadwalUrl = '$baseUrl/api/jadwal/show';
String editProfilUrl = '$baseUrl/api/user/';
String perizinanUrl = '$baseUrl/api/perizinan';
String searchMhswUrl = '$baseUrl/api/search';
String searcDosenUrl = '$baseUrl/api/search/dosen';
String getAllMk = '$baseUrl/api/dosen/show';
String getKrsUrl = '$baseUrl/api/krs';
String getMkPerizinanUrl = '$baseUrl/api/perizinan/showmk/';
String detailPresensiMhsw = '$baseUrl/api/presensi/mhsw/detail';
String historyAbsenUrl =
    '$baseUrl/api/absensi/show?npm=322E0008&status=hadir&paginate=10&page=';

String token = box.read('token');
