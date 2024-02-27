import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger/Screens/splash_screen/view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manger/cubits/profile_editing_cubit/profile_editing_cubit.dart';

import 'package:task_manger/theme.dart';
import 'cubits/change_screen_bottom_nav.dart';

void main() {
  runApp(const MyTaskManger());
}

class MyTaskManger extends StatelessWidget {
  const MyTaskManger({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ChangeScreenBottomNav(),
          ),
          BlocProvider(
            create: (context) => ProfileEditingCubit(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme,
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
