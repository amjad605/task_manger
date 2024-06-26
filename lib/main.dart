import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manger/cache_helper/local.dart';
import 'package:task_manger/cubits/auth/cubit.dart';
import 'package:task_manger/cubits/change_friends_body/change_friends_body_cubit.dart';
import 'package:task_manger/cubits/manage_friend_request/manage_friend_request_cubit.dart';
import 'package:task_manger/cubits/search_friend/search_friend_cubit.dart';
import 'package:task_manger/cubits/tasks/cubit.dart';
import 'package:task_manger/cubits/tasks/update/cubit/update_cubit.dart';
import 'package:task_manger/cubits/text_visibility_cubit/text_visibility_cubit.dart';
import 'package:task_manger/screens/splash_screen/view.dart';
import 'package:task_manger/theme.dart';
import 'cubits/add_friend_cubit/add_friend_cubit.dart';
import 'cubits/friends/friends_cubit.dart';
import 'cubits/nav_bottom_bar/change_screen_bottom_nav.dart';
import 'cubits/profile_cubit/profile_cubit.dart';
import 'screens/tasks_screen/cubit/left_done_tasks_cubit/switch_done_left_tasks.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  // Use cubits...

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
          BlocProvider(
            create: (context) => TasksCubit(),
          ),
          BlocProvider(
            create: (context) => AddFriendCubit(),
          ),
          BlocProvider(create: (context) => ChangeFriendsBodyCubit()),
          BlocProvider(create: (context) => ManageFriendRequestCubit()),
          BlocProvider(create: (context) => FriendsCubit()),
          BlocProvider(create: (context) => SearchFriendCubit()),
          BlocProvider(
            create: (context) => SwitchDoneLeftTasks(),
          ),
          BlocProvider(create: (context) => UpdateCubit())
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

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('onClose -- ${bloc.runtimeType}');
  }
}
