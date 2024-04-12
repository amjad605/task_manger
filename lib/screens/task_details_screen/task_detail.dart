import 'package:flutter/material.dart';
import 'package:task_manger/screens/add_task_screen/pages/add_task_screen.dart';
import 'package:task_manger/screens/add_task_screen/widgets/circle_transition.dart';
import 'package:task_manger/screens/task_details_screen/widgets/task_details_body.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({super.key});

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
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.menu))],
      ),
      body: TaskDetailBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const AddTaskScreen(),
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
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Offset getOffset(GlobalKey key) {
    final renderBox = (key.currentContext?.findRenderObject() as RenderBox);
    final offset = renderBox
        .localToGlobal(Offset(renderBox.size.width, renderBox.size.height));
    return offset;
  }
}
