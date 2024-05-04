import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger/Constants/constants.dart';
import 'package:task_manger/cubits/tasks/cubit.dart';
import 'package:task_manger/cubits/tasks/states.dart';
import 'package:task_manger/models/task_model.dart';
import 'package:task_manger/screens/add_task_screen/pages/add_task_screen.dart';
import 'package:task_manger/screens/add_task_screen/widgets/circle_transition.dart';
import 'package:task_manger/screens/edit_screen/edit_screen.dart';
import 'package:task_manger/screens/task_details_screen/widgets/task_details_body.dart';
import 'package:task_manger/screens/tasks_screen/task_info.dart';
import 'package:task_manger/screens/tasks_screen/task_screen.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({super.key, required this.task});

  final Data task;

  @override
  Widget build(BuildContext context) {
    final fabKey = GlobalKey();

    return Scaffold(
        key: fabKey,
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(
          forceMaterialTransparency: true,
          backgroundColor: Colors.black,
        ),
        body: TaskDetailBody(
          task: task,
        ),
        floatingActionButton: BlocConsumer<TasksCubit, TasksState>(
          listener: (context, state) {
            if (state is DeleteTaskLoadingState) {
            } else if (state is DeleteTaskSuccessState) {
              Navigator.of(context).pop(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      TasksScreen(),
                  transitionDuration: const Duration(milliseconds: 400),
                  reverseTransitionDuration: const Duration(milliseconds: 400),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          CircleTransition(
                    animation: animation,
                    startingPoint: getOffset(fabKey),
                    startingRadius: 56.0,
                    child: child,
                  ),
                ),
              );
            }
            // TODO: implement listener
          },
          builder: (context, state) {
            TasksCubit tasksCubit = TasksCubit.get(context);
            return CircularMenu(
                curve: Curves.easeInOut,
                radius: 80,
                alignment: Alignment.bottomRight,
                animationDuration: Duration(milliseconds: 150),
                toggleButtonColor: kMainColor,
                // toggleButtonIconColor: kBackgroundColor,
                items: [
                  CircularMenuItem(
                    onTap: () {
                      print(token);
                      tasksCubit.deleteTask(id: task.sId);
                    },
                    icon: Icons.delete,
                    iconColor: kRed,
                  ),
                  CircularMenuItem(
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  EditTaskScreen(
                            task: task,
                          ),
                          transitionDuration: const Duration(milliseconds: 400),
                          reverseTransitionDuration:
                              const Duration(milliseconds: 400),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) =>
                                  CircleTransition(
                            animation: animation,
                            startingPoint: getOffset(fabKey),
                            startingRadius: 56.0,
                            child: child,
                          ),
                        ),
                      );
                    },
                    icon: Icons.edit,
                  ),
                  CircularMenuItem(
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const AddTaskScreen(),
                          transitionDuration: const Duration(milliseconds: 400),
                          reverseTransitionDuration:
                              const Duration(milliseconds: 400),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) =>
                                  CircleTransition(
                            animation: animation,
                            startingPoint: getOffset(fabKey),
                            startingRadius: 56.0,
                            child: child,
                          ),
                        ),
                      );
                    },
                    icon: Icons.add,
                  ),
                ]);
          },
        ));
  }

  Offset getOffset(GlobalKey key) {
    final renderBox = (key.currentContext?.findRenderObject() as RenderBox);
    final offset = renderBox
        .localToGlobal(Offset(renderBox.size.width, renderBox.size.height));
    return offset;
  }
}
