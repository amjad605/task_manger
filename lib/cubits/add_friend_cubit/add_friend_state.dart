part of 'add_friend_cubit.dart';

@immutable
abstract class AddFriendState {}

class AddInitial extends AddFriendState {}

class SearchingState extends AddFriendState {}

class SearchingLoadingState extends AddFriendState {}

class SearchingSucsessState extends AddFriendState {
  final List<Friend> friend;
  SearchingSucsessState(this.friend);
}

class AddSucssesState extends AddFriendState {}

class AddFriendLoadingState extends AddFriendState {}

class AddFriendSuccsesState extends AddFriendState {}

class AddFriendFailureState extends AddFriendState {}

class GetMyFriendsLoadingState extends AddFriendState {}

class GetMyFriendsSuccessState extends AddFriendState {
  final List<Friend> Friends;
  GetMyFriendsSuccessState(this.Friends);
}

class GetMyFriendsFailureState extends AddFriendState {}
