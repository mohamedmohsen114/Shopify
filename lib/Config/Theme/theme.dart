import 'package:commerceapp/Config/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    cardTheme: const CardTheme(
      color: Colors.white,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    pageTransitionsTheme: PageTransitionsTheme(builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    }),
    colorScheme: ColorScheme.light(
      background: AppColors.lightBackgroud,
      primary: AppColors.primaryColor,
    ),
    useMaterial3: true,
    primaryColor: AppColors.primaryColor,
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: AppColors.lightBackgroud,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 22)),
    textTheme: const TextTheme(
        bodyMedium: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20),
        bodyLarge: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w500, fontSize: 22)),
    bottomAppBarTheme: BottomAppBarTheme(
      color: AppColors.grayColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      elevation: 1,
    ),
  );

  static ThemeData darkTheme = ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      pageTransitionsTheme: PageTransitionsTheme(builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      }),
      cardTheme: const CardTheme(
        color: Color(0xff23272C),
      ),
      colorScheme: ColorScheme.dark(
          background: AppColors.darkColor, primary: AppColors.primaryColor),
      useMaterial3: true,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      primaryColor: AppColors.primaryColor,
      appBarTheme: AppBarTheme(
          backgroundColor: AppColors.darkColor,
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 22),
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.light,
          )),
      textTheme: const TextTheme(
          bodyMedium: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
          bodyLarge: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 22)),
      bottomAppBarTheme: BottomAppBarTheme(
        color: AppColors.darkColor,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xff23272C),
        elevation: 1,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: const TextStyle(color: Colors.black),
        fillColor: AppColors.grayColor,
      ));
}
