import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:task_manger/Constants/constants.dart';
import 'package:task_manger/screens/OnBoardingScreen/Widgets/chatItem.dart';
import 'package:task_manger/screens/auth/login/login_email_screen.dart';

class OnBoardCustomBody extends StatelessWidget {
  const OnBoardCustomBody({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 0.0, left: 30, bottom: 30),
        child: Column(
          children: [
            Expanded(flex: 3, child: Topitem(size: size)),
            Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FadeInLeft(
                      child: const Text(
                        "Task Mangment ",
                        style: TextStyle(
                            color: Color.fromARGB(255, 184, 122, 142),
                            fontSize: 19),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: FadeInLeft(
                            delay: const Duration(seconds: 1),
                            duration: const Duration(seconds: 1),
                            child: Text(
                              '''Lets Create a Space for your WorkFlows.''',
                              style: TextStyle(
                                fontSize: size.height * 0.045,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis,
                              ),
                              maxLines: 3,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.2,
                          height: size.height * 0.2,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: size.width * 0.4,
                          height: size.height * 0.05,
                          child: FadeInLeft(
                            delay: const Duration(seconds: 2),
                            duration: const Duration(seconds: 1),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (ctx) =>
                                          const LoginEmailScreen()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: kMainColor),
                              child: const Text(
                                "Get Started",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ))
          ],
        ),
      )),
    );
  }
}

class Topitem extends StatelessWidget {
  const Topitem({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          top: size.height * 0.1,
          left: size.width * 0.1,
          child: FadeIn(
            delay: const Duration(milliseconds: 500),
            duration: const Duration(seconds: 1),
            animate: true,
            child: CircleAvatar(
              radius: size.height * 0.011,
              backgroundColor: Colors.greenAccent.withOpacity(0.7),
            ),
          ),
        ),
        Positioned(
          top: size.height * 0.2,
          left: size.width * 0.4,
          child: FadeIn(
            delay: const Duration(milliseconds: 300),
            duration: const Duration(seconds: 2),
            child: CircleAvatar(
              radius: size.height * 0.01,
              backgroundColor:
                  const Color.fromARGB(255, 240, 105, 202).withOpacity(0.4),
            ),
          ),
        ),
        Positioned(
          top: size.height * 0.02,
          left: size.width * 0.3,
          child: FadeIn(
            delay: const Duration(milliseconds: 900),
            duration: const Duration(milliseconds: 800),
            child: CircleAvatar(
              radius: size.height * 0.013,
              backgroundColor:
                  const Color.fromARGB(255, 50, 52, 42).withOpacity(0.7),
            ),
          ),
        ),
        Positioned(
          top: size.height * 0.28,
          left: size.width * 0.1,
          child: FadeInLeft(
            from: 200,
            child: CircleAvatar(
              radius: size.height * 0.035, //30,
              backgroundColor: const Color.fromARGB(255, 211, 240, 105),
              child: Image.asset(
                "assets/images/memoji.png",
                fit: BoxFit.cover,
                scale: 1,
              ),
            ),
          ),
        ),
        Positioned(
          top: size.height * 0.34,
          left: size.width * 0.4,
          child: CircleAvatar(
            radius: size.height * 0.085,
            backgroundColor: const Color.fromARGB(255, 105, 175, 240),
            child: Image.asset(
              "assets/images/Daco_5969784.png",
              fit: BoxFit.cover,
              scale: 2.1,
            ),
          ),
        ),
        Positioned(
          top: size.height * 0.14,
          left: size.width * 0.65,
          child: CircleAvatar(
            radius: size.height * 0.055, //50,
            backgroundColor: const Color.fromARGB(255, 240, 112, 105),
            child: Image.asset(
              "assets/images/emojipng.com-1852162.png",
              fit: BoxFit.cover,
              scale: 1,
            ),
          ),
        ),
        ChatItem(size: size),
        Positioned(
          top: size.height * 0.32,
          left: size.width * 0.62,
          child: FadeInRight(
            from: 200,
            child: Container(
              padding: const EdgeInsets.all(10),
              width: size.width * 0.5,
              height: size.height * 0.06,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: kPriamaryColor),
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
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(40)),
                        height: size.height * 0.01,
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
          ),
        ),
      ],
    );
  }
}
