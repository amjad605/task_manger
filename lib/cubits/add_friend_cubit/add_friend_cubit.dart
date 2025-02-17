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


  }
