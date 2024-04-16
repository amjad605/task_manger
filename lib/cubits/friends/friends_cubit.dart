import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/user_model.dart';
import '../../screens/profile_screen/data/profile_repo.dart';

part 'friends_state.dart';

class FriendsCubit extends Cubit<FriendsState> {
  List<Request> requests=[];
  FriendsCubit() : super(FriendsInitial());
  getMyFriends() async {
    print("in");
    emit(GetMyFriendsLoadingState());
    var data = await ProfileRepo().getMyFriends();
    data.fold((l) {
      emit(GetMyFriendsFailureState());
    }, (r) {
      print(r);
      List<Friend> friends = [];
      for (var f in r['data']) {
        friends.add(Friend.fromjson(f));
      }
      emit(GetMyFriendsSuccessState(friends));
    });
  }
  getMyRequests() async {

    emit(GetMyRequestsLoadingState());
    var data = await ProfileRepo().getMyRequests();
    data.fold((l) {
      emit(GetMyRequestsFailureState());
    }, (r) {

      requests = [];
      for (var f in r['data']) {
        requests.add(Request.fromjson(f));
      }
      emit(GetMyRequestsSuccessState());
    });
  }
}
