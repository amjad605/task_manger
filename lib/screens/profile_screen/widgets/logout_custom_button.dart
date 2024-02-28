import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Constants/constants.dart';

class LogoutCustomButton extends StatelessWidget {
  const LogoutCustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 80.w),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          "Log out",
          style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontFamily: mainFont),
        ),
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)),
            backgroundColor: kRed,
            foregroundColor: kPriamaryColor,
            minimumSize: Size(40.w, 40.h),
            maximumSize: Size(40.w, 50.h)
        ),
      ),
    );
  }
}
