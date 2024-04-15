

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_manger/models/user_model.dart';

part 'change_friends_body_state.dart';

class ChangeFriendsBodyCubit extends Cubit<ChangeFriendsBodyState> {
  ChangeFriendsBodyCubit() : super(FriendsState());
  void FriendsView(){
    emit(FriendsState());
  }
  void RequestsView(){
    emit(RequestsState());
  }
}
