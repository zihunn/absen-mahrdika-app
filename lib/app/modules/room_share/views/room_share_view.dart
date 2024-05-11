import 'package:absensi_mahardika/app/utils/color.dart';
import 'package:absensi_mahardika/app/utils/style.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/room_share_controller.dart';

class RoomShareView extends GetView<RoomShareController> {
  const RoomShareView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppBar(
        title: const Text('Bahasa Indonesia'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: ListView.builder(
          itemCount: 4,
          physics: const ScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            List<bool> list = [true, false, false, true];

            var data = list[index];
            return Container(
              margin: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment:
                    data ? MainAxisAlignment.end : MainAxisAlignment.start,
                children: [
                  !data
                      ? const CircleAvatar(
                          radius: 20.0,
                          backgroundColor: Colors.green,
                        )
                      : const SizedBox(),
                  !data
                      ? ClipPath(
                          clipper: ClipCustomLeft(),
                          child: Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              color: AppColor.bluePrimary.withOpacity(0.2),
                            ),
                          ),
                        )
                      : Container(
                          height: 10,
                          width: 10,
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                        ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: Get.width / 1.5,
                    decoration: BoxDecoration(
                      color: AppColor.bluePrimary.withOpacity(0.2),
                      borderRadius: BorderRadius.only(
                        bottomLeft: const Radius.circular(10),
                        bottomRight: const Radius.circular(10),
                        topRight: !data
                            ? const Radius.circular(10)
                            : const Radius.circular(0),
                        topLeft: data
                            ? const Radius.circular(10)
                            : const Radius.circular(0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Muhammad Rizki Muhammad Rizki Muhammad Rizki",
                            overflow: TextOverflow.ellipsis,
                            style: Style.Subtitle1.copyWith(
                              color: Colors.green,
                              fontSize: 16.0,
                            )),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          height: Get.height / 3.5,
                          width: Get.width / 1.5,
                          decoration: const BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(
                                "https://images.unsplash.com/photo-1533050487297-09b450131914?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          "Qr Code Presensi, Mata Kuliah Bahasa Indonesia Pertemuan 1, Batas Waktu Absen Hingga 16:47",
                        ),
                        const Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            "20.12",
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        )
                      // container
                      ],
                    ),
                  ),
                  data
                      ? ClipPath(
                          clipper: ClipCustomRight(),
                          child: Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              color: AppColor.bluePrimary.withOpacity(0.2),
                            ),
                          ),
                        )
                      : Container(
                          height: 10,
                          width: 10,
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                        ),
                  data
                      ? const CircleAvatar(
                          radius: 20.0,
                          backgroundColor: Colors.green,
                        )
                      : const SizedBox()
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class ClipCustomLeft extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> odlClipper) => true;
}

class ClipCustomRight extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> odlClipper) => true;
}
