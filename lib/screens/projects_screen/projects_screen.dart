import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:task_manger/Constants/constants.dart';
import 'package:task_manger/cubits/tasks/states.dart';
import 'package:task_manger/models/task_model.dart';
import 'package:task_manger/screens/projects_screen/widgets/play_button.dart';
import 'package:task_manger/screens/projects_screen/widgets/task_widget.dart';
import 'package:task_manger/screens/task_details_screen/task_detail.dart';

import '../../cubits/tasks/cubit.dart';
import '../add_task_screen/widgets/circle_transition.dart';
import '../tasks_screen/task_info.dart';

class ProjectsScreen extends StatelessWidget {
  ProjectsScreen({super.key});
  List<Data> tasks = [];
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    TasksCubit tasksCubit = TasksCubit.get(context);
    tasksCubit.getAllTasks();
    Future<void> handleRefresh() async {
      tasksCubit.getAllTasks();
    }

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocConsumer<TasksCubit, TasksState>(
      listener: (context, state) {
        if (state is GetAllTaskSuccessState) {
          tasks = tasksCubit.tasks.data!;
          loading = false;
        } else if (state is GetAllTaskLoadingState) {
          loading = true;
        } else if (state is GetAllTaskFailureState) {
          loading = false;
        }
      },
      builder: (context, state) {
        if (state is GetAllTaskLoadingState) {
          return Center(
            child: LoadingAnimationWidget.twistingDots(
                leftDotColor: kMainColor, rightDotColor: kLightblue, size: 30),
          );
        }
        if (tasks.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset("assets/images/Animation - 1713100638764.json"),
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
                        pause: const Duration(milliseconds: 600),
                        totalRepeatCount: 1,
                        animatedTexts: [
                          TyperAnimatedText(
                              textAlign: TextAlign.center,
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
          );
        } else {
          tasks.removeWhere((element) {
            return DateTime.parse(element.deadline!) ==
                DateTime.parse(element.startedAt ?? DateTime.now().toString());
          });
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: Text(
                "Tasks",
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: RefreshIndicator.adaptive(
              onRefresh: handleRefresh,
              child: SafeArea(
                child: ModalProgressHUD(
                  inAsyncCall: loading,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Expanded(
                        child: ListView.separated(
                          itemCount: tasks.length,
                          itemBuilder: (context, index) {
                            final task = tasks[index];

                            return FadeInLeft(
                                duration: Duration(milliseconds: 400),
                                delay: Duration(
                                    milliseconds: (index + 1) * 2 * 10),
                                child: TaskWidget(task: task));
                          },
                          separatorBuilder: (context, index) => SizedBox(
                            height: 8,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
