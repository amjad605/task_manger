import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manger/Constants/constants.dart';
import 'package:task_manger/cubits/text_visibility_cubit/text_visibility_cubit.dart';

class CustomProfileTextFormField extends StatelessWidget {
  CustomProfileTextFormField(
      {super.key,
      required this.fieldName,
      required this.controller,
      this.needObscure});
  bool? needObscure;
  String fieldName;
  TextEditingController controller;
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TextVisibilityCubit>(context)
        .SetVisibility(obscure: obscure);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldName,
          style: TextStyle(
              fontSize: 11.sp, color: Colors.white, fontFamily: mainFont),
        ),
        BlocConsumer<TextVisibilityCubit, TextVisibilityState>(
          listener: (context, state) {
            obscure = BlocProvider.of<TextVisibilityCubit>(context).obscure;
          },
          builder: (context, state) {
            return TextFormField(
              decoration: InputDecoration(
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: kMainColor,
                )),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: kLightblue)),
                suffixIcon: needObscure != null
                    ? IconButton(
                        icon: Icon(
                          obscure == true
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          BlocProvider.of<TextVisibilityCubit>(context)
                              .ChangeVisibility();
                        },
                      )
                    : const SizedBox(),
              ),
              cursorColor: kPriamaryColor,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: mainFont,
              ),
              controller: controller,
              validator: (value) {
                if (fieldName == "Your Email") {
                  if (!value!.contains("@") || !value.contains(".com")) {
                    return "Invalid Email";
                  }
                } else if (fieldName == "Your Name") {
                  if (value!.isEmpty) {
                    return "Name cannot be empty";
                  }
                } else if (fieldName == "Password") {
                  if (value!.isEmpty) {
                    return "password cannot be empty";
                  }
                }
                return null;
              },
              obscureText: needObscure != null ? obscure : false,
            );
          },
        ),
      ],
    );
  }
}
