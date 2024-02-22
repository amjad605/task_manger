import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../cubits/change_screen_bottom_nav.dart';
import 'custom_nav_button.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      clipBehavior: Clip.hardEdge,
      // notchMargin: 6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CustomNavButton(
                imagenotSelectedPath: "Assets/icons/home.png",
                isSelected:
                    BlocProvider.of<ChangeScreenBottomNav>(context).index == 0,
                title: "Home",
                onPressed: () {
                  BlocProvider.of<ChangeScreenBottomNav>(context)
                      .setCurrentIndexTab(0);
                },
                imageSelected: "Assets/icons/home_filled.png",
              ),
              CustomNavButton(
                imagenotSelectedPath: "Assets/icons/tasks.png",
                isSelected:
                    BlocProvider.of<ChangeScreenBottomNav>(context).index == 1,
                title: "Tasks",
                onPressed: () {
                  BlocProvider.of<ChangeScreenBottomNav>(context)
                      .setCurrentIndexTab(1);
                },
              ),
            ],
          ),
          Row(
            children: [
              CustomNavButton(
                imagenotSelectedPath: "Assets/icons/projects.png",
                isSelected:
                    BlocProvider.of<ChangeScreenBottomNav>(context).index == 2,
                title: "Projects",
                onPressed: () {
                  BlocProvider.of<ChangeScreenBottomNav>(context)
                      .setCurrentIndexTab(2);
                },
              ),
              CustomNavButton(
                imagenotSelectedPath: "Assets/icons/profile.png",
                isSelected:
                    BlocProvider.of<ChangeScreenBottomNav>(context).index == 3,
                title: "Profile",
                onPressed: () {
                  BlocProvider.of<ChangeScreenBottomNav>(context)
                      .setCurrentIndexTab(3);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
