import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Constants/constants.dart';
import '../../../cubits/profile_editing_cubit/profile_editing_cubit.dart';

class ProfilePic extends StatelessWidget {
  ProfilePic({required this.img});
  File? img;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
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
          Positioned(
            bottom: 0,
            right: 0,
            child: IconButton(
                onPressed: () async {
                  BlocProvider.of<ProfileEditingCubit>(context).SelectPic();
                },
                icon: Icon(Icons.edit),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kLightblue,
                )),
          ),
        ],
      ),
    );
  }
}
