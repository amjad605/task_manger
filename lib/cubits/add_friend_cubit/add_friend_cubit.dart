import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_manger/cubits/profile_cubit/profile_cubit.dart';

import '../../models/user_model.dart';

part 'add_friend_state.dart';

class AddFriendCubit extends Cubit<AddFriendState> {
  AddFriendCubit() : super(AddInitial());
  Searching(){
    emit(SearchingState());
  }
  addFriend({required User friend,required context}){
    BlocProvider.of<ProfileCubit>(context).addFriend(friend: User(friend.name, friend.email));
    emit(AddSucssesState());
  }
}
