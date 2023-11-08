import 'package:absensi_mahardika/app/data/user_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/auth_controller.dart';

Rx<userModel> dataUser = Get.put(AuthController()).dataUser;
GetStorage box = GetStorage();
var dataUserLocal = box.read('dataUser');

var dio = Dio();
String baseUrl = '192.168.1.16:8000';
String loginUrl = 'http://192.168.1.16:8000/api/login';
String logoutUrl = 'http://192.168.1.16:8000/api/user/logout';
String dashboardUrl = 'http://192.168.1.16:8000/api/user/me';
String registerUrl = 'http://192.168.1.16:8000/api/register';
String absensiUrl = 'http://192.168.1.16:8000/api/absensi';
String jadwalUrl = 'http://192.168.1.16:8000/api/jadwal';
String GetJadwalUrl = 'http://192.168.1.16:8000/api/jadwal/show';
String editProfilUrl = 'http://192.168.1.16:8000/api/user/';
String historyAbsenUrl =
    'http://192.168.1.16:8000/api/absensi/show?npm=322E0008&status=hadir&paginate=10&page=';

String token = dataUser.value. account!.rememberToken!;
