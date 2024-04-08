part of 'add_friend_cubit.dart';

@immutable
abstract class AddFriendState {}

class AddInitial extends AddFriendState {}
class SearchingState extends AddFriendState {}
class AddSucssesState extends AddFriendState {}
