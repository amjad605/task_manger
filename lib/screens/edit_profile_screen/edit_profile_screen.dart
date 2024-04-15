import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:task_manger/screens/edit_profile_screen/widgets/custom_profile_text_formfield.dart';
import 'package:task_manger/screens/edit_profile_screen/widgets/edit_profile_appbar.dart';
import 'package:task_manger/screens/edit_profile_screen/widgets/profile_pic.dart';

import '../../Constants/constants.dart';
import '../../cubits/profile_cubit/profile_cubit.dart';
import '../../models/user_model.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});
  GlobalKey<FormState> keyForm = GlobalKey();
  AutovalidateMode mode = AutovalidateMode.always;
  TextEditingController nameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    User myUser = BlocProvider.of<ProfileCubit>(context).myUser!;
    var img = BlocProvider.of<ProfileCubit>(context).img;
    return BlocConsumer<ProfileCubit, ProfileEditingState>(
      listener: (context, state) {
        if (state is ProfileEditingSuccess) {
          isLoading = false;
          Navigator.pop(context);
        } else if (state is ProfileEditingImgSelected) {
          img = BlocProvider.of<ProfileCubit>(context).selectedImg;
          isLoading = false;
        } else if (state is ProfileEditingLoading) {
          isLoading = true;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            backgroundColor: kBackgroundColor,
            appBar: const PreferredSize(
                preferredSize: Size(double.infinity, 44),
                child: EditProfileAppBar()),
            body: ListView(
              children: [
                SizedBox(
                  height: 30.h,
                ),
                ProfilePic(
                  img: img,
                  myUser: myUser,
                ),
                Form(
                    key: keyForm,
                    autovalidateMode: mode,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30.h,
                          ),
                          CustomProfileTextFormField(
                            fieldName: "Your Email",
                            controller: mailController..text = myUser.email!,
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          CustomProfileTextFormField(
                            fieldName: "Your Name",
                            controller: nameController..text = myUser.name!,
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          CustomProfileTextFormField(
                            fieldName: "Password",
                            controller: passwordController
                              ..text = myUser.password == null
                                  ? ""
                                  : myUser.password!,
                            needObscure: true,
                          ),
                          SizedBox(
                            height: 50.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 50.w),
                            child: ElevatedButton(
                              onPressed: () {
                                if (keyForm.currentState!.validate()) {
                                  BlocProvider.of<ProfileCubit>(context)
                                      .EditUserData(
                                    name: nameController.value.text,
                                    password: passwordController.value.text,
                                    mail: mailController.value.text,
                                    img: img,
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kLightblue,
                                foregroundColor: kPriamaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                minimumSize: Size(double.infinity, 45.h),
                              ),
                              child: Text(
                                "Submit",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: mainFont,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.sp),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
