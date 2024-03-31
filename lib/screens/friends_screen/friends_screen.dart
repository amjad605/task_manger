import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manger/cubits/add_friend_cubit/add_friend_cubit.dart';
import 'package:task_manger/cubits/profile_cubit/profile_cubit.dart';
import 'package:task_manger/screens/add_friend_screen/add_friend_screen.dart';
import 'package:task_manger/screens/friends_screen/widgets/friend_item.dart';

import '../../Constants/constants.dart';
import '../../models/user_model.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User myUser = BlocProvider.of<ProfileCubit>(context).myUser;
    List<User> friends = myUser.friends;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Friends",
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: mainFont),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<AddFriendCubit, AddFriendState>(
        listener: (context, state) {
          myUser =BlocProvider.of<ProfileCubit>(context).myUser;
        },
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(
                height: 8.h,
              ),
              Expanded(
                child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => FriendItem(
                          friend: friends[index],
                        ),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 18.h,
                        ),
                    itemCount: myUser.friends.length),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddFriendScreen(),
                        ));
                  },
                  child: Text(
                    "Invite a friend",
                    style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontFamily: mainFont),
                  ),
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(300.w, 50.h),
                      backgroundColor: kLightblue),
                ),
              ),
              SizedBox(
                height: 18.h,
              )
            ],
          );
        },
      ),
    );
  }
}
