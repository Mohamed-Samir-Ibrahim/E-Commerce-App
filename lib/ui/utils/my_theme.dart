import 'package:flutter/material.dart';

import 'my_colors.dart';

class MyTheme {
  static ThemeData myTheme = ThemeData(
    primaryColor: MyColors.primaryColor,

    ///* BottomNavigationBarThemeData
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: MyColors.whiteColor,
        selectedItemColor: MyColors.whiteColor),

    ///* AppBarTheme
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      titleSpacing: 1,
      foregroundColor: MyColors.primaryColor,
    ),

    ///* TextTheme
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontFamily: 'Poppins',
        color: MyColors.whiteColor,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Poppins',
        color: MyColors.whiteColor,
        fontWeight: FontWeight.w500,
        fontSize: 18,
      ),
      titleSmall: TextStyle(
        fontFamily: 'Poppins',
        color: MyColors.primaryColor,
        fontWeight: FontWeight.w300,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Poppins',
        color: MyColors.whiteColor,
        fontWeight: FontWeight.w400,
        fontSize: 17,
      ),
    ),
  );
}
