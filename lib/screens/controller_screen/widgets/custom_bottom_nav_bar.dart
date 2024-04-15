import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger/Constants/constants.dart';
import 'package:task_manger/cubits/nav_bottom_bar/screens_states.dart';
import '../../../cubits/nav_bottom_bar/change_screen_bottom_nav.dart';
import 'custom_nav_button.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeScreenBottomNav, ScreenState>(
      builder: (context, state) {
        return BottomAppBar(
          clipBehavior: Clip.hardEdge,
          notchMargin: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CustomNavButton(
                    imagenotSelectedPath: "assets/icons/home.png",
                    isSelected:
                        BlocProvider.of<ChangeScreenBottomNav>(context).index ==
                            0,
                    title: "Home",
                    onPressed: () {
                      BlocProvider.of<ChangeScreenBottomNav>(context)
                          .setCurrentIndexTab(0);
                    },
                    imageSelected: "assets/icons/home_filled.png",
                  ),
                  CustomNavButton(
                    imagenotSelectedPath: "assets/icons/tasks.png",
                    isSelected:
                        BlocProvider.of<ChangeScreenBottomNav>(context).index ==
                            1,
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
                    imagenotSelectedPath: "assets/icons/projects.png",
                    isSelected:
                        BlocProvider.of<ChangeScreenBottomNav>(context).index ==
                            2,
                    title: "Projects",
                    onPressed: () {
                      BlocProvider.of<ChangeScreenBottomNav>(context)
                          .setCurrentIndexTab(2);
                    },
                  ),
                  CustomNavButton(
                    imagenotSelectedPath: "assets/icons/profile.png",
                    isSelected:
                        BlocProvider.of<ChangeScreenBottomNav>(context).index ==
                            3,
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
      },
    );
  }
}
