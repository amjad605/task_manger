import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manger/models/user_model.dart';
import '../../../Constants/constants.dart';
import '../../../cubits/profile_cubit/profile_cubit.dart';


class ProfilePic extends StatelessWidget {
  ProfilePic({required this.img,required this.myUser});
  User myUser;
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
          Positioned(
            bottom: 0,
            right: 0,
            child: IconButton(
                onPressed: () async {
                  BlocProvider.of<ProfileCubit>(context).SelectPic();
                },
                icon: const Icon(Icons.edit),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kLightblue,
                )),
          ),
        ],
      ),
    );
  }
}
