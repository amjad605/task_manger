import 'package:flutter/material.dart';

class CustomNavButton extends StatelessWidget {
  const CustomNavButton({
    super.key,
    required this.imagenotSelectedPath,
    required this.isSelected,
    required this.title,
    this.imageSelected,
    required this.onPressed,
  });
  final String imagenotSelectedPath, title;
  final String? imageSelected;
  final bool isSelected;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 40,
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            isSelected
                ? imageSelected ?? imagenotSelectedPath
                : imagenotSelectedPath,
            color: isSelected ? const Color(0xff555eab) : Colors.grey,
            height: 25,
          ),
          Text(
            title,
            style: TextStyle(
              color: isSelected ? const Color(0xff555eab) : Colors.grey,
              fontSize: 12,
              fontFamily: "poppins",
            ),
          ),
        ],
      ),
    );
  }
}
