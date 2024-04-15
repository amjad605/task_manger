import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
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
    // User myUser = BlocProvider.of<ProfileCubit>(context).myUser!;
    List<User> friends = [];
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
      body: Column(
         children: [
           Row(

           )
         ],
      )
    );
  }
}
