import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger/screens/task_details_screen/task_detail.dart';
import '../../cubits/nav_bottom_bar/change_screen_bottom_nav.dart';
import '../../cubits/nav_bottom_bar/screens_states.dart';
import '../add_task_screen/pages/add_task_screen.dart';
import '../add_task_screen/widgets/circle_transition.dart';
import '../dashboard_screen/dashboard_screen.dart';
import '../profile_screen/profile_screen.dart';
import '../projects_screen/projects_screen.dart';
import '../tasks_screen/task_screen.dart';
import 'widgets/custom_bottom_nav_bar.dart';

class ControllerScreen extends StatelessWidget {
  const ControllerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fabKey = GlobalKey();
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        key: fabKey,
        onPressed: () {
          // Navigate to the add task or project screen
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
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: PageView(
        controller:
            BlocProvider.of<ChangeScreenBottomNav>(context).pageController,
        onPageChanged: (index) {
          BlocProvider.of<ChangeScreenBottomNav>(context).switchScreen(index);
        },
        children: [
          TasksScreen(),
          ProjectsScreen(),
          const DashboardScreen(),
          const ProfileScreen(),
        ],
      ),
    );
  }

  Offset getOffset(GlobalKey key) {
    final renderBox = (key.currentContext?.findRenderObject() as RenderBox);
    final offset = renderBox.localToGlobal(
        Offset(renderBox.size.width / 2, renderBox.size.height / 2));
    return offset;
  }
}
