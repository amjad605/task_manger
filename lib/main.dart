import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manger/cubits/auth/cubit.dart';
import 'package:task_manger/cubits/text_visibility_cubit/text_visibility_cubit.dart';
import 'package:task_manger/screens/splash_screen/view.dart';
import 'package:task_manger/screens/tasks_screen/task_screen.dart';
import 'package:task_manger/theme.dart';
import 'cubits/add_friend_cubit/add_friend_cubit.dart';
import 'cubits/nav_bottom_bar/change_screen_bottom_nav.dart';
import 'cubits/profile_cubit/profile_cubit.dart';

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
            create: (context) => ProfileCubit(),
          ),
          BlocProvider(
            create: (context) => TextVisibilityCubit(),
          ),
          BlocProvider(
            create: (context) => LoginCubit(),
          ),
          BlocProvider(create: (context) => AddFriendCubit(),),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme,
          home:  SplashScreen(),
        ),
      ),
    );
  }
}
