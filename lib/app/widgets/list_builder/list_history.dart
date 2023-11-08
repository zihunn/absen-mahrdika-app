// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:absensi_mahardika/app/widgets/card/card_history_absen.dart';

class ListBuilderHistory extends StatefulWidget {
  final ScrollController controller;
  final List list;
  final RxBool isDataLoading;
  final String title;
  final Color color;
  const ListBuilderHistory({
    Key? key,
    required this.controller,
    required this.list,
    required this.isDataLoading,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  State<ListBuilderHistory> createState() => _ListBuilderHistoryState();
}

class _ListBuilderHistoryState extends State<ListBuilderHistory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      color: context.theme.primaryColor,
      child: ListView.builder(
        controller: widget.controller,
        itemCount: widget.isDataLoading.value
            ? widget.list.length + 1
            : widget.list.length,
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          if (index < widget.list.length) {
            print(widget.list);
            var data = widget.list[index];
            return CardAbsen(
              matkul: data['matkul'],
              point: '${data['nilai']}',
              tanggal: '${data['tanggal']}',
              title: widget.title.tr, 
              color: widget.color,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
