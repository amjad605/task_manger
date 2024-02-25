import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'profile_editing_state.dart';

class ProfileEditingCubit extends Cubit<ProfileEditingState> {
  ProfileEditingCubit() : super(ProfileEditingInitial());
  String name="User Name",mail="e-mail@gmail.com",password="123";
  File? img,selectedImg;
  EditUserData({required name,required mail, required password,required img}){
    this.name=name;
    this.mail=mail;
    this.password=password;
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
}
