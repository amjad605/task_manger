import 'package:task_manger/errors/failure.dart';
import 'package:task_manger/models/user_account.dart';
import 'package:task_manger/models/user_model.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginChangePasswordVisibilityState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  UserAccount user;
  LoginSuccessState(this.user);
}

class LoginFailureState extends LoginStates {
  Failure error;
  LoginFailureState(this.error);
}

class SignUpLoadingState extends LoginStates {}

class SignUpSuccessState extends LoginStates {
  UserAccount user;
  SignUpSuccessState(this.user);
}

class SignUpFailureState extends LoginStates {
  Failure error;
  SignUpFailureState(this.error);
}
