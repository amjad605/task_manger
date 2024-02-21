import 'package:flutter/material.dart';
import 'package:task_manger/Constants/constants.dart';
import 'package:task_manger/Screens/StatisticsScreen/overall_info_class.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kItemsBackgroundColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Row(
                    children: [
                      for (var i in info)
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: buildItem(i, screenWidth, screenHeight),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.all(screenWidth * 0.03),
            child: SizedBox(
              width: screenWidth,
              height: screenHeight * 0.5,
              child: Container(
                decoration: BoxDecoration(
                  color: kItemsBackgroundColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.05),
                  child: Text(
                      "Tasks Done",
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.03,
                      ),
                    ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildItem(Info i, final screenWidth, final screenHeight) {
  return SizedBox(
    width: screenWidth * 0.56,
    height: screenHeight * 0.28,
    child: Container(
      decoration: BoxDecoration(
        color: kItemsBackgroundColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.02),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(screenWidth * 0.02),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(38, 38, 42, 0.827),
                    ),
                    padding: EdgeInsets.all(screenWidth * 0.02),
                    child: Icon(
                      i.icon,
                      size: screenWidth * 0.05,
                    ),
                  ),
                ),
                Text(
                  i.title,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.03,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: Color.fromRGBO(38, 38, 42, 0.827),
            indent: 15,
            endIndent: 15,
          ),
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.02),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(i.graph),
                  width: screenWidth * 0.3,
                  height: screenHeight * 0.1,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        i.text,
                        style: TextStyle(
                          color: const Color.fromARGB(154, 255, 255, 255),
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.025,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
