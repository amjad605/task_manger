
import 'package:flutter/material.dart';
import 'package:task_manger/Constants/constants.dart';

Widget DefaultButton(
        {required void Function() onPressed, required String text,required var width,required var height}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        color:kMainColor,
        onPressed: onPressed,
        
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 19, color: Colors.white),
        ),
      ),
    );