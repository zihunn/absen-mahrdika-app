import 'package:absensi_mahardika/app/modules/detail_pertemuan/controllers/detail_pertemuan_controller.dart';
import 'package:absensi_mahardika/app/modules/pertemuan/controllers/pertemuan_controller.dart';
import 'package:absensi_mahardika/app/modules/presensi_manual/controllers/presensi_manual_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:absensi_mahardika/app/modules/edit_profil/controllers/edit_profil_controller.dart';
import 'package:absensi_mahardika/app/utils/color.dart';
import 'package:absensi_mahardika/app/utils/style.dart';
import 'package:absensi_mahardika/app/widgets/button/button_gender.dart';
import 'package:flutter/material.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import '../widgets/button/button_confirm.dart';
import '../widgets/textfield/custom_textfield.dart';
import 'network.dart';
import 'package:qr_flutter/qr_flutter.dart';

void bottomsheet(
    {required String title,
    required String subtitle,
    required String image,
    required Function onTap}) {
  showModalBottomSheet<void>(
    context: Get.context!,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25.0),
      ),
    ),
    builder: (BuildContext context) {
      return SizedBox(
        height: Get.height / 4,
        child: SizedBox(
          height: 100.0,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                width: Get.width / 1.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Text(
                        title,
                        style: Style.Header1.copyWith(),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      height: 60,
                      child: Text(
                        subtitle,
                        style: Style.Subtitle1.copyWith(fontFamily: 'Signika'),
                      ),
                    ),
                    const SizedBox(
                      height: 11.0,
                    ),
                    SizedBox(
                      width: Get.width,
                      height: Get.height / 24,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.bluePrimary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        onPressed: () => onTap(),
                        child: const Text("Okay"),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void GenderBottomsheet() {
  final ctrl = Get.put(EditProfilController());
  showModalBottomSheet<void>(
    context: Get.context!,
    isDismissible: false,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25.0),
      ),
    ),
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(20.0),
        child: Wrap(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        alignment: Alignment.topRight,
                        width: Get.width / 1.8,
                        child: const Text(
                          'Select gender',
                          style: Style.Header2,
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () {
                              if (ctrl.indexGender.value == 0) {
                                ctrl.gender.value = 'Laki-Laki';
                              } else {
                                ctrl.gender.value = 'Perempuan';
                              }
                              print(ctrl.gender.value);
                              Get.back();
                            },
                            child: Text(
                              "confirm",
                              style: Style.Header2.copyWith(
                                fontFamily: 'Signika',
                                color: AppColor.bluePrimary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Obx(() {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ButtonGender(
                          icon: "assets/icons/male.png",
                          label: "Laki-Laki",
                          onTap: () {
                            ctrl.indexGender.value = 0;
                          },
                          borderColor: AppColor.greyColor.withOpacity(0.7),
                          backgroundColor: ctrl.indexGender.value == 0
                              ? AppColor.blueColor2.withOpacity(0.5)
                              : AppColor.greyColor.withOpacity(0.2),
                        ),
                        ButtonGender(
                          icon: "assets/icons/female.png",
                          label: "Perempuan",
                          onTap: () {
                            ctrl.indexGender.value = 1;
                          },
                          borderColor: AppColor.greyColor.withOpacity(0.7),
                          backgroundColor: ctrl.indexGender.value == 1
                              ? AppColor.blueColor2.withOpacity(0.5)
                              : AppColor.greyColor.withOpacity(0.2),
                        ),
                      ],
                    );
                  }),
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

void MeetingBottomsheet(
    BuildContext context, PertemuanController controller, String jadwalId) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: Get.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              const Text(
                "Buat Pertemuan",
                style: TextStyle(
                  fontFamily: 'SignikaBold',
                  fontSize: 18.0,
                ),
              ),
              SizedBox(
                height: Get.height / 32,
              ),
              textFieldNormal(
                label: "Pertemuan Ke -",
                icon: const Icon(CupertinoIcons.person_3),
                textCtrl: controller.pertemuanCtrl,
                readOnly: false,
                ontap: () {},
                onChanged: (value) {},
                validator: (value) {},
                maxLines: 1,
                textInputType: TextInputType.number,
              ),
              SizedBox(
                height: Get.height / 35,
              ),
              Obx(
                () => GestureDetector(
                  onTap: () {
                    controller.datePicker();
                  },
                  child: Container(
                    child: textFieldNormal(
                        label: "Tanggal",
                        icon: const Icon(CupertinoIcons.calendar),
                        textCtrl: controller.dateCtrl.value,
                        readOnly: true,
                        maxLines: 1,
                        textInputType: TextInputType.number,
                        ontap: () {
                          controller.datePicker();
                        },
                        onChanged: (value) {},
                        validator: (value) {}),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height / 35,
              ),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Get.width / 3,
                      child: textFieldNormal(
                        label: "Mulai",
                        icon: const Icon(CupertinoIcons.clock),
                        textCtrl: controller.jamMulaiCtrl.value,
                        readOnly: true,
                        maxLines: 1,
                        textInputType: TextInputType.number,
                        onChanged: (value) {},
                        validator: (value) {},
                        ontap: () {
                          Navigator.of(context).push(
                            showPicker(
                              context: context,
                              value: Time.fromTimeOfDay(TimeOfDay.now(), 1),
                              sunrise: const TimeOfDay(hour: 6, minute: 0),
                              sunset: const TimeOfDay(hour: 18, minute: 0),
                              duskSpanInMinutes: 120,
                              is24HrFormat: true,
                              height: Get.height / 1.9,
                              accentColor: AppColor.blueColor2,
                              onChange: (TimeOfDay time) {
                                final hours =
                                    time.hour.toString().padLeft(2, '0');
                                final minutes =
                                    time.minute.toString().padLeft(2, '0');

                                controller.jamMulaiCtrl.value =
                                    TextEditingController(
                                  text: '$hours:$minutes',
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    const Text("__"),
                    SizedBox(
                      width: Get.width / 3,
                      child: textFieldNormal(
                        label: "Selesai",
                        icon: const Icon(CupertinoIcons.clock),
                        textCtrl: controller.jamSelesaiCtrl.value,
                        readOnly: true,
                        maxLines: 1,
                        textInputType: TextInputType.number,
                        onChanged: (value) {},
                        validator: (value) {},
                        ontap: () {
                          Navigator.of(context).push(
                            showPicker(
                              context: context,
                              value: Time.fromTimeOfDay(TimeOfDay.now(), 1),
                              sunrise: const TimeOfDay(hour: 6, minute: 0),
                              sunset: const TimeOfDay(hour: 18, minute: 0),
                              duskSpanInMinutes: 120,
                              is24HrFormat: true,
                              height: Get.height / 1.9,
                              accentColor: AppColor.blueColor2,
                              onChange: (TimeOfDay time) {
                                final hours =
                                    time.hour.toString().padLeft(2, '0');
                                final minutes =
                                    time.minute.toString().padLeft(2, '0');

                                controller.jamSelesaiCtrl.value =
                                    TextEditingController(
                                  text: '$hours:$minutes',
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height / 32,
              ),
              ButtonConfirm(
                color: AppColor.bluePrimary,
                height: Get.height / 17,
                width: Get.width,
                radius: 10,
                colorOutline: AppColor.bgColor,
                widthOutline: 0,
                isOutline: false,
                widget: const Text(
                  "Buat Pertemuan",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontFamily: 'SignikaSemi',
                  ),
                ),
                onTap: () {
                  Map<String, dynamic> requestBody = {
                    'dosen_id': dataUser.value.account?.dosenId ??
                        dataUserLocal['account']['dosen_id'],
                    'jadwal_id': jadwalId,
                    'pertemuan': controller.pertemuanCtrl.value.text,
                    'tanggal': controller.dateCtrl.value.text,
                    'jam_mulai': controller.jamMulaiCtrl.value.text,
                    'jam_selesai': controller.jamSelesaiCtrl.value.text,
                  };
                  Map<String, dynamic> requestParams = {
                    'jadwal_id': jadwalId,
                  };

                  controller.createMeet(requestBody, requestParams);
                  controller.pertemuanCtrl.clear();
                  controller.dateCtrl.value.clear();
                  controller.jamMulaiCtrl.value.clear();
                  controller.jamSelesaiCtrl.value.clear();
                  Get.back();
                },
              )
            ],
          ),
        ),
      ),
    ),
  );
}

void QrCodeBottomsheet(
    BuildContext context,
    DetailPertemuanController controller,
    String jadwalId,
    pertemuan,
    namaMk,
    presensiId) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: Get.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              const Text(
                "Buat QrCode",
                style: TextStyle(
                  fontFamily: 'SignikaBold',
                  fontSize: 18.0,
                ),
              ),
              SizedBox(
                height: Get.height / 32,
              ),
              Obx(
                () => GestureDetector(
                  onTap: () {
                    controller.datePicker();
                  },
                  child: Container(
                    child: textFieldNormal(
                        label: "Tanggal",
                        icon: const Icon(CupertinoIcons.calendar),
                        textCtrl: controller.dateCtrl.value,
                        readOnly: true,
                        maxLines: 1,
                        textInputType: TextInputType.number,
                        ontap: () {
                          controller.datePicker();
                        },
                        onChanged: (value) {},
                        validator: (value) {}),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height / 35,
              ),
              Obx(
                () => SizedBox(
                  child: textFieldNormal(
                    label: "Batas Absensi",
                    icon: const Icon(CupertinoIcons.clock),
                    textCtrl: controller.durasiCtrl.value,
                    readOnly: true,
                    maxLines: 1,
                    textInputType: TextInputType.number,
                    onChanged: (value) {},
                    validator: (value) {},
                    ontap: () {
                      Navigator.of(context).push(
                        showPicker(
                          context: context,
                          value: Time.fromTimeOfDay(TimeOfDay.now(), 1),
                          sunrise: const TimeOfDay(hour: 6, minute: 0),
                          sunset: const TimeOfDay(hour: 18, minute: 0),
                          duskSpanInMinutes: 120,
                          is24HrFormat: true,
                          height: Get.height / 1.9,
                          accentColor: AppColor.blueColor2,
                          iosStylePicker: true,
                          onChange: (TimeOfDay time) {
                            final hours = time.hour.toString();
                            final minutes =
                                time.minute.toString().padLeft(2, '0');
                            controller.durasiCtrl.value = TextEditingController(
                              text: '$hours:$minutes',
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: Get.height / 35,
              ),
              SizedBox(
                height: 50.0,
                child: Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.inArea.value = true;
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          clipBehavior: Clip.antiAlias,
                          width: Get.width / 4,
                          decoration: BoxDecoration(
                            color: controller.inArea.value == true
                                ? AppColor.bluePrimary.withOpacity(0.5)
                                : AppColor.bluePrimary.withOpacity(0.1),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12.0),
                            ),
                            border: Border.all(color: AppColor.bluePrimary),
                          ),
                          child: SizedBox(
                            height: 100.0,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: Get.width / 10,
                                  child: Image.asset("assets/icons/campus.png"),
                                ),
                                Expanded(
                                  child: Container(
                                    child: Text(
                                      "Offline",
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontFamily: 'SignikaBold',
                                        color: controller.inArea.value == true
                                            ? Colors.white
                                            : Colors.grey.withOpacity(0.5),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.inArea.value = false;
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          clipBehavior: Clip.antiAlias,
                          width: Get.width / 4,
                          decoration: BoxDecoration(
                            color: controller.inArea.value == false
                                ? AppColor.bluePrimary.withOpacity(0.5)
                                : AppColor.bluePrimary.withOpacity(0.1),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12.0),
                            ),
                            border: Border.all(color: AppColor.bluePrimary),
                          ),
                          child: SizedBox(
                            height: 100.0,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: Get.width / 10,
                                  child: Image.asset("assets/icons/online.png"),
                                ),
                                Expanded(
                                  child: Container(
                                    child: Text(
                                      "Online",
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontFamily: 'SignikaBold',
                                        color: controller.inArea.value == false
                                            ? Colors.white
                                            : Colors.grey.withOpacity(0.5),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: Get.height / 32,
              ),
              ButtonConfirm(
                color: AppColor.bluePrimary,
                height: Get.height / 17,
                width: Get.width,
                radius: 10,
                colorOutline: AppColor.bgColor,
                widthOutline: 0,
                isOutline: false,
                widget: const Text(
                  "Buat QrCode",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontFamily: 'SignikaSemi',
                  ),
                ),
                onTap: () {
                  Get.back();
                  String tanggal = controller.dateCtrl.value.text;
                  String durasi = controller.durasiCtrl.value.text;
                  String data =
                      '$jadwalId.$presensiId $pertemuan.$tanggal&$durasi';
                  print(data);
                  if (tanggal == '' || durasi == '' || data == '') {
                    bottomsheet(
                      title: 'Yahh Gagal!',
                      subtitle: 'Harap Isi Semua Data Yang Diberikan',
                      image: 'assets/images/sad-illustration.png',
                      onTap: () {
                        Get.back();
                      },
                    );
                  } else {
                    showQrCode(context, controller, data, jadwalId, pertemuan,
                        namaMk, durasi);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

void showQrCode(BuildContext context, DetailPertemuanController controller,
    String data, jadwalId, pertemuan, namaMk, durasi) {
  showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) {
      return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                // padding: const EdgeInsets.only(top: 20),
                width: Get.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Center(
                  child: SizedBox(
                    width: 300,
                    height: 300,
                    child: RepaintBoundary(
                      key: controller.globalKey,
                      child: QrImageView(
                        data: data,
                        version: QrVersions.auto,
                        backgroundColor: Colors.white,
                        embeddedImageStyle:
                            const QrEmbeddedImageStyle(size: Size(100, 100)),
                        // embeddedImage: const AssetImage(
                        //     "assets/images/logo-mahardika.png"),
                        errorStateBuilder: (cxt, err) {
                          return const Center(
                            child: Text("Error"),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                      height: 20,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          color: Colors.grey[200],
                        ),
                      ),
                    ),
                    Expanded(
                      child: LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return Flex(
                            direction: Axis.horizontal,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(
                              (constraints.constrainWidth() / 10).floor(),
                              (index) => SizedBox(
                                height: 1,
                                width: 5,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                      height: 20,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          color: Colors.grey[200],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    ButtonConfirm(
                      onTap: () {
                        controller.convertQrCodeToImage(
                            namaMk, pertemuan, durasi);
                      },
                      height: 50,
                      width: Get.width,
                      radius: 20,
                      widget: const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.share_outlined,
                            size: 24.0,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "Share QrCode",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                              fontFamily: 'SignikaSemi',
                            ),
                          ),
                        ],
                      ),
                      color: AppColor.blueColor.withOpacity(0.3),
                      colorOutline: AppColor.bluePrimary,
                      isOutline: true,
                      widthOutline: 1,
                    ),
                    const SizedBox(
                      height: 14.0,
                    ),
                    ButtonConfirm(
                      onTap: () {
                        Get.back();
                      },
                      height: 50,
                      width: Get.width,
                      radius: 20,
                      widget: const Text(
                        "Tutup",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontFamily: 'SignikaSemi',
                        ),
                      ),
                      color: AppColor.blueColor.withOpacity(0.6),
                      colorOutline: AppColor.bluePrimary,
                      isOutline: false,
                      widthOutline: 1,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void presensiBottomsheet({
  required BuildContext context,
  required PresensiManualController controller,
  required String npm,
  required String jadwal_id,
  required String presensi_id,
}) {
  showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) {
      
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("Muhammad Rizki"),
                Row(
                  children: [
                    Radio(
                      value: 1,
                      groupValue: controller.valueChoice.value,
                      onChanged: (value) {
                        controller.valueChoice.value = value!;
                        controller.status.value = 'H';
                        controller.nilai.value= 1;
                        print('hadir');
                      },
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    const Text("Hadir"),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 2,
                      groupValue: controller.valueChoice.value,
                      onChanged: (value) {
                        controller.valueChoice.value = value!;
                        controller.status.value = 'I';
                        controller.nilai.value = 1;
                        print('izin');
                      },
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    const Text("Izin"),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 3,
                      groupValue: controller.valueChoice.value,
                      onChanged: (value) {
                        controller.valueChoice.value = value!;
                        controller.status.value = 'S';
                        controller.nilai.value = 1;
                        print('sakit');
                      },
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    const Text("Sakit"),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 4,
                      groupValue: controller.valueChoice.value,
                      onChanged: (value) {
                        controller.valueChoice.value = value!;
                        controller.status.value = 'A';
                        controller.nilai.value = 1;
                        print('alpa');
                      },
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    const Text("Alpa"),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: Get.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonConfirm(
                        onTap: () {
                          Get.back();
                        },
                        height: 50,
                        width: Get.width / 2.5,
                        radius: 12,
                        widget: const Text(
                          "Cancel",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                            fontFamily: 'SignikaSemi',
                          ),
                        ),
                        color: AppColor.blueColor.withOpacity(0.6),
                        colorOutline: AppColor.bluePrimary,
                        isOutline: false,
                        widthOutline: 1,
                      ),
                      ButtonConfirm(
                        onTap: () {
                          Map<String, dynamic> requestBody = {
                            'npm': npm,
                            'status':controller.status.value,
                            'jadwal_id': jadwal_id,
                            'presensi_id': presensi_id,
                            'nilai': controller.nilai.value,
                          };
                          Get.back();
                          controller.absen(requestBody);
                        },
                        height: 50,
                        width: Get.width / 2.5,
                        radius: 12,
                        widget: const Text(
                          "Simpan",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                            fontFamily: 'SignikaSemi',
                          ),
                        ),
                        color: AppColor.blueColor.withOpacity(0.6),
                        colorOutline: AppColor.bluePrimary,
                        isOutline: false,
                        widthOutline: 1,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
