import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manger/Constants/constants.dart';
import 'package:task_manger/cubits/profile_editing_cubit/profile_editing_cubit.dart';

class CustomProfileTextFormField extends StatelessWidget {
  CustomProfileTextFormField(
      {Key? key, required this.fieldName, required this.controller}) : super(key: key);
  String fieldName;
  TextEditingController controller;
  String? data;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldName,
          style: TextStyle(
              fontSize: 11.sp, color: Colors.white, fontFamily: mainFont),
        ),
        TextFormField(
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: kMainColor,
            )),
            focusedBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: kLightblue)),
          ),
          cursorColor: kPriamaryColor,
          style: TextStyle(
            color: Colors.white,
            fontFamily: mainFont,
          ),
          controller: controller,
          validator: (value) {
            if (fieldName == "Your Email") {
              if (!value!.contains("@") || !value!.contains(".com")) {
                return "Invalid mail";
              }
            } else if (fieldName == "Your Name") {
              if (value!.isEmpty) {
                return "Name cant be empty";
              }
            } else if (fieldName == "Password") {
              if (value!.isEmpty) {
                return "password cant be empty";
              }
            }
          },
        ),
      ],
    );
  }
}
