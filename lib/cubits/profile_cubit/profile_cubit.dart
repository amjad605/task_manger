import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:task_manger/Constants/constants.dart';
import 'package:task_manger/cubits/nav_bottom_bar/screens_states.dart';
import 'package:task_manger/errors/failure.dart';
import 'package:task_manger/models/user_account.dart';
import 'package:task_manger/models/user_model.dart';
import 'package:task_manger/screens/profile_screen/data/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileEditingState> {
  ProfileCubit() : super(ProfileEditingInitial());
  User? myUser;
  UserAccount? user;
  File? img, selectedImg;
  EditUserData(
      {required name, required mail, required password, required img}) {
    myUser!.name = name;
    myUser!.email = mail;
    myUser!.password = password;
    this.img = img;
    emit(ProfileEditingSuccess());
  }

  SelectPic() async {
    emit(ProfileEditingLoading());
    final returnedImg =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImg != null) {
      selectedImg = File(returnedImg.path);
    }
    emit(ProfileEditingImgSelected());
  }

  addFriend({required User friend}) {
    myUser!.addFriend(friend);
  }

  void getProfile() async {
    emit(ProfileLoadingState());
    print(token!);
    var result = await ProfileRepo().getProfile();
    result.fold((l) {
      emit(ProfileFailureState(l));
    }, (r) {
      myUser = User.fromJson(r["data"]);
      print(myUser!.id);
      emit(ProfileSuccessState(myUser!));
    });
  }
}
