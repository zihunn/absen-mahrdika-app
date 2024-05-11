import 'package:absensi_mahardika/app/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

import '../controllers/khs_controller.dart';

class KhsView extends GetView<KhsController> {
  const KhsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final items = ['2023 Ganjil', '2023 Genap'];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Theme(
          data: ThemeData.light(),
          child: Obx(() => DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: controller.value.value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'SignikaBold',
                    fontSize: 18.0,
                  ),
                  items: const <DropdownMenuItem<String>>[
                    DropdownMenuItem(
                      value: '20231',
                      child: Text('2023 Genap'),
                    ),
                    DropdownMenuItem(
                      value: '20232',
                      child: Text('2023 Ganjil'),
                    ),
                  ],
                  onChanged: (value) {
                    controller.value.value = value!;
                  },
                ),
              )),
        ),
      ),
      body: HorizontalDataTable(
        leftHandSideColumnWidth: 0,
        rightHandSideColumnWidth: 600,
        isFixedHeader: true,
        headerWidgets: _getTitleWidget(),
        isFixedFooter: true,
        footerWidgets: _getTitleWidgetFooter(),
        leftSideItemBuilder: _generateFirstColumnRow,
        rightSideItemBuilder: _generateRightHandSideColumnRow,
        itemCount: controller.user.length,
        rowSeparatorWidget: const Divider(
          color: Colors.black26,
          height: 1.0,
          thickness: 0.0,
        ),
        leftHandSideColBackgroundColor: const Color(0xFFFFFFFF),
        rightHandSideColBackgroundColor: const Color(0xFFFFFFFF),
      ),
    );
  }
}

List<Widget> _getTitleWidget() {
  return [
    _getTitleItemWidget('Mata Kuliah', 200),
    _getTitleItemWidget('Mata Kuliah', 100),
    _getTitleItemWidget('Semester', 100),
    _getTitleItemWidget('SKS', 100),
    _getTitleItemWidget('Nilai', 100),
    _getTitleItemWidget('Bobot', 100),
    _getTitleItemWidget('Grade', 100),
  ];
}

List<Widget> _getTitleWidgetFooter() {
  return [
    _getTitleItemWidget('Mata Kuliah', 200),
    _getTitleItemWidget('Total SKS', Get.width),
  ];
}

Widget _getTitleItemWidget(String label, double width) {
  var controller = Get.put(KhsController());
  return Container(
    width: width,
    height: 56,
    color: AppColor.bluePrimary.withOpacity(0.3),
    padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
    alignment: label == 'Mata Kuliah' ? Alignment.centerLeft : Alignment.center,
    child: Text(
      label,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: 'SignikaBold',
        fontSize: 14.0,
      ),
    ),
  );
}

Widget _generateFirstColumnRow(BuildContext context, int index) {
  var controller = Get.put(KhsController());
  var data =
      controller.allWordsCapitilize(controller.user[index]['Mata Kuliah']);

  return Container(
    width: Get.width,
    height: Get.height / 16.7,
    color: AppColor.bluePrimary.withOpacity(0.3),
    padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
    alignment: Alignment.centerLeft,
    child: Text(
      data,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      style: const TextStyle(),
    ),
  );
}

Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
  var controller = Get.put(KhsController());
  var data =
      controller.allWordsCapitilize(controller.user[index]['Mata Kuliah']);
  return Row(
    children: <Widget>[
      Container(
        width: 100,
        height: 52,
        padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.centerLeft,
        child: Text(
          data,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
      ),
      Container(
        width: 100,
        height: 52,
        padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.center,
        child: Text(controller.user[index]['Semester']),
      ),
      Container(
        width: 100,
        height: 52,
        padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.center,
        child: Text(controller.user[index]['SKS']),
      ),
      Container(
        width: 100,
        height: 52,
        padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.center,
        child: Text(controller.user[index]['Nilai']),
      ),
      Container(
        width: 100,
        height: 52,
        padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.center,
        child: Text(controller.user[index]['Bobot']),
      ),
      Container(
        width: 100,
        height: 52,
        padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.center,
        color: controller.user[index]['Grade'] == 'A'
            ? AppColor.greenColor.withOpacity(0.5)
            : controller.user[index]['Grade'] == 'B'
                ? AppColor.yellowColor.withOpacity(0.7)
                : controller.user[index]['Grade'] == 'C'
                    ? AppColor.orangeColor.withOpacity(0.7)
                    : Colors.red.withOpacity(0.7),
        child: Text(controller.user[index]['Grade']),
      ),
    ],
  );
}
