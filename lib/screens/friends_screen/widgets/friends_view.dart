import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:task_manger/cubits/friends/friends_cubit.dart';

import '../../../Constants/constants.dart';
import '../../../cubits/add_friend_cubit/add_friend_cubit.dart';
import '../../add_friend_screen/add_friend_screen.dart';
import 'friend_item.dart';

class FriendsView extends StatelessWidget {
  const FriendsView({super.key});

  @override
  Widget build(BuildContext context) {;
    return BlocConsumer<FriendsCubit, FriendsState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GetMyFriendsLoadingState) {

          return Center(
            child: LoadingAnimationWidget.flickr(
                leftDotColor: kMainColor,
                rightDotColor: kLightblue,
                size: 24),
          );
        } else {
          return Column(
            children: [
              SizedBox(
                height: 8.h,
              ),
              if (state is GetMyFriendsSuccessState)
                Expanded(
                  child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) => FriendItem(
                        friend: state.Friends[index],
                      ),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 18.h,
                      ),
                      itemCount: state.Friends.length),
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
        }
      },
    );
  }
}
