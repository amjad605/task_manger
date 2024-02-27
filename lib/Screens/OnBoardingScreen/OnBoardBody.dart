import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:task_manger/Constants/constants.dart';
import 'package:task_manger/screens/OnBoardingScreen/Widgets/OnboardItem.dart';
import 'package:task_manger/screens/OnBoardingScreen/Widgets/OnboardingCustomBody.dart';
import 'package:task_manger/screens/OnBoardingScreen/model/onboarding_model.dart';

class OnBoardBody extends StatefulWidget {
  const OnBoardBody({super.key});

  @override
  State<OnBoardBody> createState() => _OnBoardBodyState();
}

class _OnBoardBodyState extends State<OnBoardBody> {
  List<OnboardModel> item = [
    OnboardModel(
        image: "assets/images/Untitled-3.png",
        text: "Task , Calender , Pariority.",
        bgColor: kMainColor),
    OnboardModel(
        image: "assets/images/Untitled.png",
        text: "Work Anywheare Easliy.",
        bgColor: kBackgroundColor),
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
            positionSlideIcon: 0.7,
            waveType: WaveType.circularReveal,
            slideIconWidget: const Icon(Icons.arrow_forward_ios),
            itemBuilder: (ctx, indx) => indx == 0
                ? const OnBoardCustomBody()
                : OnboardItem(
                    model: item[indx - 1],
                  ),
            itemCount: 4));
  }
}
