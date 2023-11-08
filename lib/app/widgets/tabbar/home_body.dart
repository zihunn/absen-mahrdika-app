import 'package:absensi_mahardika/app/data/totalAbsen_model.dart';
import 'package:absensi_mahardika/app/modules/navigation_bar/controllers/navigation_bar_controller.dart';
import 'package:absensi_mahardika/app/routes/app_pages.dart';
import 'package:absensi_mahardika/app/widgets/card/bg_container.dart';
import 'package:absensi_mahardika/app/widgets/card/card_fitur.dart';
import 'package:absensi_mahardika/app/widgets/card/card_home.dart';
import 'package:absensi_mahardika/app/modules/home/controllers/home_controller.dart';
import 'package:absensi_mahardika/app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/network.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBody();
}

class _HomeBody extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    final navCtrl = Get.put(NavigationBarController());
    return Container(
      margin: const EdgeInsets.only(top: 95),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Stack(
          children: [
            BgContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "fitur".tr,
                    style: Style.Header1.copyWith(
                      fontFamily: 'SignikaSemi',
                      fontSize: 18.0,
                      color: context.theme.textTheme.bodyLarge!.color,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    width: Get.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Get.toNamed(Routes.CALENDAR),
                          child: FiturCard(
                            image: "assets/icons/hasil-studi.png",
                            name: "kalender".tr,
                          ),
                        ),
                        FiturCard(
                          image: "assets/icons/hasil-studi.png",
                          name: "hasil_studi".tr,
                        ),
                        FiturCard(
                          image: "assets/icons/hasil-studi.png",
                          name: "transkrip".tr,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    "informasi".tr,
                    style: Style.Header1.copyWith(
                      fontFamily: 'SignikaSemi',
                      fontSize: 18.0,
                      color: context.theme.textTheme.bodyLarge!.color,
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  ListView.builder(
                    itemCount: 3,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 120,
                        margin: const EdgeInsets.only(bottom: 20),
                        width: Get.width,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: context.theme.shadowColor,
                              blurRadius: 5,
                              blurStyle: BlurStyle.outer,
                            ),
                          ],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                          color: Colors.blue,
                        ),
                        child: Image.asset(
                          "assets/images/ABSENSI MAHASISWA BERBASIS MOBILE.png",
                          fit: BoxFit.fill,
                          //1980 x 720
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Positioned(
              left: 22,
              top: 20,
              child: StreamBuilder<totalAbsenModel>(
                stream: controller.streamAbsen(dataUser.value.account!.npm!),
                builder: (context, snapshot) {
                  var data = snapshot.data;
                  return CardTabbar(
                    image: "assets/icons/scan.png",
                    days: controller.days,
                    showClock: true,
                    name1: "Sks",
                    value1: dataUser.value.account!.sks.toString(),
                    name2: "hadir".tr,
                    value2: snapshot.hasData ? "${data!.data!.hadir}" : "-",
                    onTap1: () {
                      navCtrl.changeNavIndex(1);
                    },
                    onTap2: () {
                      navCtrl.changeNavIndex(3);
                      print(navCtrl.navIndex.value);
                    },
                  );
                },
              ),
            ),
          
          ],
        ),
      ),
    );
  }
}
