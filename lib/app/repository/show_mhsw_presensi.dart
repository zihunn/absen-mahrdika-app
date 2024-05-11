import 'dart:convert';
import 'dart:developer';
import 'package:absensi_mahardika/app/utils/dio_hendler.dart';
import 'package:absensi_mahardika/app/utils/network.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import '../data/list_presensi_hadir_model.dart';

class MahasiswaRepository {
  static Future getMhswHadir(requestParams) async {
    try {
      var url = Uri.http(baseUrl, 'api/presensi/mhsw', requestParams);
      http.Response res = await http.get(url, headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });

      print(res.statusCode.toString());
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        print(data);
        return PresensiHadirModel.fromJson(data);
      }
    } on DioException catch (e) {
      var error = DioHandler.parseDioErrorMessage(e);
      return error;
    } catch (e) {
      return null;
    }
  }
}
