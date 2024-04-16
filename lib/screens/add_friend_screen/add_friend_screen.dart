import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:task_manger/Constants/constants.dart';
import 'package:task_manger/cubits/profile_cubit/profile_cubit.dart';
import 'package:task_manger/cubits/search_friend/search_friend_cubit.dart';
import 'package:task_manger/models/user_model.dart';
import 'package:task_manger/screens/add_friend_screen/widgets/add_friend_item.dart';
import '../../cubits/add_friend_cubit/add_friend_cubit.dart';
import '../friends_screen/widgets/friend_item.dart';

class AddFriendScreen extends StatelessWidget {
  AddFriendScreen({Key? key}) : super(key: key);
  List<Friend> friends = [];
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Add Friend",
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: mainFont),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<SearchFriendCubit, SearchFriendState>(
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(height: 10.h),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                height: 60.h,
                decoration: BoxDecoration(
                  color: kItemsBackgroundColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: TextFormField(
                    onChanged: (value) {
                      //  user!.name = controller.text;
                      BlocProvider.of<SearchFriendCubit>(context).Searching(value);
                    },
                    controller: controller,
                    cursorColor: kPriamaryColor,
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontFamily: mainFont),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.transparent,
                      )),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: kPriamaryColor)),
                      label: Text(
                        "Search",
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.white,
                            fontFamily: mainFont),
                      ),
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              BlocBuilder<SearchFriendCubit, SearchFriendState>(
                builder: (context, state) {
                  if (state is SearchingLoadingState) {
                    return Expanded(
                      child: Center(
                        child: LoadingAnimationWidget.twistingDots(
                            leftDotColor: kMainColor,
                            rightDotColor: kLightblue,
                            size: 30),
                      ),
                    );
                  }
                  if (state is SearchingSucsessState) {
                    return Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            friends = state.friend;
                            return AddFriendItem(user: state.friend[index]);
                          },
                          separatorBuilder: (context, index) => SizedBox(
                                height: 18.h,
                              ),
                          itemCount: state.friend.length),
                    );
                  } else {
                    if (friends.length == 0) {
                      return SizedBox();
                    } else {
                      return Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              friends = friends;
                              return AddFriendItem(user: friends[index]);
                            },
                            separatorBuilder: (context, index) => SizedBox(
                                  height: 18.h,
                                ),
                            itemCount: friends.length),
                      );
                    }
                  }
                },
              )
            ],
          );
        },
      ),
    );
  }
}
