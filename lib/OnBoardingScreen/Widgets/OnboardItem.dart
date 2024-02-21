import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:task_manger/OnBoardingScreen/model/onboarding_model.dart';

class OnboardItem extends StatelessWidget {
  const OnboardItem({
    required this.model,
    super.key,
  });
  final OnboardModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: model.bgColor,
        image: model.text[0] == "W"
            ? const DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                    "/Users/amjadayman/StudioProjects/task_manger/assets/images/photo-1590272456521-1bbe160a18ce.webp"),
              )
            : null,
      ),
      child: Column(
        children: [
          ShakeY(
            infinite: true,
            from: 3,
            delay: const Duration(milliseconds: 100),
            duration: const Duration(seconds: 6),
            child: Image.asset(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.5,
              model.image,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 20),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    model.text,
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.1,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
