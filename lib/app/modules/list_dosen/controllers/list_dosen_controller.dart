import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../data/search_model_dosen.dart';
import '../../../utils/bottomsheet.dart';
import '../../../utils/network.dart';

class ListDosenController extends GetxController {
  RxInt pageSearch = 1.obs;
  List listDosen = [].obs;
  final scrollController = ScrollController();
  var isDataLoading = false.obs;
  RxBool isSearch = false.obs;
  TextEditingController searchCtrl = TextEditingController();
  final dosenData = SerachDosenModel().obs;
  final searchData = SerachDosenModel().obs;
  var jadwalId;
  RxBool isPrimaryLec = false.obs;

  Future searchDosen(requestParams) async {
    try {
      isDataLoading.value = true;
      var url = Uri.http(baseUrl, 'api/search/dosen', requestParams);
      print(url);

      await Future.delayed(const Duration(seconds: 1));
      http.Response response =
          await http.get(url).timeout(const Duration(minutes: 2));

      print(response.body);
      if (response.statusCode == 200) {
        var result = json.decode(response.body);
        searchData.value = SerachDosenModel.fromJson(result);
        print(searchData.value.data);
        isDataLoading.value = false;
      }
      if (response.statusCode == 404) {
        var result = json.decode(response.body);
        searchData.value = SerachDosenModel.fromJson(result);
        print(searchData.value.data);
        isDataLoading.value = false;
      }
      isDataLoading.value = false;
    } on TimeoutException catch (_) {
      bottomsheet(
        title: 'Yah Gagal!',
        subtitle: 'Perikas kembali koneksi anda',
        image: 'assets/images/sad-illustration.png',
        onTap: () {
          Get.back();
        },
      );
      isDataLoading.value = false;
    } on SocketException catch (_) {
      bottomsheet(
        title: 'Yah Gagal!',
        subtitle: 'Kesalahan tidak diketahui',
        image: 'assets/images/sad-illustration.png',
        onTap: () {
          Get.back();
        },
      );
      isDataLoading.value = false;
    }
  }

  Future<SerachDosenModel> getDosenMK(String jadwalId) async {
    try {
      isDataLoading.value = true;
      var url = Uri.http(baseUrl, '/api/search/dosen/$jadwalId');
      print(url);

      await Future.delayed(const Duration(milliseconds: 30));
      http.Response response =
          await http.get(url).timeout(const Duration(minutes: 2));

      print(response.statusCode);
      if (response.statusCode == 200) {
        var result = json.decode(response.body);
        dosenData.value = SerachDosenModel.fromJson(result);
        print(result);
        isPrimaryLec.value = dosenData.value.data?[0].dosenUtama == 1 &&
                dosenData.value.data?[0].nama == dataUser.value.account?.nama ??
            dataUserLocal['account']['nama'];
        isDataLoading.value = false;
        return dosenData.value;
      }

      if (response.statusCode == 404) {
        isDataLoading.value = false;

        bottomsheet(
          title: 'Yah Gagal!',
          subtitle: 'Dosen tidak ditemukan',
          image: 'assets/images/sad-illustration.png',
          onTap: () {
            Get.back();
          },
        );
        return dosenData.value;
      }
    } on TimeoutException catch (_) {
      isDataLoading.value = false;

      bottomsheet(
        title: 'Yah Gagal!',
        subtitle: 'Perikas kembali koneksi anda',
        image: 'assets/images/sad-illustration.png',
        onTap: () {
          Get.back();
        },
      );
      return dosenData.value;
    } on SocketException catch (_) {
      isDataLoading.value = false;

      bottomsheet(
        title: 'Yah Gagal!',
        subtitle: 'Kesalahan tidak diketahui',
        image: 'assets/images/sad-illustration.png',
        onTap: () {
          Get.back();
        },
      );
      return dosenData.value;
    }
    return dosenData.value;
  }

  Future addDosen(requestBody) async {
    try {
      var url = Uri.http(baseUrl, '/api/dosen/tambah');
      final jsonString = json.encode(requestBody);
      http.Response response = await http
          .post(
            url,
            headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token',
            },
            body: jsonString,
          )
          .timeout(const Duration(minutes: 2));

      if (response.statusCode == 200) {
        bottomsheet(
          title: "Yay Berhasil!",
          subtitle: "Anda berhasil menambahkan dosen kedalam mata kuliah.",
          image: 'assets/images/happy-illustration.png',
          onTap: () {
            Get.back();
          },
        );
      }
      if (response.statusCode == 404) {
        bottomsheet(
          title: "Yah Gagal!",
          subtitle: "Dosen sudah ada pada mata kuliah tersebut.",
          image: 'assets/images/sad-illustration.png',
          onTap: () {
            Get.back();
          },
        );
      }
    } on TimeoutException catch (_) {
      bottomsheet(
        title: 'Yah Gagal!',
        subtitle: 'Perikas kembali koneksi anda',
        image: 'assets/images/sad-illustration.png',
        onTap: () {
          Get.back();
        },
      );
    } on SocketException catch (_) {
      bottomsheet(
        title: 'Yah Gagal!',
        subtitle: 'Kesalahan tidak diketahui',
        image: 'assets/images/sad-illustration.png',
        onTap: () {
          Get.back();
        },
      );
    }
  }

  Future destroy(int id) async {
    try {
      var url = Uri.http(baseUrl, '/api/dosen/delete/$id');

      http.Response response = await http.get(
        url,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ).timeout(const Duration(minutes: 2));

      print(response.body);
      if (response.statusCode == 200) {
        bottomsheet(
          title: "Yay Berhasil!",
          subtitle: "Anda berhasil menghapus dari mata kuliah.",
          image: 'assets/images/happy-illustration.png',
          onTap: () {
            Get.back();
          },
        );
      }
      if (response.statusCode == 404) {
        bottomsheet(
          title: "yah Gagal!",
          subtitle: "Dosen tidak ditemukan.",
          image: 'assets/images/sad-illustration.png',
          onTap: () {
            Get.back();
          },
        );
      }
    } on TimeoutException catch (_) {
      bottomsheet(
        title: 'Yah Gagal!',
        subtitle: 'Perikas kembali koneksi anda.',
        image: 'assets/images/sad-illustration.png',
        onTap: () {
          Get.back();
        },
      );
    } on SocketException catch (_) {
      bottomsheet(
        title: 'Yah Gagal!',
        subtitle: 'Kesalahan tidak diketahui, silahkan coba lagi.',
        image: 'assets/images/sad-illustration.png',
        onTap: () {
          Get.back();
        },
      );
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    jadwalId = Get.arguments;
    getDosenMK(jadwalId[0]);
    super.onInit();
  }
}
