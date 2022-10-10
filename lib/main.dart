import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes_era/spalsh.dart';
import 'package:notes_era/welcome.dart';
import 'package:notes_era/signup.dart';
import 'package:notes_era/login.dart';
import 'package:notes_era/listnotes.dart';
import 'package:notes_era/expandnote.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      themeMode: ThemeMode.system,
      routes: {
        '/': (context) => Splash(),
        '/welcome': (context) => Welcome(),
        '/signup': (context) => Signup(),
        '/login': (context) => Login(),
        '/list': (context) => ListNotes(),
        '/expand': (context) => ExpandNotes()
      },
      //  Light theme details
      theme: ThemeData(
        primaryColor: Colors.white,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        primaryColorDark: Colors.black,
        canvasColor: Colors.white,
        appBarTheme: const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle(statusBarBrightness: Brightness.light)),
      ),
      // Dark theme details
      darkTheme: ThemeData(
        primaryColor: Colors.black,
        primaryColorLight: Colors.black,
        brightness: Brightness.dark,
        primaryColorDark: Colors.black,      
        indicatorColor: Colors.white,
        canvasColor: Colors.black,
        appBarTheme: const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle(statusBarBrightness: Brightness.dark)),
      ),
    );
  }
}
