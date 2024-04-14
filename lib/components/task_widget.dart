import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:task_manger/screens/add_task_screen/widgets/circle_transition.dart';
import 'package:task_manger/screens/task_details_screen/task_detail.dart';

import '../Constants/constants.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget(
      {super.key,
      required this.percent,
      required this.titleTask,
      required this.deadlineDate,
      required this.urlImages});
  final double percent;
  final String titleTask, deadlineDate;
  final List<String> urlImages;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Get the global position of the tap event
        final renderBox = (context.findRenderObject() as RenderBox);
        final offset = renderBox
            .localToGlobal(Offset(renderBox.size.width, renderBox.size.height));

        Navigator.of(context).push(_createRoute(offset));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //CircularPrecentage
            percent == -1
                ? IconButton(
                    onPressed: () {}, icon: const Icon(Icons.play_arrow))
                : Expanded(
                    flex: 2,
                    child: CircularPercentIndicator(
                      animation: true,
                      rotateLinearGradient: false,
                      backgroundColor: kMainColor.withOpacity(0.3),
                      radius: 35,
                      lineWidth: 3,
                      percent: percent,
                      progressColor: kLightblue,
                      center: Text("${((percent) * 100).toInt()}%"),
                    ),
                  ),

            const SizedBox(width: 15),
            //Texts of tasks
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titleTask,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Deadline:$deadlineDate",
                    style: const TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ),
            //  friends
            Expanded(
              flex: 2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (int i = 0; i < urlImages.length; i++)
                    Align(
                      widthFactor: 1 / urlImages.length,
                      child: CircleAvatar(
                        radius: 21,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage(
                            urlImages[i],
                          ),
                        ),
                      ),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
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

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

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
