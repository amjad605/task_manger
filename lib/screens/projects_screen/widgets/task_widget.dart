import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:task_manger/Constants/constants.dart';
import 'package:task_manger/cubits/tasks/cubit.dart';
import 'package:task_manger/models/task_model.dart';
import 'package:task_manger/screens/add_task_screen/pages/add_sub_task.dart';
import 'package:task_manger/screens/add_task_screen/pages/add_task_screen.dart';
import 'package:task_manger/screens/add_task_screen/widgets/circle_transition.dart';
import 'package:task_manger/screens/edit_screen/edit_screen.dart';
import 'package:task_manger/screens/projects_screen/widgets/play_button.dart';
import 'package:task_manger/screens/task_details_screen/task_detail.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key, required this.task});
  final Data task;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final fabKey = GlobalKey();
    DateTime createdAtdate =
        DateTime.tryParse(task.createdAt!) ?? DateTime.now();
    DateTime deadLinedate = DateTime.tryParse(task.deadline!) ?? DateTime.now();
    String formattedCreatedAtdate = DateFormat('dd MMM').format(createdAtdate);
    String formattedDeadLinedate = DateFormat('dd MMM').format(deadLinedate);
    return InkWell(
      onTap: () {
        // Get the global position of the tap event
        final renderBox = context.findAncestorRenderObjectOfType<RenderBox>();
        if (renderBox != null) {
          final offset = renderBox.localToGlobal(
              Offset(renderBox.size.width, renderBox.size.height / 10));
          Navigator.of(context).push(_createRoute(offset));
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TaskDetailsScreen(
                  task: task,
                ),
              ));
        }
      },
      child: Stack(
        key: fabKey,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 3.0.h, horizontal: 6.w),
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            height: 182.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0.r),
              ),
              gradient: const LinearGradient(
                  colors: [kMainColor, Color.fromARGB(255, 130, 126, 245)]),
              boxShadow: const [
                BoxShadow(color: kMainColor, blurRadius: 7, spreadRadius: 1)
              ],
            ),
            child: Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 9.0.h, horizontal: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kBackgroundColor,
                            //    foregroundColor: Colors.black,
                          ),
                          child: Text(
                            task.priority ?? "low",
                            style:
                                TextStyle(fontSize: 9.sp, color: Colors.white),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          task.name ?? "null",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontFamily: mainFont,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          formattedCreatedAtdate,
                          style: TextStyle(
                              fontSize: 8.sp,
                              fontFamily: mainFont,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text("-"),
                        Text(
                          formattedDeadLinedate,
                          style: TextStyle(
                              fontSize: 8.sp,
                              fontFamily: mainFont,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(children: [
                      Text(
                        "assigned to:",
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: mainFont,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 2),
                      Text(
                        "${task.userId!.length}",
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: mainFont,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      CirclePlay(
                        taskId: task.sId!,
                        started: task.startedAt,
                        finshed: task.finishedAt,
                      )
                      //       ],
                      //     ))
                    ])
                  ],
                )),
          ),
          Positioned(
            top: height * 0.024,
            right: width * 0.075,
            child: Container(
              width: 100.w,
              height: 100.h,
              child: CircularMenu(
                  toggleButtonAnimatedIconData: AnimatedIcons.menu_close,
                  toggleButtonSize: 22,
                  toggleButtonPadding: 15,
                  toggleButtonMargin: 0,
                  curve: Curves.easeInOut,
                  alignment: Alignment.topRight,
                  radius: 70,
                  animationDuration: const Duration(milliseconds: 150),
                  toggleButtonColor: kBackgroundColor.withOpacity(0.6),
                  // toggleButtonIconColor: kBackgroundColor,
                  items: [
                    CircularMenuItem(
                      iconSize: 20,
                      margin: 1,
                      padding: 10,
                      onTap: () {
                        print(token);
                        BlocProvider.of<TasksCubit>(context)
                            .deleteTaskFromOutSide(id: task.sId);
                      },
                      icon: Icons.delete,
                      iconColor: kRed,
                    ),
                    CircularMenuItem(
                      iconSize: 20,
                      margin: 1,
                      padding: 10,
                      onTap: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    EditTaskScreen(
                              task: task,
                            ),
                            transitionDuration:
                                const Duration(milliseconds: 400),
                            reverseTransitionDuration:
                                const Duration(milliseconds: 400),
                            transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) =>
                                CircleTransition(
                              animation: animation,
                              startingPoint: Offset(width / 2, height / 2),
                              startingRadius: 56.0,
                              child: child,
                            ),
                          ),
                        );
                      },
                      icon: Icons.edit,
                    ),
                    CircularMenuItem(
                      iconSize: 20,
                      margin: 1,
                      padding: 10,
                      onTap: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    AddSubTaskScreen(
                              task: task,
                            ),
                            transitionDuration:
                                const Duration(milliseconds: 400),
                            reverseTransitionDuration:
                                const Duration(milliseconds: 400),
                            transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) =>
                                CircleTransition(
                              animation: animation,
                              startingPoint: Offset(width / 2, height / 2),
                              startingRadius: 56.0,
                              child: child,
                            ),
                          ),
                        );
                      },
                      icon: Icons.add,
                    ),
                  ]),
            ),
          )
        ],
      ),
    );
  }

  Route _createRoute(Offset offset) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 1000),
      pageBuilder: (context, animation, secondaryAnimation) =>
          TaskDetailsScreen(
        task: task,
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(offset.dx, offset.dy);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return CircleTransition(
          animation: animation,
          startingPoint: offset,
          startingRadius: 100,
          child: child,
        );
      },
    );
  }

//   Offset getOffset(GlobalKey key) {
//     final renderBox = (key.currentContext?.findRenderObject() as RenderBox);
//     final offset = renderBox.localToGlobal(
//         Offset(renderBox.size.width / 2, renderBox.size.height / 2));
//     return offset;
//   }
// }
}

Offset getOffsett(GlobalKey key) {
  RenderBox renderBox = key.currentContext!.findRenderObject()! as RenderBox;
  final offset = renderBox.localToGlobal(
      Offset(renderBox.size.width / 2, renderBox.size.height / 2));
  return offset;
}
