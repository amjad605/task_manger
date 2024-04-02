import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Constants/constants.dart';

class CustomProfileButtons extends StatelessWidget {
<<<<<<< HEAD
  const CustomProfileButtons(
      {super.key, required this.buttonName, required this.iconPath});
=======
  CustomProfileButtons(
      {super.key, required this.buttonName, required this.iconPath,required this.onPressed});
>>>>>>> 149809db1af84890665abaa9ba55bd61ae399475
  final String iconPath, buttonName;
  void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: kItemsBackgroundColor,
          foregroundColor: kPriamaryColor,
          minimumSize: Size(double.infinity, 50.h),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                height: 25.h,
                width: 25.w,
                child: Image.asset(
                  iconPath,
                  color: Colors.white,
                  fit: BoxFit.fill,
                )),
            SizedBox(
              width: 7.w,
            ),
            Text(
              buttonName,
              style: TextStyle(
                  color: Colors.white, fontSize: 16.sp, fontFamily: mainFont),
            ),
          ],
        ),
      ),
    );
  }
}
