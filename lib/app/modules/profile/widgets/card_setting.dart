import 'package:absensi_mahardika/app/modules/edit_profil/views/edit_profil_view.dart';
import 'package:absensi_mahardika/app/utils/network.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:absensi_mahardika/app/modules/profile/controllers/profile_controller.dart';
import 'package:absensi_mahardika/app/utils/color.dart';
import 'package:absensi_mahardika/app/utils/style.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ionicons/ionicons.dart';

import 'list_tile.dart';

class CardSetting extends StatefulWidget {
  const CardSetting({super.key});

  @override
  State<CardSetting> createState() => _CardSettingState();
}

class _CardSettingState extends State<CardSetting> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    final storage = GetStorage();
    var themeData = storage.write('darkmode', false);
    bool isDarkMode = storage.read('darkmode');

    return Container(
      width: Get.width,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: context.theme.shadowColor,
            blurRadius: 5,
            offset: const Offset(3, 3),
          ),
          BoxShadow(
            color: context.theme.shadowColor,
            blurRadius: 5,
            offset: const Offset(-3, -2),
          ),
        ],
        borderRadius: const BorderRadius.all(
          Radius.circular(12.0),
        ),
        color: context.theme.primaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardListTile(
            onTap: () {
              Get.to(
                () => const EditProfilView(),
                transition: Transition.rightToLeft,
              );
            },
            leading: const Icon(
              Icons.person_2_rounded,
            ),
            text: 'edit_profil'.tr,
            trailing: const Icon(
              Ionicons.chevron_forward_outline,
            ),
          ),
          const Divider(),
          CardListTile(
              onTap: () {
                Map<String, dynamic> jadwal = {
                  'npm': dataUser.value.account?.npm ??
                      controller.dataUserLocal['account']['npm'],
                };
                // controller.getJadwal(jadwal);
              },
              leading: const Icon(
                CupertinoIcons.refresh,
              ),
              text: 'perbarui_data'.tr,
              trailing: const SizedBox()),
          const Divider(),
          Obx(() {
            return CardListTile(
              onTap: () {},
              leading: const Icon(
                Icons.light_mode,
                size: 24.0,
              ),
              text: 'ubah_tema'.tr,
              trailing: AnimatedToggleSwitch<bool>.dual(
                current: controller.isDarkMode.value,
                first: false,
                second: true,
                spacing: 5.0,
                style: const ToggleStyle(
                  borderColor: Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 2,
                      blurStyle: BlurStyle.solid,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                height: 35,
                onChanged: (value) => controller.toggleTheme(),
                styleBuilder: (b) => ToggleStyle(
                  indicatorColor: b ? AppColor.blackSoftColor : Colors.amber,
                ),
                iconBuilder: (value) => value
                    ? const Icon(
                        Icons.nightlight_round_sharp,
                        color: Colors.amber,
                        size: 14,
                      )
                    : const Icon(
                        Icons.sunny,
                        color: Colors.white,
                        size: 14,
                      ),
                textBuilder: (value) => value
                    ? const Center(
                        child: Text(
                          'Light',
                          style: Style.Subtitle1,
                        ),
                      )
                    : const Center(
                        child: Text(
                          'Dark',
                          style: Style.Subtitle1,
                        ),
                      ),
              ),
            );
          }),
          const Divider(),
          CardListTile(
            onTap: () {},
            leading: const Icon(
              Icons.translate_rounded,
              size: 24.0,
            ),
            text: 'ubah_bahasa'.tr,
            trailing: Obx(
              () {
                return AnimatedToggleSwitch<bool>.dual(
                  current: controller.language.value,
                  first: false,
                  second: true,
                  spacing: 2.0,
                  style: const ToggleStyle(
                    borderColor: Colors.transparent,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 2,
                        blurStyle: BlurStyle.solid,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  height: 35,
                  onChanged: (value) {
                    Locale locale;
                    if (value == true) {
                      locale = const Locale('en', 'US');
                    } else {
                      locale = const Locale('id', 'ID');
                    }
                    controller.changelanguage(locale);
                    final box = GetStorage();
                    var isID = box.read('isID');
                    controller.isChange.value = true;
                    print(isID);
                    controller.language.value = value;
                  },
                  styleBuilder: (b) =>
                      const ToggleStyle(indicatorColor: Colors.transparent),
                  iconBuilder: (value) => value
                      ? Image.asset(
                          "assets/images/english.png",
                        )
                      : Image.asset(
                          "assets/images/indonesia.png",
                        ),
                  textBuilder: (value) => value
                      ? const Center(
                          child: Text(
                            'Id',
                            style: Style.Subtitle1,
                          ),
                        )
                      : const Center(
                          child: Text(
                            'En',
                            style: Style.Subtitle1,
                          ),
                        ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
