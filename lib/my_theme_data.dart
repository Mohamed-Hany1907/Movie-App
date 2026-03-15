import 'dart:ui';

import 'package:flutter/material.dart';

class MyThemeData {
  static Color primaryColor = const Color(0xffFFFFFF);
  static Color darkColor = const Color(0xff121312);
  static Color commonColor = const Color(0xffF6BD00);
  static Color RedBottun = const Color(0xffE82626);
  static Color SecondaryColor = const Color(0xff282A28);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
   // commonColor :commonColor,
    scaffoldBackgroundColor: darkColor,
    appBarTheme: AppBarTheme(
      backgroundColor: darkColor,
      centerTitle: true,
      iconTheme: const IconThemeData(
        color: Color(0xffF6BD00)
      )
    ),
    bottomNavigationBarTheme:BottomNavigationBarThemeData(
      showSelectedLabels: true,
      showUnselectedLabels: true,
      backgroundColor: SecondaryColor,
      unselectedItemColor: Colors.white,
      selectedItemColor:  const Color(0xffF6BD00),
      type: BottomNavigationBarType.fixed,
    ),
    textTheme: TextTheme(
      titleSmall: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w700, color: primaryColor),
      titleMedium: TextStyle(
          fontSize: 24, fontWeight: FontWeight.w700, color: primaryColor),
      titleLarge: TextStyle(
          fontSize: 24, fontWeight: FontWeight.w700, color: primaryColor),
      bodySmall: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w700, color: primaryColor),
      bodyMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: primaryColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: primaryColor,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData();
}
