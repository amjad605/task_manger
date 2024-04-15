import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_manger/Api/api_servies.dart';
import 'package:task_manger/Constants/constants.dart';
import 'package:task_manger/components/task_screen_components/show_toast.dart';
import 'package:task_manger/cubits/profile_cubit/profile_cubit.dart';
import 'package:task_manger/screens/profile_screen/data/profile_repo.dart';

import '../../models/user_model.dart';

part 'add_friend_state.dart';

class AddFriendCubit extends Cubit<AddFriendState> {
  AddFriendCubit() : super(AddInitial());
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

  addFriend({required Friend friend, required context}) async {
    emit(AddFriendLoadingState());
    print(friend.id!);
    var data = await ProfileRepo().addFriend(friend.id!);
    data.fold((l) {
      print("false");
      showToast(text: "Request already sent");
      emit(AddFriendFailureState());
    }, (r) {
      print("true");
      showToast(text: "Request Sent Successfully");

      emit(AddFriendSuccsesState());
    });
    // BlocProvider.of<ProfileCubit>(context)
    //     .addFriend(friend: User(name: friend.name, email: friend.email));
  }

  getMyFriends() async {
    print("in");
    emit(GetMyFriendsLoadingState());
    var data = await ProfileRepo().getMyFriends();
    data.fold((l) {
      emit(GetMyFriendsFailureState());
    }, (r) {
      List<Friend> friends = [];
      for (var f in r['data']) {
        friends.add(Friend.fromjson(f));
      }
      emit(GetMyFriendsSuccessState(friends));
    });
  }
}
