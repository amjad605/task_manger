import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manger/Constants/constants.dart';
import 'package:task_manger/screens/profile_screen/widgets/custom_profile_buttons.dart';
import 'package:task_manger/screens/profile_screen/widgets/display_user_data.dart';
import 'package:task_manger/screens/profile_screen/widgets/logout_custom_button.dart';
import 'package:task_manger/screens/profile_screen/widgets/profile_appbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      child: Column(
        children: [
          SizedBox(
            height: 5.h,
          ),
          const ProfileAppBar(),
          Expanded(
            child: ListView(
              children: [
                const DisplayUserData(),
                SizedBox(
                  height: 15.h,
                ),
                const CustomProfileButtons(
                  buttonName: "My Projects",
                  iconPath: "assets/icons/mangment.png",
                ),
                SizedBox(
                  height: 15.h,
                ),
                const CustomProfileButtons(
                  buttonName: "Join Team",
                  iconPath: "assets/icons/group.png",
                ),
                SizedBox(
                  height: 15.h,
                ),
                const CustomProfileButtons(
                  buttonName: "Share Profile",
                  iconPath: "assets/icons/share.png",
                ),
                SizedBox(
                  height: 15.h,
                ),
                const CustomProfileButtons(
                  buttonName: "All My Task",
                  iconPath: "assets/icons/check-mark.png",
                ),
                SizedBox(
                  height: 30.h,
                ),
                const LogoutCustomButton(),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
