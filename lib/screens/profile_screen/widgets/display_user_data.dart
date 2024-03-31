import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Constants/constants.dart';
import '../../../cubits/profile_cubit/profile_cubit.dart';
import '../../../models/user_model.dart';


class DisplayUserData extends StatelessWidget {
  const DisplayUserData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User myUser= BlocProvider.of<ProfileCubit>(context).myUser;
    File? img = BlocProvider.of<ProfileCubit>(context).img;
    return BlocConsumer<ProfileCubit, ProfileEditingState>(
      listener: (context, state) {
        if (state is ProfileEditingSuccess) {
          myUser= BlocProvider.of<ProfileCubit>(context).myUser;
          img = BlocProvider.of<ProfileCubit>(context).img;
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
                        myUser.imgAsset,
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
              myUser.name,
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
              myUser.email,
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
