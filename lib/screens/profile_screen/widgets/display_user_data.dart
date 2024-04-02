import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Constants/constants.dart';
import '../../../cubits/profile_editing_cubit/profile_editing_cubit.dart';

class DisplayUserData extends StatelessWidget {
  const DisplayUserData({super.key});

  @override
  Widget build(BuildContext context) {
    String name = BlocProvider.of<ProfileEditingCubit>(context).name,
        mail = BlocProvider.of<ProfileEditingCubit>(context).mail;
    File? img = BlocProvider.of<ProfileEditingCubit>(context).img;
    return BlocConsumer<ProfileEditingCubit, ProfileEditingState>(
      listener: (context, state) {
        if (state is ProfileEditingSuccess) {
          mail = BlocProvider.of<ProfileEditingCubit>(context).mail;
          name = BlocProvider.of<ProfileEditingCubit>(context).name;
          img = BlocProvider.of<ProfileEditingCubit>(context).img;
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            CircleAvatar(
              radius: 60.0.r, // Set your desired radius
              child: img == null
                  ? ClipOval(
                      child: Image.asset(
                        "assets/images/Profile_pic.png",
                      ),
                    )
                  : ClipOval(
                      child: SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                      child: Image.file(
                        img!,
                        fit: BoxFit.fill,
                      ),
                    )),
            ),
            SizedBox(height: 12.h),
            Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.sp,
                fontFamily: mainFont,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              mail,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                fontFamily: mainFont,
                fontWeight: FontWeight.w400,
                color: kLightblue,
              ),
            ),
          ],
        );
      },
    );
  }
}
