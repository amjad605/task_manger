import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProfileTextFormField extends StatelessWidget {
 CustomProfileTextFormField({Key? key,required this.fieldName}) : super(key: key);
 String fieldName;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          fieldName,
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.white,

          ),
        ),
      ],
    );
  }
}
