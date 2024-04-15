import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'change_friends_body_state.dart';

class ChangeFriendsBodyCubit extends Cubit<ChangeFriendsBodyState> {
  ChangeFriendsBodyCubit() : super(ChangeFriendsBodyInitial());
}
