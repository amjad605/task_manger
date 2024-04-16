part of 'search_friend_cubit.dart';

@immutable
sealed class SearchFriendState {}

final class SearchFriendInitial extends SearchFriendState {}
class SearchingState extends SearchFriendState {}

class SearchingLoadingState extends SearchFriendState {}

class SearchingSucsessState extends SearchFriendState {
  final List<Friend> friend;
  SearchingSucsessState(this.friend);
}
