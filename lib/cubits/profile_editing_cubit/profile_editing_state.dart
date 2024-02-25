part of 'profile_editing_cubit.dart';

@immutable
abstract class ProfileEditingState {}

class ProfileEditingInitial extends ProfileEditingState {}
class ProfileEditingSuccess extends ProfileEditingState {}
class ProfileEditingFailure extends ProfileEditingState {}
class ProfileEditingLoading extends ProfileEditingState {}
class ProfileEditingImgSelected extends ProfileEditingState {}
