import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:task_manger/Constants/constants.dart';

Widget buildTaskCompleteWidget(double screenWidth, double screenHeight) {
    DateTime now = DateTime.now();

  String formattedDate = DateFormat('MMMM dd').format(now);

  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Expanded(
        child: CircularPercentIndicator(
          animation: true,
          rotateLinearGradient: false,
          backgroundColor: Colors.transparent,
          radius: 35,
          lineWidth: 6,
          percent: 0.7,
          //progressColor: Colors.transparent,
          center: Text(
            "${((.7) * 100).toInt()}%",
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          fillColor: Colors.transparent,
        backgroundWidth: 3,
        linearGradient: LinearGradient(
          colors: [ kMainColor,
              Color.lerp(kMainColor, kGradientOrange, 0.5)!,
              kGradientOrange,
              Color.lerp(kGradientOrange, kLightblue, 0.5)!,
              kLightblue, ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        
                )
      ),
      SizedBox(
        width: screenWidth * 0.08,
      ),
      SizedBox(
        width: screenWidth * 0.25,
        child: const Text(
          "Task Completed",
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(
        width: screenWidth * 0.08,
      ),
      Container(
        width: screenWidth * 0.3,
        height: screenHeight * 0.05,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.calendar_month_sharp,
              color: Colors.black,
            ),
            Center(
                child: Text(
              formattedDate,
              style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            )),
          ],
        ),
      )
    ],
  );
}
