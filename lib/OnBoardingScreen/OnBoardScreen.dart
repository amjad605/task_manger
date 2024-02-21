import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:task_manger/OnBoardingScreen/model/onboarding_model.dart';
import 'package:task_manger/OnBoardingScreen/Widgets/OnboardingCustomBody.dart';
import 'package:task_manger/constants.dart';
import 'package:task_manger/OnBoardingScreen/Widgets/OnboardItem.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  List<OnboardModel> item = [
    OnboardModel(
        image: "assets/images/Untitled-3.png",
        text: "Task , Calender , Pariority.",
        bgColor: kMainColor),
    OnboardModel(
        image: "assets/images/Untitled.png",
        text: "Work Anywheare Easliy.",
        bgColor: kBackgroungColor),
    OnboardModel(
        image: "assets/images/Untitled-2.png",
        text: "Manage Everything On Phone.",
        bgColor: kMainColor),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: LiquidSwipe.builder(
            ignoreUserGestureWhileAnimating: true,
            positionSlideIcon: 0.7,
            waveType: WaveType.circularReveal,
            slideIconWidget: const Icon(Icons.arrow_forward_ios),
            itemBuilder: (ctx, indx) => indx == 0
                ? OnBoardCustomBody()
                : OnboardItem(
                    model: item[indx - 1],
                  ),
            itemCount: 4));
  }
}
