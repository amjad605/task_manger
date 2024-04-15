import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:task_manger/components/task_screen_components/show_toast.dart';
import 'package:task_manger/cubits/add_friend_cubit/add_friend_cubit.dart';

import '../../../Constants/constants.dart';
import '../../../models/user_model.dart';

class AddFriendItem extends StatelessWidget {
  AddFriendItem({Key? key, required this.user}) : super(key: key);
  Friend user;
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
              child: Image.asset("assets/images/Profile_pic.png"),
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
          const Expanded(child: SizedBox()),
          BlocConsumer<AddFriendCubit, AddFriendState>(
            listener: (context, state) {},
            builder: (context, state) {
              bool loading = state is AddFriendLoadingState;
              return IconButton(
                onPressed: () {
                  BlocProvider.of<AddFriendCubit>(context)
                      .addFriend(friend: user, context: context);
                },
                icon: loading
                    ? LoadingAnimationWidget.flickr(
                        leftDotColor: kMainColor,
                        rightDotColor: kLightblue,
                        size: 24)
                    : Icon(
                        Icons.add_circle,
                        size: 35.r,
                        color: kLightblue,
                      ),
                color: kLightblue,
              );
            },
          ),
        ],
      ),
    );
  }
}
