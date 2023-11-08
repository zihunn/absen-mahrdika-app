import 'package:flutter/material.dart';

class AppColor {
  static const primaryColor = Color(0xff4c16a7);
  static const blackSoftColor = Color(0xff444766);
  static const whiteColor = Colors.white;
  static final greyColor = Color(0xFFBDBDBD);
  static const yellowColor = Color(0xFFFFC107);
  static const bluePrimary = Color(0xff08a7e5);
  static const orangeColor = Color(0xFFFF9800);
  static const greenColor = Color(0xff82CD47);
  static final blueColor = Colors.blue.withOpacity(0.8);
  static const blueColor2 = Color(0xff91c8e4);
}

class Themes {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.grey[100],
    cardColor: Colors.white,
    shadowColor: const Color(0x19000000),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColor.blackSoftColor),
    ),
    appBarTheme: const AppBarTheme(backgroundColor: AppColor.bluePrimary),
  );
  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    shadowColor: const Color.fromARGB(92, 253, 252, 252),
    cardColor: const Color(0xff3d4249),
    textTheme:
        const TextTheme(bodyLarge: TextStyle(color: AppColor.whiteColor)),
    primaryColor: const Color(0xff121212),
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xff121212)),
  );
}
