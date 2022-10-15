import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme() {
  return ThemeData(
    primaryColor: Colors.white,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    primaryColorDark: Colors.black,
    canvasColor: Colors.white,
    dividerColor: const Color(0xff888888),
    appBarTheme: const AppBarTheme(
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarBrightness: Brightness.light)),
  );
}

ThemeData darkTheme() {
  return ThemeData(
        primaryColor: Colors.black,
        primaryColorLight: Colors.black,
        brightness: Brightness.dark,
        primaryColorDark: Colors.white,
        indicatorColor: Colors.white,
        canvasColor: Colors.black,
        appBarTheme: const AppBarTheme(
            systemOverlayStyle:
                SystemUiOverlayStyle(statusBarBrightness: Brightness.dark)),
        dividerColor: Colors.white,
      );
}
