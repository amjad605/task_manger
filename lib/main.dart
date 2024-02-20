import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_manger/constants.dart';
import 'OnBoardingScreen/onBoardingScreen.dart';

void main() {
  runApp(const MyTaskManger());
}

class MyTaskManger extends StatelessWidget {
  const MyTaskManger({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kBackgroungColor,
          textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme)),
      home: const OnBoardingScreen(),
    );
  }
}
