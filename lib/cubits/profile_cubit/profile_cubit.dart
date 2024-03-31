import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:task_manger/models/user_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileEditingState> {
  ProfileCubit() : super(ProfileEditingInitial());
  User myUser= User("User Name","e-mail@gmail.com",password: "123");

  File? img,selectedImg;
  EditUserData({required name,required mail, required password,required img}){
    myUser.name=name;
    myUser.email=mail;
    myUser.password=password;
    this.img=img;
    emit(ProfileEditingSuccess());
  }
  SelectPic()async{
    emit(ProfileEditingLoading());
    final returnedImg=await ImagePicker().pickImage(source: ImageSource.gallery);
    if(returnedImg!=null){
      selectedImg =File(returnedImg.path);
    }
    emit(ProfileEditingImgSelected());
  }
  addFriend({required User friend}){
    myUser.addFriend(friend);
  }
}
