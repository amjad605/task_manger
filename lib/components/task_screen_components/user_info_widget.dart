import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manger/Constants/constants.dart';

Widget buildUserInfoWidget(double screenWidth, double screenHeight) => Row(
      children: [
        CircleAvatar(
          radius: 33,
          backgroundColor: Colors.transparent,
          child: Image.asset(
            "assets/images/Person_1.png",
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(
          width: screenWidth * 0.05,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome Jamie!",
                style: TextStyle(fontSize: 15),
              ),
              const Text(
                "Explore Tasks",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        buildEmailNotificationWidget(screenWidth, screenHeight)
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
