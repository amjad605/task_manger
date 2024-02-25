import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'profile_editing_state.dart';

class ProfileEditingCubit extends Cubit<ProfileEditingState> {
  ProfileEditingCubit() : super(ProfileEditingInitial());
}
