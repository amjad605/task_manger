import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manger/Api/api_servies.dart';
import 'package:task_manger/cache_helper/local.dart';
import 'package:task_manger/cubits/change_dashboard_body/switch_states_dashboard.dart';
import 'package:task_manger/cubits/change_screen_bottom_nav.dart';
import 'package:task_manger/screens/auth/login/login_email_screen.dart';

import '../../../Constants/constants.dart';

class LogoutCustomButton extends StatelessWidget {
  const LogoutCustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 80.w),
      child: ElevatedButton(
        onPressed: () {
          CacheHelper.removeData(key: kAccessToken);
          token = null;
          // BlocProvider.of<ChangeScreenBottomNav>(context).setCurrentIndexTab(0);
          Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => const LoginEmailScreen()));
        },
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            backgroundColor: kRed,
            foregroundColor: kPriamaryColor,
            minimumSize: Size(40.w, 40.h),
            maximumSize: Size(40.w, 50.h)),
        child: Text(
          "Log out",
          style: TextStyle(
              color: Colors.white, fontSize: 16.sp, fontFamily: mainFont),
        ),
      ),
    );
  }
}
