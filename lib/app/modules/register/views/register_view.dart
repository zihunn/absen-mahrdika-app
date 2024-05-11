import 'package:absensi_mahardika/app/controllers/auth_controller.dart';
import 'package:absensi_mahardika/app/modules/login/controllers/login_controller.dart';
import 'package:absensi_mahardika/app/utils/color.dart';
import 'package:absensi_mahardika/app/widgets/animation/animation.dart';
import 'package:absensi_mahardika/app/widgets/textfield/custom_textfield.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(RegisterController());
    final authCtrl = Get.put(AuthController());
    final loginCtrl = Get.put(LoginController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: FadeAnimation(
          1,
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              size: 24.0,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: FadeAnimation(
                  0.5,
                  Center(
                    child: SizedBox(
                      width: 280,
                      child: Image.asset(
                        "assets/images/image4.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const FadeAnimation(
                1.2,
                Text(
                  "Register",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              FadeAnimation(
                1.6,
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: QTextFieldAuth(
                    textC: controller.npmCtrl,
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: ImageIcon(
                        AssetImage(
                          "assets/icons/user.png",
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
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: QTextFieldAuth(
                    textC: controller.emailCtrl,
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
                    hint: "Email",
                    onChanged: (value) {},
                    validator: (email) =>
                        email != null && !EmailValidator.validate(email)
                            ? "Enter email valid"
                            : null,
                  ),
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              FadeAnimation(
                1.6,
                Form(
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
                    obscure: true,
                    hint: "Password",
                    onChanged: (value) {},
                    validator: (value) {
                      if (value != null && value.length < 6) {
                        return "Enter min. 6 character";
                      } else {
                        // print(controller.isCorrect.value);
                        return null;
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              FadeAnimation(
                1.6,
                SizedBox(
                  height: 50.0,
                  child: Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.selectedRole.value = 0;
                            controller.role.value = 'Dosen';
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            clipBehavior: Clip.antiAlias,
                            width: Get.width / 4,
                            decoration: BoxDecoration(
                              color: controller.selectedRole.value == 0
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
                                    child:
                                        Image.asset("assets/icons/dosen.png"),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Text(
                                        "Dosen",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontFamily: 'SignikaBold',
                                          color:
                                              controller.selectedRole.value == 0
                                                  ? Colors.white
                                                  : Colors.grey
                                                      .withOpacity(0.5),
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
                            controller.selectedRole.value = 1;
                            controller.role.value = 'Mhsw';
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            clipBehavior: Clip.antiAlias,
                            width: Get.width / 3,
                            decoration: BoxDecoration(
                              color: controller.selectedRole.value == 1
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
                                    child: Image.asset("assets/icons/mhsw.png"),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Text(
                                        "Mahasiswa",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontFamily: 'SignikaBold',
                                          color:
                                              controller.selectedRole.value == 1
                                                  ? Colors.white
                                                  : Colors.grey
                                                      .withOpacity(0.5),
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
              ),
              const SizedBox(
                height: 35.0,
              ),
             
              FadeAnimation(
                1.8,
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.bluePrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      if (controller.npmCtrl.text.isNotEmpty &&
                          controller.emailCtrl.text.isNotEmpty &&
                          controller.passwordCtrl.text.isNotEmpty &&
                          controller.role.value.isNotEmpty) {
                        Map<String, dynamic> requestBody = {
                          'email': controller.emailCtrl.text,
                          'npm': controller.npmCtrl.text,
                          'password': controller.passwordCtrl.text,
                          'device_id':
                              controller.npmCtrl.text + loginCtrl.deviceId,
                          'role': controller.role.value,

                          // 'email': controller.emailCtrl.text,
                          // 'npm': controller.npmCtrl.text,
                          // 'password': controller.passwordCtrl.text,
                          // 'device_id': controller.npmCtrl.text +
                          //     loginCtrl.id! +
                          //     loginCtrl.version! +
                          //     loginCtrl.model!
                        };
                        print(requestBody);
                        authCtrl.register(requestBody);
                      }
                    },
                    child: const Text("Login"),
                  ),
                ),
              ),
              const SizedBox(
                height: 35.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
