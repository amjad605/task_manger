import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Constants/constants.dart';

class RequestItem extends StatelessWidget {
  const RequestItem({super.key});

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
              child: Image.asset("assets/images/Profile_pic.png"),
            ),
          ),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              Text(
                "Friends",
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
          IconButton(onPressed: (){}, icon: Icon(
              Icons.check_circle_outline,
              color: Colors.green,
            size: 25.r,
          ),
          ),
          IconButton(onPressed: (){}, icon: Icon(
            Icons.cancel_outlined,
            color: kRed,
            size: 25.r,
          ),
          ),
          SizedBox(width: 10.w,)
        ],
      ),
    );
  }
}
