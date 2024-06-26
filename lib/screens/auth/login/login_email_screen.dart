import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:task_manger/Constants/constants.dart';
import 'package:task_manger/components/button.dart';
import 'package:task_manger/components/login_widgets.dart';
import 'package:task_manger/screens/auth/login/login_password_screen.dart';
import 'package:task_manger/screens/auth/signup/signup_screen.dart';
import 'package:task_manger/slide_page_route.dart';

class LoginEmailScreen extends StatefulWidget {
  const LoginEmailScreen({super.key});

  @override
  State<LoginEmailScreen> createState() => _LoginEmailScreenState();
}

class _LoginEmailScreenState extends State<LoginEmailScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(gradient: backgroundStyle()),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 0.03 * screenWidth, vertical: 0.05 * screenHeight),
          child: SafeArea(
            child: Stack(
              children: [
                hexagonalShape(),
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 0.08 * screenHeight,
                        left: 0.09 * screenWidth,
                        right: screenWidth * 0.1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //backIcon(),
                        SizedBox(
                          height: 0.05 * screenHeight,
                        ),
                        FadeInLeft(
                          child: SizedBox(
                            width: 0.7 * screenWidth,
                            child: const Text("What's your email address?",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 45,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        SizedBox(height: 0.02 * screenHeight),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              EmailTextFormField(
                                  width: 0.7 * screenWidth,
                                  email: email,
                                  suffixIcon: Icons.clear,
                                  suffixPressed: () {
                                    email.clear();
                                  },
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Email cannot be empty ';
                                    }
                                    if (!emailValid.hasMatch(value)) {
                                      return 'Enter valid email ';
                                    }
                                    return null;
                                  }),
                              SizedBox(height: 0.05 * screenHeight),
                              DefaultButton(
                                width: 0.7 * screenWidth,
                                height: 0.06 * screenHeight,
                                child: const Text(
                                  "Continue with email",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19,
                                      color: Colors.white),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    Navigator.of(context).push(SlidePageRoute(
                                        page: LoginPasswordScreen(
                                      email: email.text,
                                    )));
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 0.01 * screenHeight),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "You don't have an account?",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                    SlidePageRoute(page: const SignUpScreen()));
                              },
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
