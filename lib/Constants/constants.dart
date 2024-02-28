import 'package:flutter/material.dart';
const kItemsBackgroundColor = Color.fromRGBO(32, 32, 36, 0.831);
const kBackgroundColor = Color(0xFF131416);
const kPriamaryColor = Color(0xFF272953);
const kMainColor = Color(0xFF555eab);
const kLightblue = Color(0xFF4db1e6);
const kRed = Color(0xFFe06954);
const tintBlack = Color(0xff1E2025);
const mainFont="poppins";

final passValid =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}');

final emailValid = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

final nameValid = RegExp(r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");