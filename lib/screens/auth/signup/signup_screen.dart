import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger/Constants/constants.dart';
import 'package:task_manger/components/button.dart';
import 'package:task_manger/components/login_widgets.dart';
import 'package:task_manger/components/task_screen_components/show_toast.dart';
import 'package:task_manger/cubits/auth/cubit.dart';
import 'package:task_manger/cubits/auth/states.dart';
import 'package:task_manger/cubits/profile_cubit/profile_cubit.dart';
import 'package:task_manger/screens/auth/login/login_email_screen.dart';
import 'package:task_manger/screens/controller_screen/controller_screen.dart';
import 'package:task_manger/slide_page_route.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocBuilder<LoginCubit, LoginStates>(
      builder: (context, state) {
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
                        top: .01 * screenHeight, left: 0.099 * screenWidth),
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
                        SizedBox(
                          width: 0.8 * screenWidth,
                          child: const Text("Sign Up ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 45,
                                  fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          height: 0.01 * screenHeight,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              NameTextFormField(
                                  width: 0.7 * screenWidth,
                                  name: name,
                                  suffixIcon: Icons.clear,
                                  suffixPressed: () {
                                    name.clear();
                                  },
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Name cannot be empty ';
                                    }
                                    if (!nameValid.hasMatch(value)) {
                                      return 'Enter valid email ';
                                    }
                                    return null;
                                  }),
                              const SizedBox(
                                height: 15,
                              ),
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
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 0.05 * screenHeight,
                        ),
                        BlocConsumer<LoginCubit, LoginStates>(
                          listener: (context, state) {
                            if (state is SignUpSuccessState) {
                              BlocProvider.of<ProfileCubit>(context)
                                  .getProfile();
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (ctx) =>
                                          const ControllerScreen()),
                                  (route) => false);
                            }
                            if (state is SignUpFailureState) {
                              showToast(text: state.error.errmsg);
                            }
                          },
                          builder: (context, state) {
                            var cubit = BlocProvider.of<LoginCubit>(context);
                            if (state is SignUpLoadingState) {
                              return DefaultButton(
                                  width: 0.7 * screenWidth,
                                  height: 50.0,
                                  onPressed: () {
                                    // if (formKey.currentState!
                                    //     .validate()) {

                                    // }
                                  },
                                  color: Colors.transparent,
                                  child: const CircularProgressIndicator(
                                    color: kLightblue,
                                  ));
                            } else {
                              return DefaultButton(
                                width: 0.7 * screenWidth,
                                height: 50.0,
                                onPressed: () {
                                  // if (formKey.currentState!
                                  //     .validate()) {
                                  cubit.signUp(
                                      name: name.text,
                                      confirmpass: password.text,
                                      email: email.text,
                                      pass: password.text);
                                  //  }
                                  // }
                                },
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19,
                                      color: Colors.white),
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
