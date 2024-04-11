import 'package:flutter/material.dart';
import 'package:task_manger/Constants/constants.dart';

Widget DefaultButton(
        {required void Function() onPressed,
        required Widget child,
        required var width,
        Color color = kMainColor,
        required var height}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          color: color,
          onPressed: onPressed,
          child: child),
    );
