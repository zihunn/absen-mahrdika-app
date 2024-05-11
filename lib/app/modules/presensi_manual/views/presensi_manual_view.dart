import 'package:absensi_mahardika/app/data/search_model.dart';
import 'package:absensi_mahardika/app/utils/bottomsheet.dart';
import 'package:absensi_mahardika/app/widgets/animation/loading.dart';
import 'package:absensi_mahardika/app/widgets/card/card_mhsw.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/presensi_manual_controller.dart';

class PresensiManualView extends GetView<PresensiManualController> {
  const PresensiManualView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(PresensiManualController());
    var arr = Get.arguments;
    Map<String, dynamic> requestBody = {'jadwal_id': arr[1]};
    return Scaffold(
      appBar: AppBar(
        title: const Text('Presensi Manual'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearch(),
              );
            },
            icon: const Icon(
              CupertinoIcons.search,
              size: 24.0,
            ),
          )
        ],
      ),
      body: FutureBuilder(
        future: controller.searchMhsw(requestBody),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.connectionState == ConnectionState.waiting
              ? Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView.builder(
                      itemCount: 6,
                      physics: const ScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return const CardMhswShimmer();
                      }),
                )
              : Padding(
                  padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                  child: ListView.builder(
                    itemCount: controller.listMhsw['total'],
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      var data = controller.listMhsw['data'][index];
                      // print(controller.listMhsw['data'][index]['nama']);
                      return CardMahasiswa(
                        no: index++,
                        nama: data['nama'],
                        npm: data['npm'],
                        image: data['image'] ?? 'null',
                        widget: GestureDetector(
                          onTap: () {
                            Map<String, dynamic> requestParams = {
                              'jadwal_id': arr[1],
                              'presensi_id': arr[3],
                              'npm': data['npm'],
                            };
                            controller.detailPresensiMhsw(requestParams);
                            presensiBottomsheet(
                              context: context,
                              controller: controller,
                              jadwal_id: arr[1],
                              presensi_id: arr[3],
                              npm: data['npm'],
                            );
                          },
                          child: SizedBox(
                            height: 40,
                            width: 40,
                            child: Image.asset(
                              "assets/icons/attendance.png",
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
        },
      ),
    );
  }
}

class CustomSearch extends SearchDelegate {
  final controller = Get.put(PresensiManualController());
  static List<Map<String, dynamic>> allData = [
    {
      'Nama': 'Muhammad Rizki',
      'Npm': '623C0011',
    },
    {
      'Nama': 'Lorem',
      'Npm': '623C0012',
    },
    {
      'Nama': 'Muhammad',
      'Npm': '623C0014',
    },
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(
        Icons.arrow_back,
        size: 24.0,
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List matchQuery = [];

    for (var i = 0; i < controller.listMhsw['total']; i++) {
      if (controller.listMhsw['data'][i]['nama']
          .toString()
          .toLowerCase()
          .contains(query.toLowerCase())) {
        matchQuery.add(controller.listMhsw['data'][i]);
      }
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
      child: ListView.builder(
        itemCount: matchQuery.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          var result = matchQuery[index];
          return CardMahasiswa(
            no: index++,
            nama: result['nama'],
            npm: result['npm'],
            image: result['image'] ?? 'null',
            widget: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 24.0,
                color: Colors.grey[300],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List matchQuery = [];

    for (var i = 0; i < controller.listMhsw['total']; i++) {
      if (controller.listMhsw['data'][i]['nama']
          .toString()
          .toLowerCase()
          .contains(query.toLowerCase())) {
        matchQuery.add(controller.listMhsw['data'][i]);
      }
    }
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
      child: ListView.builder(
        itemCount: matchQuery.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          var result = matchQuery[index];
          return CardMahasiswa(
            no: index++,
            nama: result['nama'],
            npm: result['npm'],
            image: result['image'] ?? 'null',
            widget: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 24.0,
                color: Colors.grey[300],
              ),
            ),
          );
        },
      ),
    );
  }
}
