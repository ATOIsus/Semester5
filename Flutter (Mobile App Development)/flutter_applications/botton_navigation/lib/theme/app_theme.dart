import 'package:flutter/material.dart';

import '../theme/app_color_constant.dart';

class AppTheme {
  AppTheme._();

  static getApplicationTheme() {
    return ThemeData(
      colorScheme: ColorScheme.light(
        primary: AppColorConstant.primaryColor,
      ),
      fontFamily: 'Montserrat',
      useMaterial3: true,
      appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: AppColorConstant.appBarColor,
          centerTitle: true,
          titleTextStyle:
              TextStyle(color: AppColorConstant.textColor, fontSize: 20)),

      // Change elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: AppColorConstant.primaryColor,
          textStyle: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),

      // //Change text form field theme
      // textTheme: const TextTheme(
      //   bodyLarge: TextStyle(
      //     fontSize: 18,
      //   ),
      // ),

      // Change text field theme
      inputDecorationTheme: const InputDecorationTheme(
        contentPadding: EdgeInsets.all(15),
        border: OutlineInputBorder(),
        labelStyle: TextStyle(
          fontSize: 20,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.pink,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.yellowAccent,
          ),
        ),
      ),

      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.lightGreen,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
    );
  }
}
