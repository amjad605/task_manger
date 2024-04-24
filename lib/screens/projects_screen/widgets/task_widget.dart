import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:task_manger/models/task_model.dart';
import 'package:task_manger/screens/projects_screen/widgets/play_button.dart';
import 'package:task_manger/screens/tasks_screen/task_info.dart';

import '../../../Constants/constants.dart';
import '../../add_task_screen/widgets/circle_transition.dart';
import '../../task_details_screen/task_detail.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key, required this.task});
  final Data task;

  @override
  Widget build(BuildContext context) {
    DateTime createdAtdate = DateTime.parse(task.createdAt!);
    DateTime deadLinedate = DateTime.parse(task.deadline!);
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
      child: Container(
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
            padding: EdgeInsets.symmetric(vertical: 9.0.h, horizontal: 10.h),
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
                        style: TextStyle(fontSize: 9.sp, color: Colors.white),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: kBackgroundColor),
                      child: IconButton(
                        icon: const Icon(
                          Icons.more_vert_outlined,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
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
                Padding(
                  padding: EdgeInsets.only(left: 8.0.w),
                  child: Row(children: [
                    for (int i = 0; i < 3; i++)
                      Align(
                          widthFactor: 1 / 3,
                          child: CircleAvatar(
                            radius: 12.r,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 10.r,
                              backgroundImage: const AssetImage(
                                "assets/images/Person_1.png",
                              ),
                            ),
                          )),
                    const Spacer(),
                    const CirclePlay()
                    //       ],
                    //     ))
                  ]),
                )
              ],
            )),
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

  Offset getOffset(GlobalKey key) {
    final renderBox = (key.currentContext?.findRenderObject() as RenderBox);
    final offset = renderBox.localToGlobal(
        Offset(renderBox.size.width / 2, renderBox.size.height / 2));
    return offset;
  }
}
