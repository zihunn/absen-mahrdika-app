import 'package:absensi_mahardika/app/controllers/auth_controller.dart';
import 'package:absensi_mahardika/app/modules/register/views/register_view.dart';
import 'package:absensi_mahardika/app/widgets/animation/animation.dart';
import 'package:absensi_mahardika/app/widgets/textfield/custom_textfield.dart';
import 'package:absensi_mahardika/models/device_info_model.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final authCtrl = Get.put(AuthController());
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).padding.top + 50),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeAnimation(
                      1,
                      Center(
                        child: SizedBox(
                          width: 280,
                          child: Image.asset(
                            "assets/images/login.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const FadeAnimation(
                      1.2,
                      Text(
                        '',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    FadeAnimation(
                      1.4,
                      Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: QTextFieldAuth(
                          textC: controller.npmCtrl,
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: ImageIcon(
                              AssetImage(
                                "assets/icons/at.png",
                              ),
                              size: 24.0,
                            ),
                          ),
                          obscure: false,
                          hint: "Npm",
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    FadeAnimation(
                      1.6,
                      Obx(
                        () => Form(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: QTextFieldAuth(
                            textC: controller.passwordCtrl,
                            prefixIcon: const Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: ImageIcon(
                                AssetImage(
                                  "assets/icons/lock.png",
                                ),
                                size: 24.0,
                              ),
                            ),
                            obscure: controller.showPasword.value,
                            hint: "Password",
                            suffixIcon: GestureDetector(
                              onTap: () {
                                controller.showPasword.value =
                                    !controller.showPasword.value;
                              },
                              child: Icon(
                                controller.showPasword.value
                                    ? EneftyIcons.eye_slash_outline
                                    : EneftyIcons.eye_outline,
                              ),
                            ),
                            onChanged: (value) {},
                            validator: (value) {
                              if (value!.isNotEmpty && value.length < 6) {
                                return "Enter min. 6 character";
                              } else {
                                // print(controller.isCorrect.value);
                                return null;
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 31.0,
                ),
                FadeAnimation(
                  2,
                  FutureBuilder<AndroidDeviceInfo>(
                    future: controller.getInfo(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        DeviceInfoModel data = DeviceInfoModel(
                            id: snapshot.data!.id,
                            model: snapshot.data!.model,
                            version: snapshot.data!.version.incremental);
                        print(data);
                        return SizedBox(
                          height: 50,
                          width: Get.width,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              if (controller.npmCtrl.text.isNotEmpty &&
                                  controller.passwordCtrl.text.isNotEmpty) {
                                Map<String, dynamic> requestBody = {
                                  'npm': controller.npmCtrl.text,
                                  'password': controller.passwordCtrl.text,
                                  'device_id': controller.npmCtrl.text +
                                      data.id! +
                                      data.version! +
                                      data.model!
                                };
                                Map<String, dynamic> jadwal = {
                                  'npm': controller.npmCtrl.text,
                                };

                                print(requestBody);
                                authCtrl.Login(requestBody);
                                authCtrl.getJadwal(jadwal);
                              }
                            },
                            child: const Text("Login"),
                          ),
                        );
                      }
                      return Center(
                        child: SizedBox(
                          height: 50,
                          width: Get.width,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text("Login"),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                FadeAnimation(
                  2.3,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have account?",
                        style: TextStyle(
                          color: Colors.black38,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(
                            const RegisterView(),
                            transition: Transition.rightToLeft,
                          );
                        },
                        child: const Text("Register"),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).viewInsets.bottom,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
