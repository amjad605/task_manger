import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manger/screens/edit_profile_screen/edit_profile_screen.dart';

import '../../../Constants/constants.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      toolbarHeight: 38,
      leading: SizedBox(),
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
          child: Text(
            "Edit",
            style: TextStyle(
              color: Colors.white,
              fontFamily: mainFont,
              fontWeight: FontWeight.w600,
            ),
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: kItemsBackgroundColor,
              foregroundColor: kPriamaryColor,
              shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                  side: BorderSide(color: kLightblue)
              ),
            minimumSize: Size(20, 40)
          ),
        ),
        SizedBox(width: 12.w)
      ],
      centerTitle: true,
      backgroundColor: Colors.transparent,
    );
  }
}
