import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manger/cubits/add_friend_cubit/add_friend_cubit.dart';
import 'package:task_manger/cubits/change_friends_body/change_friends_body_cubit.dart';
import 'package:task_manger/cubits/profile_cubit/profile_cubit.dart';
import 'package:task_manger/screens/add_friend_screen/add_friend_screen.dart';
import 'package:task_manger/screens/friends_screen/widgets/friend_item.dart';
import 'package:task_manger/screens/friends_screen/widgets/friends_view.dart';
import 'package:task_manger/screens/friends_screen/widgets/requests_view.dart';

import '../../Constants/constants.dart';
import '../../cubits/friends/friends_cubit.dart';
import '../../cubits/manage_friend_request/manage_friend_request_cubit.dart';
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
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: mainFont),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<ChangeFriendsBodyCubit, ChangeFriendsBodyState>(
          builder: (context, state) {
            if (state is RequestsViewState){
              BlocProvider.of<FriendsCubit>(context).getMyRequests();
            }
            else{
              BlocProvider.of<FriendsCubit>(context).getMyFriends();
            }
              return Column(
                children: [
                  SizedBox(height:10.h ,),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: (){
                            if (state is RequestsViewState) {
                              BlocProvider.of<ChangeFriendsBodyCubit>(context)
                                  .FriendsView();

                            }
                          },
                          child: Text(
                            "Friends",
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight:  FontWeight.w700,
                              decoration:
                              state is FriendsViewState ?
                              TextDecoration.underline
                                  : TextDecoration.none,
                              color: state is FriendsViewState ? kLightblue
                                  :null,
                              decorationColor:kLightblue
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            if (state is FriendsViewState) {
                              BlocProvider.of<ChangeFriendsBodyCubit>(context).RequestsView();

                            }

                          },
                          child: Text(
                            "Requests",
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                                decoration:
                                state is RequestsViewState ?
                                TextDecoration.underline
                                    : TextDecoration.none,
                                color: state is RequestsViewState ? kLightblue
                                    :null,
                                decorationColor:kLightblue
                            ),
                          ),
                        ),
                      ]
                  ),
                   SizedBox(height:15.h),
                   Expanded(
                      child: state is FriendsViewState?
                        FriendsView()
                          :RequestsView()
                  )

                ],
              );
            }
        )
    );
  }
}
