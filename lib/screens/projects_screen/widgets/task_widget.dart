import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manger/models/task_model.dart';
import 'package:task_manger/screens/projects_screen/widgets/play_button.dart';

import '../../../Constants/constants.dart';
import '../../add_task_screen/widgets/circle_transition.dart';
import '../../task_details_screen/task_detail.dart';

class TaskWidget extends StatelessWidget {
  TaskWidget({super.key, required this.task});
  Data task;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
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
                builder: (context) => TaskDetailsScreen(),
              ));
        }
      },
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 3.0.h, horizontal: 6.w),
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          height: 80.h,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0.r),
              ),
              color: kItemsBackgroundColor),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CirclePlay(height: screenHeight, width: screenWidth),
              SizedBox(width: 10.w),
              Text(
                task.name!,
                style: TextStyle(
                  fontSize: 22.sp,
                  fontFamily: mainFont,
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    for (int i = 0; i < 3; i++)
                      Align(
                        widthFactor: 1 / 3,
                        child: CircleAvatar(
                          radius: 20.r,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 20.r,
                            backgroundImage: AssetImage(
                              "assets/images/Person_1.png",
                            ),
                          ),
                        ),
                      ),
                    SizedBox(width: 15.w)
                  ],
                ),
              ),
            ],
          )),
    );
  }

  Route _createRoute(Offset offset) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 1000),
      pageBuilder: (context, animation, secondaryAnimation) =>
          const TaskDetailsScreen(),
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
