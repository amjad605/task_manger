import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Constants/constants.dart';

class CustomProfileButtons extends StatelessWidget {
  const CustomProfileButtons({Key? key,required this.buttonName,required this.iconPath}) : super(key: key);
 final String iconPath,buttonName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.w),
      child: ElevatedButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 25.h,
                width: 25.w,
                child: Image.asset(iconPath,
                  color: Colors.white,
                  fit: BoxFit.fill,
                )
            ),
            SizedBox(
              width: 7.w,
            ),
            Text(
              buttonName,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                fontFamily: mainFont
              ),
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: kItemsBackgroundColor,
          foregroundColor: kPriamaryColor,
          minimumSize: Size(double.infinity, 50.h),
        ),
      ),

    );
  }
}
