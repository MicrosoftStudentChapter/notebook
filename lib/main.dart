import 'package:flutter/material.dart';
import 'package:notes_era/pages/spalsh.dart';
import 'package:notes_era/utils/theme.dart';
import 'package:notes_era/pages/welcome.dart';
import 'package:notes_era/pages/signup.dart';
import 'package:notes_era/pages/login.dart';
import 'package:notes_era/pages/listnotes.dart';
import 'package:notes_era/pages/expandnote.dart';

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
        '/': (context) => const Splash(),
        '/welcome': (context) => const Welcome(),
        '/signup': (context) => const Signup(),
        '/login': (context) => const Login(),
        '/list': (context) => const ListNotes(),
        '/expand': (context) => const ExpandNotes()
      },
      //  Light theme details
      theme: lightTheme(),
      // Dark theme details
      darkTheme: darkTheme(),
    );
  }
}
