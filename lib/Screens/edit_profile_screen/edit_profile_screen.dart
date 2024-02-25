import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:task_manger/cubits/profile_editing_cubit/profile_editing_cubit.dart';
import 'package:task_manger/screens/edit_profile_screen/widgets/custom_profile_text_formfield.dart';
import 'package:task_manger/screens/edit_profile_screen/widgets/edit_profile_appbar.dart';

import '../../Constants/constants.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);
  GlobalKey<FormState> keyForm = GlobalKey();
  AutovalidateMode mode = AutovalidateMode.disabled;
  TextEditingController nameController=TextEditingController();
  TextEditingController mailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  bool isLoading=false;

  @override
  Widget build(BuildContext context) {

    String mail=BlocProvider.of<ProfileEditingCubit>(context).mail,
        name=BlocProvider.of<ProfileEditingCubit>(context).name,
        password=BlocProvider.of<ProfileEditingCubit>(context).password;
    var img=BlocProvider.of<ProfileEditingCubit>(context).img;
    return BlocConsumer<ProfileEditingCubit, ProfileEditingState>(
      listener: (context, state) {
        if(state is ProfileEditingSuccess){
          isLoading=false;
          Navigator.pop(context);
        }
        else if(state is ProfileEditingImgSelected){
          img=BlocProvider.of<ProfileEditingCubit>(context).selectedImg;
          isLoading=false;
        }
        else if(state is ProfileEditingLoading){
          isLoading=true;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            backgroundColor: kBackgroundColor,
            appBar: PreferredSize(preferredSize: Size(double.infinity, 44),
                child: EditProfileAppBar()),
            body: ListView(
              children: [
                SizedBox(height: 30.h,),
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 60.0.r, // Set your desired radius
                        child:img ==null? ClipOval(
                          child: Image.asset(
                            "Assets/images/Profile_pic.png",
                          ),
                        )
                      :ClipOval(
                          child: SizedBox(
                            height: double.infinity,
                            width: double.infinity,
                            child: Image.file(
                              img!,
                              fit: BoxFit.fill,
                            ),
                          )
                        ),
                        ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: IconButton(
                            onPressed: ()async{
                                BlocProvider.of<ProfileEditingCubit>(context).SelectPic();
                            },
                            icon:Icon(Icons.edit),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kLightblue,
                            )
                        ),
                      ),
                    ],
                  ),
                ),
                Form(
                    key: keyForm,
                    autovalidateMode: mode,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 30.h,),
                          CustomProfileTextFormField(
                            fieldName: "Your Email",
                            controller: mailController
                              ..text = mail,
                          ),
                          SizedBox(height: 30.h,),
                          CustomProfileTextFormField(
                            fieldName: "Your Name",
                            controller: nameController
                              ..text = name,
                          ),
                          SizedBox(height: 30.h,),
                          CustomProfileTextFormField(
                            fieldName: "Password",
                            controller: passwordController
                              ..text = password,
                          ),
                          SizedBox(height: 50.h,),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 50.w),
                            child: ElevatedButton(
                              onPressed: () {
                                if (keyForm.currentState!.validate()){
                                  print("sss$img");
                                  BlocProvider.of<ProfileEditingCubit>(context).
                                  EditUserData(
                                    name:nameController.value.text,
                                    password: passwordController.value.text,
                                    mail: mailController.value.text,
                                    img: img,
                                  );
                                }
                                else{
                                  mode =AutovalidateMode.always;
                                }
                              },
                              child: Text(
                                "Submit",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: mainFont,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kLightblue,
                                foregroundColor: kPriamaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),

                                ),
                                minimumSize: Size(double.infinity, 45.h),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
