import 'package:absensi_mahardika/app/routes/app_pages.dart';
import 'package:absensi_mahardika/app/utils/color.dart';
import 'package:absensi_mahardika/app/widgets/dots/dots.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:get/get.dart';

import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  const IntroductionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        pages: [
          PageViewModel(
            title: "Screen 1",
            body:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer scelerisque lobortis efficitur. Donec varius lectus lacus.",
            image: Image.asset(
              "assets/images/image1.png",
            ),
            decoration: PageDecoration(
              imageFlex: 2,
              bodyTextStyle: TextStyle(
                fontSize: 16.0,
                color: AppColor.greyColor,
              ),
            ),
          ),
          PageViewModel(
            title: "Screen 2",
            body:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer scelerisque lobortis efficitur. Donec varius lectus lacus.",
            image: Image.asset(
              "assets/images/image2.png",
            ),
            decoration: PageDecoration(
              imageFlex: 2,
              bodyTextStyle: TextStyle(
                fontSize: 16.0,
                color: AppColor.greyColor,
              ),
            ),
          ),
          PageViewModel(
            title: "Screen 3",
            body:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer scelerisque lobortis efficitur. Donec varius lectus lacus.",
            image: Image.asset(
              "assets/images/image3.png",
            ),
            decoration: PageDecoration(
              imageFlex: 2,
              bodyTextStyle: TextStyle(
                fontSize: 16.0,
                color: AppColor.greyColor,
              ),
            ),
          ),
        ],
        onDone: () => Get.offAllNamed(Routes.LOGIN),
        scrollPhysics: const ClampingScrollPhysics(),
        dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: Theme.of(context).colorScheme.secondary,
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        ),
        showBackButton: true,
        back: Text(
          "Back",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColor.blueColor,
          ),
        ),
        next: Text(
          "Next",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColor.blueColor,
          ),
        ),
        done: const Text(
          "Login",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
