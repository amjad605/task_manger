import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:task_manger/Constants/constants.dart';
import 'package:task_manger/components/task_screen_components/calendar_widget.dart';
import 'package:task_manger/components/task_screen_components/task_complete_widget.dart';
import 'package:task_manger/components/task_widget.dart';
import 'package:task_manger/components/task_screen_components/user_info_widget.dart';
import 'package:task_manger/cubits/profile_cubit/profile_cubit.dart';
import 'package:task_manger/screens/tasks_screen/task_info.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../cache_helper/local.dart';
import 'cubit/left_done_tasks_cubit/switch_done_left_tasks.dart';
import 'cubit/left_done_tasks_cubit/tasks_states.dart';

class TasksScreen extends StatelessWidget {
  TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController _controller = ScrollController();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(body: BlocBuilder<ProfileCubit, ProfileEditingState>(
      builder: (context, state) {
        if (state is ProfileSuccessState) {
          //SwitchDoneLeftTasks.get(context).switched(1);
          SwitchDoneLeftTasks.get(context).switched(0);
          return Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.04),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      buildUserInfoWidget(screenWidth, screenHeight, context),
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
                      _controller.animateTo((32 * index).toDouble(),
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.linear);
                      return calendarWidget(
                          screenHeight, screenWidth, dates[index]);
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(
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
                              initialLabelIndex: 0,
                              totalSwitches: 2,
                              labels: const ['Left', 'Done'],
                              radiusStyle: true,
                              animate: true,
                              borderColor: const [kMainColor],
                              onToggle: (index) {
                                SwitchDoneLeftTasks.get(context).index =
                                    index ?? 1;
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
                          if (state is LoadingState) {
                            return Expanded(
                              child: Center(
                                child: LoadingAnimationWidget.twistingDots(
                                    leftDotColor: kMainColor,
                                    rightDotColor: kLightblue,
                                    size: 30),
                              ),
                            );
                          }
                          if (state is LeftTasksState) {
                            currentTasks = state.leftTasks;
                            return currentTasks.isEmpty
                                ? Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Lottie.asset(
                                              width: 150.w,
                                              height: 140.h,
                                              "assets/images/Animation - 1713100638764.json"),
                                          DefaultTextStyle(
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey,
                                              shadows: [
                                                Shadow(
                                                  blurRadius: 2.0,
                                                  color: Colors.grey,
                                                  offset: Offset(0, 0),
                                                ),
                                              ],
                                            ),
                                            child: Center(
                                              child: AnimatedTextKit(
                                                displayFullTextOnTap: true,
                                                isRepeatingAnimation: true,
                                                pause: const Duration(
                                                    milliseconds: 600),
                                                totalRepeatCount: 1,
                                                animatedTexts: [
                                                  TyperAnimatedText(
                                                      textAlign:
                                                          TextAlign.center,
                                                      'Empty task list! Time for a break or a new challenge? Add a task to get started!'),
                                                ],
                                              ),
                                            ),
                                          )
                                          // const Text(
                                          //   "Empty task list! Time for a break or a new challenge? Add a task to get started!",
                                          //   style: TextStyle(
                                          //     fontSize: 15,
                                          //     color: Colors.grey,
                                          //   ),
                                          //   textAlign: TextAlign.center,
                                          // )
                                        ],
                                      ),
                                    ),
                                  )
                                : Expanded(
                                    child: ListView.builder(
                                      itemCount: currentTasks.length,
                                      itemBuilder: (context, index) {
                                        print(currentTasks[index].name);
                                        print(currentTasks[index].deadline);
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 18.0),
                                          child: TaskWidget(
                                            percent: (1 -
                                                    currentTasks[index]
                                                        .subtasks
                                                        .length)
                                                .toDouble(),
                                            titleTask: currentTasks[index].name,
                                            deadlineDate: DateFormat.yMEd()
                                                .format(DateTime.parse(
                                                    currentTasks[index]
                                                        .deadline))
                                                .toString(),
                                            urlImages: [],
                                          ),
                                        );
                                      },
                                    ),
                                  );
                          } else if (state is DoneTasksState) {
                            //DONE
                            currentTasks = state.finishedTasks;
                            return currentTasks.isEmpty
                                ? Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Lottie.asset(
                                              width: 150.w,
                                              height: 140.h,
                                              "assets/images/Animation - 1713100638764.json"),
                                          DefaultTextStyle(
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey,
                                              shadows: [
                                                Shadow(
                                                  blurRadius: 2.0,
                                                  color: Colors.grey,
                                                  offset: Offset(0, 0),
                                                ),
                                              ],
                                            ),
                                            child: Center(
                                              child: AnimatedTextKit(
                                                displayFullTextOnTap: true,
                                                isRepeatingAnimation: true,
                                                pause: const Duration(
                                                    milliseconds: 600),
                                                totalRepeatCount: 1,
                                                animatedTexts: [
                                                  TyperAnimatedText(
                                                      textAlign:
                                                          TextAlign.center,
                                                      'Empty task list! Time for a break or a new challenge? Add a task to get started!'),
                                                ],
                                              ),
                                            ),
                                          )
                                          // const Text(
                                          //   "Empty task list! Time for a break or a new challenge? Add a task to get started!",
                                          //   style: TextStyle(
                                          //     fontSize: 15,
                                          //     color: Colors.grey,
                                          //   ),
                                          //   textAlign: TextAlign.center,
                                          // )
                                        ],
                                      ),
                                    ),
                                  )
                                : Expanded(
                                    child: ListView.builder(
                                      itemCount: currentTasks.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 18.0),
                                          child: TaskWidget(
                                            percent: 1,
                                            titleTask: currentTasks[index].name,
                                            deadlineDate: DateFormat.yMEd()
                                                .format(DateTime.parse(
                                                    currentTasks[index]
                                                        .deadline))
                                                .toString(),
                                            urlImages: [],
                                          ),
                                        );
                                      },
                                    ),
                                  );
                          } else {
                            //EROR
                            return Text("ERROR");
                          }
                        },
                      ),
                    ],
                  ),
                )),
              ]));
        } else {
          // if (state is ProfileFailureState)
          //   BlocProvider.of<ProfileCubit>(context).getProfile();
          return Center(
            child: LoadingAnimationWidget.twistingDots(
                leftDotColor: kMainColor, rightDotColor: kLightblue, size: 30),
          );
        }
      },
    ));
  }
}
//  height: height * 0.04,
//             width: width * 0.25,