import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/user_model.dart';
import '../../screens/profile_screen/data/profile_repo.dart';

part 'search_friend_state.dart';

class SearchFriendCubit extends Cubit<SearchFriendState> {
  SearchFriendCubit() : super(SearchFriendInitial());
  Searching(name) async {
    emit(SearchingLoadingState());

    var data = await ProfileRepo().searchForFriend(name);
    data.fold((l) {}, (r) {
      //  print(r["data"][0]["name"]);
      var data = r["data"];
      List<Friend> friendsUser = [];
      for (var f in data) {
        friendsUser.add(Friend.fromjson(f));
      }
      if (data.isNotEmpty) {
        emit(SearchingSucsessState(friendsUser));
        print(r["data"][0]["name"]);
      } else {
        emit(SearchingLoadingState());
      }
    });
  }
}
