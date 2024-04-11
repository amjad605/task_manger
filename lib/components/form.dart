import 'package:flutter/material.dart';
import 'package:task_manger/Constants/constants.dart';

Widget customTextFormField({
  required TextEditingController controller,
  final String? Function(String?)? validator,
  required String labelText,
  bool isPassword = false,
  IconData? suffixIcon,
  var width,
  void Function()? suffixPressed,
}) {
  return SizedBox(
    width: width,
    child: TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: const TextStyle(fontSize: 18, color: Colors.white),
      controller: controller,
      keyboardType: isPassword
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
      validator: validator,
      obscureText: isPassword,
      decoration: InputDecoration(
        label: Text(
          labelText.toUpperCase(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Colors.white,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        labelStyle: const TextStyle(color: Colors.grey),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(147, 255, 255, 255)),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        errorBorder:
            const UnderlineInputBorder(borderSide: BorderSide(color: kRed)),
        errorStyle: const TextStyle(color: kRed),
        suffixIcon: suffixIcon != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffixIcon,
                  size: 15,
                  color: const Color.fromARGB(141, 255, 255, 255),
                ),
              )
            : null,
      ),
    ),
  );
}
