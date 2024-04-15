import 'dart:async';
import 'dart:convert';

import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_manger/Api/api_servies.dart';
import 'package:task_manger/Screens/OnBoardingScreen/onBoardingScreen.dart';
import 'package:task_manger/cache_helper/local.dart';
import 'package:task_manger/cubits/profile_cubit/profile_cubit.dart';
import 'package:task_manger/models/user_account.dart';
import 'package:task_manger/screens/controller_screen/controller_screen.dart';

import '../../Constants/constants.dart';
import '../../models/user_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    delay();
    super.initState();
  }

  delay() {
    Timer(const Duration(seconds: 3), () {
      //   Get.offAll(() => OnBoardingScreen(),transition: Transition.upToDown);

      token = CacheHelper.getData(key: kAccessToken) ?? '';
      if (token!.isEmpty) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (ctx) => const OnBoardingScreen()),
        );
      } else {
        ApiService.initialize(token!);

        BlocProvider.of<ProfileCubit>(context).getProfile();

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (ctx) => const ControllerScreen()),
        );
      }
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
