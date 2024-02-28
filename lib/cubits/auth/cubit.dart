import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger/cubits/auth/states.dart';

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
}
