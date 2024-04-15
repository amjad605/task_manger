import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger/Api/api_servies.dart';
import 'package:task_manger/Constants/constants.dart';
import 'package:task_manger/cache_helper/local.dart';
import 'package:task_manger/cubits/auth/states.dart';
import 'package:task_manger/cubits/profile_cubit/profile_cubit.dart';
import 'package:task_manger/models/user_account.dart';
import 'package:task_manger/models/user_model.dart';
import 'package:task_manger/screens/auth/data/auth_repo.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  IconData suffix = Icons.visibility_off_outlined;

  bool isPasswordNotVisible = true;

  void changePasswordVisibility() {
    isPasswordNotVisible = !isPasswordNotVisible;

    suffix = isPasswordNotVisible
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;

    emit(LoginChangePasswordVisibilityState());
  }

  void login({
    required String email,
    required String pass,
  }) async {
    emit(LoginLoadingState());
    var result = await authRepo().login(email: email, password: pass);
    result.fold((l) {
      emit(LoginFailureState(l));
    }, (data) {
      user = UserAccount.fromJson(data["data"]);
      CacheHelper.saveData(key: kAccessToken, value: data['token']);
      token = data['token'];
      ApiService.initialize(data['token']);
      emit(LoginSuccessState(user!));
    });
  }

  void signUp(
      {required String name,
      required String email,
      required String pass,
      required String confirmpass}) async {
    emit(SignUpLoadingState());
    var result = await authRepo().signup(
      name: name,
      email: email,
      password: pass,
    );
    result.fold((l) {
      emit(SignUpFailureState(l));
    }, (data) {
      user = UserAccount.fromJson(data["data"]);
      CacheHelper.saveData(key: kAccessToken, value: data['token']);
      token = data['token'];
      ApiService.initialize(data['token']);
      emit(SignUpSuccessState(user!));
    });
  }
}
