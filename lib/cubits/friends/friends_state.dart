part of 'friends_cubit.dart';

@immutable
sealed class FriendsState {}

final class FriendsInitial extends FriendsState {}
class GetMyFriendsLoadingState extends FriendsState {}

class GetMyFriendsSuccessState extends FriendsState {
  final List<Friend> Friends;
  GetMyFriendsSuccessState(this.Friends);
}
class GetMyFriendsFailureState extends FriendsState {}


class GetMyRequestsLoadingState extends FriendsState {}
class GetMyRequestsSuccessState extends FriendsState {

}
class GetMyRequestsFailureState extends FriendsState {}
