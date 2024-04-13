import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:task_manger/Constants/constants.dart';
import 'package:task_manger/components/task_screen_components/calendar_widget.dart';
import 'package:task_manger/components/task_screen_components/task_complete_widget.dart';
import 'package:task_manger/components/task_widget.dart';
import 'package:task_manger/components/task_screen_components/user_info_widget.dart';
import 'package:task_manger/screens/tasks_screen/task_info.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../cache_helper/local.dart';
import 'cubit/left_done_tasks_cubit/switch_done_left_tasks.dart';
import 'cubit/left_done_tasks_cubit/tasks_states.dart';

class TasksScreen extends StatelessWidget {
  TasksScreen({super.key});
  var _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.04),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildUserInfoWidget(screenWidth, screenHeight),
                  SizedBox(
                    height: screenHeight * 0.009,
                  ),
                  buildTaskCompleteWidget(screenWidth, screenHeight),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.125,
              child: ListView.separated(
                controller: _controller,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: dates.length,
                itemBuilder: (context, index) {
                  _controller.animateTo((43 * index).toDouble(),
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.linear);
                  return calendarWidget(
                      screenHeight, screenWidth, dates[index]);
                },
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  width: screenWidth * 0.03,
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.04,
            ),
            Expanded(
              child: Container(
                height: screenHeight * 0.6,
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
                            onToggle: (index) {
                              print("Switched to: $index");
                              SwitchDoneLeftTasks.get(context)
                                  .switched(index ?? 1);
                            },
                          ),
                        ),
                      ],
                    ),
                    BlocBuilder<SwitchDoneLeftTasks, States>(
                      builder: (context, state) {
                        debugPrint("$state");
                        List<TaskData> currentTasks = [];
                        if (state is LeftTasksState) {
                          currentTasks = state.leftTasks;
                        } else if (state is DoneTasksState) {
                          //DONE
                          currentTasks = state.finishedTasks;
                        } else {
                          //EROR
                          return Text("ERROR");
                        }
                        return Expanded(
                          child: ListView.builder(
                            itemCount: currentTasks.length,
                            itemBuilder: (context, index) {
                              final currentTasks = tasks[index];
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 18.0),
                                child: TaskWidget(
                                  percent: currentTasks.percent,
                                  titleTask: currentTasks.titleTask,
                                  deadlineDate: currentTasks.deadlineDate,
                                  urlImages: currentTasks.urlImages,
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
