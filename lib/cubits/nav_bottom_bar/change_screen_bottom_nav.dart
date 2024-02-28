import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens_states.dart';

class ChangeScreenBottomNav extends Cubit<ScreenState> {
  ChangeScreenBottomNav() : super(DashboardScreenState());
  int index = 0;
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  setCurrentIndexTab(int index) {
    this.index = index;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
    pageController.jumpToPage(index);
    _emitScreen(index);
  }

  switchScreen(int index) {
    this.index = index;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
    _emitScreen(index);
  }

  _emitScreen(int index) {
    if (index == 0) {
      emit(DashboardScreenState());
    } else if (index == 1) {
      emit(TasksState());
    } else if (index == 2) {
      emit(ProjectState());
    } else if (index == 3) {
      emit(ProfileState());
    }
  }
}
