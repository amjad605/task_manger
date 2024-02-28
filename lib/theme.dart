import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_manger/constants.dart';

ThemeData theme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: kBackgroungColor,
  textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
  bottomAppBarTheme: const BottomAppBarTheme(
    surfaceTintColor: tintBlack,
    color: tintBlack,
    height: 70,
    shape: CircularNotchedRectangle(),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    shape: CircleBorder(),
    backgroundColor: Color(0xff555eab),
  ),
);
ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  scaffoldBackgroundColor: const Color.fromARGB(255, 196, 198, 226),
  textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme),
  bottomAppBarTheme: const BottomAppBarTheme(
    height: 70,
    shape: CircularNotchedRectangle(),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    shape: CircleBorder(),
    backgroundColor: Color(0xff555eab),
  ),
);
