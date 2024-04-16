import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:task_manger/cubits/add_friend_cubit/add_friend_cubit.dart';
import 'package:task_manger/cubits/manage_friend_request/manage_friend_request_cubit.dart';

import '../../../Constants/constants.dart';
import '../../../models/user_model.dart';

class RequestItem extends StatelessWidget {
  RequestItem({super.key, required this.request});

  Request request;
  bool loading = false;
  bool accepted = false;
  bool rejected = false;
  String response = "";
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
      child: BlocConsumer<ManageFriendRequestCubit, ManageFriendRequestState>(
        listener: (context, state) {
          if (state is AcceptRequestsSuccessState) {
            loading = false;
          } else if (state is AcceptRequestsFailureState) {
            accepted =false ;
            rejected =false;
            loading = false;
          } else if (state is AcceptRequestsLoadingState) {
          } else if (state is RejectRequestsSuccessState) {
            loading = false;
          }
        },
        builder: (context, state) {
          return Row(
            children: [
              ClipOval(
                child: CircleAvatar(
                  radius: 35.r,
                  child: Image.asset("assets/images/Profile_pic.png"),
                ),
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  Text(
                    request.sender!.name!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontFamily: mainFont,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Spacer(),
              loading == true
                  ? Center(
                      child: LoadingAnimationWidget.flickr(
                          leftDotColor: kMainColor,
                          rightDotColor: kLightblue,
                          size: 24))
                  : accepted || rejected
                      ? Row(
                          children: [
                            Text(
                              response,
                              style: TextStyle(
                                  color: accepted ? Colors.green : kRed,
                                  fontSize: 15.sp),
                            ),
                          ],
                        )
                      : Container(
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  accepted = true;
                                  response = "Accepted";
                                  loading = true;
                                  BlocProvider.of<ManageFriendRequestCubit>(
                                          context)
                                      .acceptRequest(request.sender!.id!);
                                },
                                icon: Icon(
                                  Icons.check_circle_outline,
                                  color: Colors.green,
                                  size: 25.r,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  rejected = true;
                                  response = "Rejected";
                                  loading = true;
                                  BlocProvider.of<ManageFriendRequestCubit>(
                                          context)
                                      .rejectRequest(request.sender!.id!);
                                },
                                icon: Icon(
                                  Icons.cancel_outlined,
                                  color: kRed,
                                  size: 25.r,
                                ),
                              ),
                            ],
                          ),
                        ),
              SizedBox(
                width: 10.w,
              )
            ],
          );
        },
      ),
    );
  }
}
