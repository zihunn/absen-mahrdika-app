import 'package:absensi_mahardika/app/utils/style.dart';
import 'package:get/get.dart';
import 'package:absensi_mahardika/app/controllers/auth_controller.dart';
import 'package:absensi_mahardika/app/modules/profile/controllers/profile_controller.dart';
import 'package:absensi_mahardika/app/utils/color.dart';
import 'package:absensi_mahardika/app/utils/language.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await initializeDateFormatting('id_ID', null).then(
    (_) => runApp(const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final profCtrl = Get.put(ProfileController());
    final authC = Get.put(AuthController(), permanent: true);
    return profCtrl.isChange.value
        ? Obx(
            () {
              return GetMaterialApp(
                translations: LocalString(),
                locale: Get.find<ProfileController>().language.value
                    ? const Locale('en', 'US')
                    : const Locale('id', 'ID'),
                debugShowCheckedModeBanner: false,
                theme: Get.find<ProfileController>().isDarkMode.value
                    ? Themes.dark
                    : Themes.light,
                initialRoute: authC.isSkipIntro.isTrue
                    ? authC.isAuth.isTrue
                        ? Routes.NAVIGATION_BAR
                        : Routes.LOGIN
                    : Routes.INTRODUCTION,
                getPages: AppPages.routes,
              );
            },
          )
        : FutureBuilder(
            future: Future.delayed(const Duration(milliseconds: 3000)),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Obx(
                  () {
                    return GetMaterialApp(
                      translations: LocalString(),
                      locale: Get.find<ProfileController>().language.value
                          ? const Locale('en', 'US')
                          : const Locale('id', 'ID'),
                      debugShowCheckedModeBanner: false,
                      theme: Get.find<ProfileController>().isDarkMode.value
                          ? Themes.dark
                          : Themes.light,
                      initialRoute: authC.isSkipIntro.isTrue
                          ? authC.isAuth.isTrue
                              ? Routes.NAVIGATION_BAR
                              : Routes.LOGIN
                          : Routes.INTRODUCTION,
                      getPages: AppPages.routes,
                    );
                  },
                );
              }
              return FutureBuilder(
                  future: authC.firstInitialized(),
                  builder: (context, snapshot) => const SplashScreen());
            },
          );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          height: Get.height,
          width: Get.width,
          decoration: const BoxDecoration(
            color: AppColor.bluePrimary,
          ),
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  height: 40,
                  width: Get.width,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: AppColor.bluePrimary,
                  ),
                  child: Text(
                    "Mahardika",
                    style: Style.Header1.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Image.asset(
                      "assets/images/logo.gif",
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  height: 40,
                  width: Get.width,
                  decoration: const BoxDecoration(
                    color: AppColor.bluePrimary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
