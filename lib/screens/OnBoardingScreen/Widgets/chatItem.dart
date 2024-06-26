import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:task_manger/Constants/constants.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: size.height * 0.06,
        left: size.width * 0.4,
        child: FadeInRight(
          from: 200,
          child: Container(
            padding: const EdgeInsets.all(10),
            width: size.width * 0.5,
            height: size.height * 0.06,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40), color: kPriamaryColor),
            child: Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue,
                        Color.fromARGB(255, 245, 98, 147),
                      ],
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: const CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      Icons.check,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: size.width * 0.23,
                      height: size.height * 0.01,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(40)),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      width: size.width * 0.13,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(40)),
                      height: size.height * 0.01,
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
