import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger/Constants/constants.dart';
import 'package:task_manger/components/button.dart';
import 'package:task_manger/components/login_widgets.dart';
import 'package:task_manger/cubits/auth/cubit.dart';
import 'package:task_manger/cubits/auth/states.dart';
import 'package:task_manger/screens/auth/login/login_email_screen.dart';
import 'package:task_manger/screens/controller_screen/controller_screen.dart';
import 'package:task_manger/slide_page_route.dart';

class LoginPasswordScreen extends StatelessWidget {
  const LoginPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    TextEditingController password = TextEditingController();

    return BlocBuilder<LoginCubit, LoginStates>(
      builder: (context, state) {
        final screenWidth = MediaQuery.of(context).size.width;
        final screenHeight = MediaQuery.of(context).size.height;
        return Container(
            decoration: BoxDecoration(gradient: backgroundStyle()),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 0.03 * screenWidth,
                    vertical: 0.05 * screenHeight),
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: .05 * screenHeight, left: 0.099 * screenWidth),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          backIcon(
                            onPressed: () {
                              Navigator.of(context).pop(
                                  SlidePageRoute(page: const LoginEmailScreen()));
                            },
                          ),
                          SizedBox(
                            height: 0.05 * screenHeight,
                          ),
                          FadeInLeft(
                            child: SizedBox(
                              width: 0.8 * screenWidth,
                              child: const Text("Login ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 45,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          SizedBox(
                            height: 0.01 * screenHeight,
                          ),
                          FadeInLeft(
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(
                                    SlidePageRoute(page: const LoginEmailScreen()));
                              },
                              child: const Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Using ',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'aya@gmail.com',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' to login',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 0.03 * screenHeight),
                          Form(
                            key: formKey,
                            child: Column(
                              children: [
                                passwordTextFormField(
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Password cannot be empty ';
                                    }
                                    if (!passValid.hasMatch(value)) {
                                      return 'Enter valid password';
                                    }
                                    return null;
                                  },
                                  password: password,
                                  width: 0.7 * screenWidth,
                                  isPassword: LoginCubit.get(context)
                                      .isPasswordNotVisible,
                                  suffixIcon: LoginCubit.get(context).suffix,
                                  suffixPressed: () {
                                    LoginCubit.get(context)
                                        .changePasswordVisibility();
                                  },
                                ),
                                const SizedBox(height: 50),
                                DefaultButton(
                                    width: 0.7 * screenWidth,
                                    height: 50.0,
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        Navigator.of(context).pushAndRemoveUntil(
                                            MaterialPageRoute(
                                                builder: (ctx) =>
                                                    const ControllerScreen()),
                                            (route) => false);
                                      }
                                    },
                                    text: "Sign In"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
