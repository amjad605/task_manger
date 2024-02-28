import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';
import 'package:task_manger/Constants/constants.dart';
import 'package:task_manger/components/form.dart';
Widget EmailTextFormField({
  required TextEditingController email,
  final String? Function(String?)? validate,
  var width,
 IconData? suffixIcon,
  void Function()? suffixPressed,

}) => customTextFormField(
      controller: email,
      suffixIcon:suffixIcon ,
      suffixPressed: suffixPressed,
      width: width,
      labelText: 'YOUR EMAIL',
      validator: validate
    );

    Widget NameTextFormField({
  required TextEditingController name,
  final String? Function(String?)? validate,
  var width,
 IconData? suffixIcon,
  void Function()? suffixPressed,

}) => customTextFormField(
      controller: name,
      suffixIcon:suffixIcon ,
      suffixPressed: suffixPressed,
      width: width,
      labelText: 'YOUR NAME',
      validator: validate
    );

Widget passwordTextFormField({
  required TextEditingController password,
  final String? Function(String?)? validate,
  var width,
  bool isPassword =false,
  IconData? suffixIcon,
  void Function()? suffixPressed,
}) =>
    customTextFormField(
      controller: password,
      validator: validate,
      labelText: 'YOUR PASSWORD',
      isPassword: isPassword,
      suffixIcon: suffixIcon,
      suffixPressed: suffixPressed,
      width: width
    );


Gradient backgroundStyle() => const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomCenter,
    colors: [Color.fromARGB(255, 19, 2, 45), kBackgroundColor]);
Widget backIcon({required Function() onPressed}) => Container(
    width: 40,
    height: 40,
    decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: const Color.fromARGB(129, 143, 145, 166),
        ),
        borderRadius: BorderRadius.circular(10.0)),
    child: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        )));
Widget hexagonalShape() => Stack(
      children: [
        Transform.translate(
          offset: const Offset(120, -100),
          child: HexagonWidget.pointy(
            width: 150,
            color: const Color.fromARGB(32, 106, 108, 127),
          ),
        ),
        Transform.translate(
          offset: const Offset(140, -40),
          child: HexagonWidget.pointy(
            width: 120,
            color: const Color.fromARGB(36, 106, 108, 127),
          ),
        )
      ],
    );
