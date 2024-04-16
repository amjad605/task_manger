

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_manger/models/user_model.dart';
import 'package:task_manger/screens/friends_screen/widgets/friends_view.dart';

part 'change_friends_body_state.dart';

class ChangeFriendsBodyCubit extends Cubit<ChangeFriendsBodyState> {
  ChangeFriendsBodyCubit() : super(FriendsViewState());
  void FriendsView(){
    emit(FriendsViewState());
  }
  void RequestsView(){
    emit(RequestsViewState());
  }
}
