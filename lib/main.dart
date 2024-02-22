import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger/Screens/StatisticsScreen/statistics_screen.dart';
import 'package:task_manger/screens/OnBoardingScreen/OnBoardScreen.dart';
import 'package:task_manger/theme.dart';
import 'cubits/change_screen_bottom_nav.dart';

void main() {
  runApp(const MyTaskManger());
}

class MyTaskManger extends StatelessWidget {
  const MyTaskManger({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ChangeScreenBottomNav(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        home: const StatisticsScreen(),
      ),
    );
  }
}
