import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manger/cubits/add_friend_cubit/add_friend_cubit.dart';

import '../../../Constants/constants.dart';
import '../../../models/user_model.dart';

class AddFriendItem extends StatelessWidget {
  AddFriendItem({Key? key, required this.user}) : super(key: key);
  User user;
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipOval(
            child: CircleAvatar(
              radius: 35.r,
              child: Image.asset(user.image),
            ),
          ),
          SizedBox(width: 10.w),
          Text(
            user.name ?? "Geust",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontFamily: mainFont,
            ),
          ),
          Expanded(child: SizedBox()),
          IconButton(
            onPressed: () {
              BlocProvider.of<AddFriendCubit>(context)
                  .addFriend(friend: user, context: context);
            },
            icon: Icon(
              Icons.add_circle,
              size: 35.r,
              color: kLightblue,
            ),
            color: kLightblue,
          ),
        ],
      ),
    );
  }
}
