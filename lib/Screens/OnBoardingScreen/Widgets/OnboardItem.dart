import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:task_manger/screens/OnBoardingScreen/model/onboarding_model.dart';

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
                    "assets/images/HD-wallpaper-black-space-black-star-stars.jpg"),
              )
            : null,
      ),
      child: Column(
        children: [
          ShakeY(
            infinite: true,
            from: 3,
            delay: const Duration(milliseconds: 0),
            duration: const Duration(seconds: 5),
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
                    style: const TextStyle(
                        fontSize: 45, fontWeight: FontWeight.bold),
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
