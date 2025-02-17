import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/user_model.dart';
import '../../screens/profile_screen/data/profile_repo.dart';

part 'manage_friend_request_state.dart';

class ManageFriendRequestCubit extends Cubit<ManageFriendRequestState> {

  ManageFriendRequestCubit() : super(ManageFriendRequestInitial());

  acceptRequest(String id)async{

    emit(AcceptRequestsLoadingState());
    var data = await ProfileRepo().acceptRequest(id);
    data.fold((l) {
      emit(AcceptRequestsFailureState());
    }, (r) {
      print(data);
      emit(AcceptRequestsSuccessState());
    });
  }
  rejectRequest(String id)async{

    emit(AcceptRequestsLoadingState());
    var data = await ProfileRepo().rejectRequest(id);
    data.fold((l) {
      emit(AcceptRequestsFailureState());
    }, (r) {
      print(data);
      emit(RejectRequestsSuccessState());
    });
  }
}
