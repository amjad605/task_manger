import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger/Constants/constants.dart';
import 'package:task_manger/cubits/profile_cubit/profile_cubit.dart';

Widget buildUserInfoWidget(
        double screenWidth, double screenHeight, BuildContext context) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Color.fromARGB(221, 67, 66, 66),
          child: Text(
              "${BlocProvider.of<ProfileCubit>(context).myUser!.name![0].toUpperCase()}"),
        ),
        SizedBox(
          width: screenWidth * 0.05,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedTextKit(
                  pause: const Duration(milliseconds: 600),
                  displayFullTextOnTap: true,
                  totalRepeatCount: 1,
                  isRepeatingAnimation: true,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      speed: const Duration(milliseconds: 150),
                      "Hello ${BlocProvider.of<ProfileCubit>(context).myUser!.name}👋",
                      textStyle: TextStyle(fontSize: screenHeight * 0.018),
                    )
                  ]),
              const Text(
                "Explore Tasks",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),

        // buildEmailNotificationWidget(screenWidth, screenHeight)
      ],
    );

Widget buildEmailNotificationWidget(double screenWidth, double screenHeight) =>
    Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          width: screenWidth * 0.13,
          height: screenHeight * 0.13,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: kPriamaryColor)),
          child: IconButton(
            icon: const Icon(
              Icons.email,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ),
        Positioned(
          top: 40,
          right: 14,
          child: Container(
            width: 0.02 * screenWidth,
            height: screenHeight * 0.02,
            decoration: BoxDecoration(
                border: Border.all(color: kBackgroundColor),
                color: const Color(0xff94dd9f),
                shape: BoxShape.circle),
          ),
        ),
      ],
    );
