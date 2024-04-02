import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manger/screens/edit_profile_screen/edit_profile_screen.dart';

import '../../../Constants/constants.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      toolbarHeight: 38,
      leading: const SizedBox(),
      title: Text(
        "Profile",
        style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: mainFont
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfileScreen(),));
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: kItemsBackgroundColor,
              foregroundColor: kPriamaryColor,
              shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                  side: const BorderSide(color: kLightblue)
              ),
            minimumSize: const Size(20, 40)
          ),
          child: const Text(
            "Edit",
            style: TextStyle(
              color: Colors.white,
              fontFamily: mainFont,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(width: 12.w)
      ],
      centerTitle: true,
      backgroundColor: Colors.transparent,
    );
  }
}
