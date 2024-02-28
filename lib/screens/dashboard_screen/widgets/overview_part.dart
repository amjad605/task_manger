import 'package:flutter/material.dart';

import 'custom_text_image.dart';

class OverviewPart extends StatelessWidget {
  const OverviewPart({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomContainerWithTextImage(
          count: "16",
          image: 'assets/icons/total_tasks.png',
          text: "Total Tasks",
        ),
        SizedBox(height: 15),
        CustomContainerWithTextImage(
          count: "32",
          image: "assets/icons/completed_tasks.png",
          text: "Completed Tasks",
        ),
        SizedBox(height: 15),
        CustomContainerWithTextImage(
          count: "16",
          image: "assets/icons/total_tasks.png",
          text: "Total Projects",
        ),
      ],
    );
  }
}
