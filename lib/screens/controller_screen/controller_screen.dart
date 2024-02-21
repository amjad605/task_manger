import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubits/change_screen_bottom_nav.dart';
import '../../../cubits/screens_states.dart';
import '../home_screen/home_screen.dart';
import '../profile_screen/profile_screen.dart';
import '../projects_screen/projects_screen.dart';
import '../tasks_screen/task_screen.dart';
import 'widgets/custom_bottom_nav_bar.dart';

class ControllerScreen extends StatelessWidget {
  const ControllerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the add task or project screen
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BlocBuilder<ChangeScreenBottomNav, ScreenState>(
        builder: (context, state) {
          //don't add const
          return CustomBottomNavigationBar();
        },
      ),
      body: PageView(
        controller:
            BlocProvider.of<ChangeScreenBottomNav>(context).pageController,
        onPageChanged: (index) {
          BlocProvider.of<ChangeScreenBottomNav>(context).switchScreen(index);
        },
        children: const [
          HomeScreen(),
          TasksScreen(),
          ProjectsScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }
}
