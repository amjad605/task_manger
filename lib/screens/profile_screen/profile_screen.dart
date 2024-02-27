import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manger/cubits/profile_editing_cubit/profile_editing_cubit.dart';
import 'package:task_manger/screens/profile_screen/widgets/custom_profile_buttons.dart';
import 'package:task_manger/screens/profile_screen/widgets/display_user_data.dart';
import 'package:task_manger/screens/profile_screen/widgets/logout_custom_button.dart';
import 'package:task_manger/screens/profile_screen/widgets/profile_appbar.dart';

import '../../Constants/constants.dart';

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
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomProfileButtons(
                  buttonName: "Join Team",
                  iconPath: "assets/icons/group.png",
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomProfileButtons(
                  buttonName: "Share Profile",
                  iconPath: "assets/icons/share.png",
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomProfileButtons(
                  buttonName: "All My Task",
                  iconPath: "assets/icons/check-mark.png",
                ),
                SizedBox(
                  height: 30.h,
                ),
                LogoutCustomButton(),
                SizedBox(
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
