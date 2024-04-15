part of 'profile_cubit.dart';

@immutable
abstract class ProfileEditingState {}

class ProfileEditingInitial extends ProfileEditingState {}

class ProfileEditingSuccess extends ProfileEditingState {}

class ProfileEditingFailure extends ProfileEditingState {}

class ProfileEditingLoading extends ProfileEditingState {}

class ProfileEditingImgSelected extends ProfileEditingState {}

class ProfileLoadingState extends ProfileEditingState {}

class ProfileSuccessState extends ProfileEditingState {
  final User user;
  ProfileSuccessState(this.user);
}

class ProfileFailureState extends ProfileEditingState {
  final Failure error;
  ProfileFailureState(this.error);
}
