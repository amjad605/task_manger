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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocConsumer<TasksCubit, TasksState>(
      listener: (context, state) {
        if (state is DeleteTaskSuccessState) {
          tasks = tasksCubit.tasks.data!;
          loading = false;
        } else if (state is DeleteTaskLoadingState) {
          loading = true;
        } else if (state is DeleteTaskFailureState) {
          loading = false;
        }
      },
      builder: (context, state) {
        if (state is DeleteTaskLoadingState) {
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
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset("assets/images/Animation - 1713100638764.json"),
                  const Text(
                    "Empty task list! Time for a break or a new challenge? Add a task to get started!",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          );
        }
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
          body: SafeArea(
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
                    child: ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        final task = tasks[index];
                        return TaskWidget(task: task);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
