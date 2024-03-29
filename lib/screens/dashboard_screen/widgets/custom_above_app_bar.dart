import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../constants.dart';

class CustomAboveAppBar extends StatelessWidget {
  const CustomAboveAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Dashboard", style: TextStyle(fontSize: 16)),
        CircleAvatar(
          backgroundColor: kMainColor,
          child: Icon(Icons.person),
        ),
      ],
    );
  }
}
