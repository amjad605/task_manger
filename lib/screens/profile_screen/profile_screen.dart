import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manger/Constants/constants.dart';
import 'package:task_manger/screens/friends_screen/friends_screen.dart';
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
          ProfileAppBar(),
          Expanded(
            child: ListView(
              children: [
                DisplayUserData(),
                SizedBox(
                  height: 15.h,
                ),
                CustomProfileButtons(
                  buttonName: "My Projects",
                  iconPath: "assets/icons/mangment.png",
                  onPressed: (){},
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomProfileButtons(
                  buttonName: "Join Team",
                  iconPath: "assets/icons/group.png",
                  onPressed: (){},
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomProfileButtons(
                  buttonName: "Share Profile",
                  iconPath: "assets/icons/share.png",
                  onPressed: (){},
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomProfileButtons(
                  buttonName: "All My Task",
                  iconPath: "assets/icons/check-mark.png",
                  onPressed: (){},
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomProfileButtons(
                  buttonName: "Friends",
                  iconPath: "assets/icons/friends.png",
                  onPressed: (){Navigator.push(context, MaterialPageRoute(
                    builder: (context) => FriendsScreen(),));},
                ),
                SizedBox(
                  height: 30.h,
                ),
                LogoutCustomButton(),
                SizedBox(
                  height: 35.h,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
