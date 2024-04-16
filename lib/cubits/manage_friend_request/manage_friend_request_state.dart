part of 'manage_friend_request_cubit.dart';

@immutable
sealed class ManageFriendRequestState {}

final class ManageFriendRequestInitial extends ManageFriendRequestState {}
class AcceptRequestsFailureState extends ManageFriendRequestState {}
class AcceptRequestsSuccessState extends ManageFriendRequestState {}
class AcceptRequestsLoadingState extends ManageFriendRequestState {}
class RejectRequestsSuccessState extends ManageFriendRequestState {}
