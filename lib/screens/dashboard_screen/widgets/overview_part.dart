import 'package:flutter/material.dart';
import 'package:task_manger/Constants/constants.dart';
import 'package:task_manger/components/task_widget.dart';
import 'package:task_manger/screens/tasks_screen/task_info.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'custom_text_image.dart';

class OverviewPart extends StatelessWidget {
  const OverviewPart({super.key});

  @override
  Widget build(BuildContext context) {
    /*final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: screenHeight * 0.5,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40.0),
                topLeft: Radius.circular(40.0),
              ),
              color: Color.fromRGBO(23, 23, 42, 0.824),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: screenWidth * 0.06,
                            top: screenWidth * 0.06,
                          ),
                          child: const Text(
                            "Your Tasks",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: screenWidth * 0.06,
                          ),
                          child: const Text(
                            "(7/10)Completed",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white38,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.only(
                        top: screenHeight * 0.03,
                        right: screenWidth * 0.03,
                      ),
                      child: ToggleSwitch(
                        minWidth: screenWidth * 0.18,
                        minHeight: screenHeight * 0.06,
                        cornerRadius: 35.0,
                        activeBgColors: const [
                          [kMainColor],
                          [kMainColor]
                        ],
                        customTextStyles: const [
                          TextStyle(
                            fontSize: 16,
                          )
                        ],
                        activeFgColor: Colors.white,
                        inactiveBgColor: kBackgroundColor,
                        inactiveFgColor: Colors.white,
                        initialLabelIndex: 1,
                        totalSwitches: 2,
                        labels: const ['Left', 'Done'],
                        radiusStyle: true,
                        animate: true,
                        borderColor: const [kMainColor],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TaskWidget(
                          percent: task.percent,
                          titleTask: task.titleTask,
                          deadlineDate: task.deadlineDate,
                          urlImages: task.urlImages,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }*/
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomContainerWithTextImage(
          count: "16",
          image: 'assets/icons/total_tasks.png',
          text: "Total Tasks",
        ),
        SizedBox(height: 15),
        CustomContainerWithTextImage(
          count: "32",
          image: "assets/icons/completed_tasks.png",
          text: "Completed Tasks",
        ),
        SizedBox(height: 15),
        CustomContainerWithTextImage(
          count: "16",
          image: "assets/icons/total_tasks.png",
          text: "Total Projects",
        ),
      ],
    );
  }
}
