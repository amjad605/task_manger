import 'dart:async';

import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_manger/Screens/OnBoardingScreen/onBoardingScreen.dart';

import '../../Constants/constants.dart';
import '../../screens/OnBoardingScreen/OnBoardScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      //   Get.offAll(() => OnBoardingScreen(),transition: Transition.upToDown);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const OnBoardScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
          child: ZoomIn(
              child: SvgPicture.asset('assets/images/Clip path group.svg'))),
    );
  }
}
