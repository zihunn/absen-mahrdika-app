// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:absensi_mahardika/app/utils/color.dart';
import 'package:absensi_mahardika/app/widgets/card/card_setting_dosen.dart';

import '../controllers/settings_dosen_controller.dart';

class SettingsDosenView extends GetView<SettingsDosenController> {
  const SettingsDosenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(SettingsDosenController());
    return Scaffold(
      backgroundColor: const Color(0xffF4F4F4),
      appBar: AppBar(
        title: const Text('Setting Profil'),
        centerTitle: true,
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
        decoration: const BoxDecoration(
            // color: Colors.blue,
            ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const UserCard(),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 5, 0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                child: CardFitur(data: controller.listFiturGeneral),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 5, 0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                child: CardFitur(data: controller.listFiturOther),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CardFitur extends StatefulWidget {
  // final String section;
  // final Icon icon;
  // final String title;
  // final String subtitle;
  // final Color BColor;
  // final Color textColor;
  // final Function onTap;
  final List data;
  const CardFitur({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<CardFitur> createState() => _CardFiturState();
}

class _CardFiturState extends State<CardFitur> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Umum",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'SignikaRegular',
            fontSize: 20.0,
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        for (var i in widget.data)
          CardSettingDosen(
            icon: i['icon'],
            title: i['title'],
            subtitle: i['subtitle'],
            BColor: i['BColor'],
            textColor: i['textColor'],
            onTap: i['onTap'],
          )
      ],
    );
  }
}

class UserCard extends StatelessWidget {
  const UserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 10,
      width: Get.width,
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(26.0),
        ),
      ),
      child: const Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
              "https://i.ibb.co/PGv8ZzG/me.jpg",
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Muhammad Rizki",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SignikaRegular',
                  fontSize: 18.0,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "muhammad.rizki@mahardika.ac.id",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: 'SignikaRegular',
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
