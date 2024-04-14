import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manger/Constants/constants.dart';

import '../../../models/user_model.dart';

class FriendItem extends StatelessWidget {
  FriendItem({Key? key, required this.friend}) : super(key: key);
  User friend;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      height: 80.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: kItemsBackgroundColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: kItemsBackgroundColor,
              blurRadius: 2,
              spreadRadius: 1,
            )
          ]),
      child: Row(
        children: [
          ClipOval(
            child: CircleAvatar(
              radius: 35.r,
              child: Image.asset(friend.image),
            ),
          ),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              Text(
                friend.name ?? "Friend",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontFamily: mainFont,
                ),
              ),
              Text(
                friend.email ?? "Friend",
                style: TextStyle(
                  color: kMainColor,
                  fontSize: 17.sp,
                  fontFamily: mainFont,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
