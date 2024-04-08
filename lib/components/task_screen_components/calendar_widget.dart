import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_manger/Constants/constants.dart';

Widget calendarWidget(screenHeight, screenWidth, DateTime date) {
  Color? fontColor(DateTime date) {
    Color? color;
    date.day == DateTime.now().day ? color = Colors.black : Colors.white;
    return color;
  }

  colorContainer(DateTime date) {
    if (date.day == DateTime.now().day) {
      return [
         kMainColor,
      Color.lerp(kMainColor, kGradientOrange, 0.5)!,
      kGradientOrange,
      Color.lerp(kGradientOrange, kLightblue, 0.5)!,
      kLightblue,
      ];
    } else {
      return [const Color(0xff333333), kPriamaryColor];
    }
  }

  return Container(
    decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: colorContainer(date)),
        color: const Color(0xff333333),
        borderRadius: BorderRadius.circular(40)),
    height: screenHeight * 0.2,
    width: screenWidth * 0.17,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          DateFormat('dd').format(date),
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 23,
              color: fontColor(date)),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          DateFormat('EEEE').format(date).substring(0, 3),
          style: TextStyle(fontWeight: FontWeight.bold, color: fontColor(date)),
        ),
      ],
    ),
  );
}
