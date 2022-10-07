import 'package:flutter/material.dart';
import 'package:notes_era/spalsh.dart';
import 'package:notes_era/welcome.dart';
import 'package:notes_era/signup.dart';
import 'package:notes_era/login.dart';
import 'package:notes_era/listnotes.dart';
import 'package:notes_era/expandnote.dart';

void run() => {
  MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => Splash(),
      '/welcome': (context) => Welcome(),
      '/signup': (context) => Signup(),
      '/login': (context) => Login(),
      '/list': (context) => ListNotes(),
      '/expand': (context) => ExpandNotes()
    }
  )
};