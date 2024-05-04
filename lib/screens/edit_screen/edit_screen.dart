import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger/Api/api_servies.dart';
import 'package:task_manger/Constants/constants.dart';
import 'package:task_manger/cubits/profile_cubit/profile_cubit.dart';
import 'package:task_manger/cubits/tasks/cubit.dart';
import 'package:task_manger/models/task_model.dart';
import 'package:task_manger/screens/add_task_screen/models/user.dart';
import 'package:task_manger/screens/add_task_screen/pages/user_selection_page.dart';

import 'package:task_manger/Constants/constants.dart';
import 'package:task_manger/screens/add_task_screen/widgets/cross_fade.dart';
import 'package:task_manger/screens/add_task_screen/widgets/date_time.dart';
import 'package:task_manger/screens/add_task_screen/widgets/sequence_animation_builder.dart';

final PageController pageController = PageController(initialPage: 1);

class EditTaskScreen extends StatefulWidget {
  EditTaskScreen({super.key, required this.task});
  Data task;
  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  bool built = false;
  bool assigningScreen = false;
  final SequenceAnimationController _animationController =
      SequenceAnimationController();

  final _categoryController = TextEditingController();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _pageController2 = PageController();
  DateTime _date = DateTime.now();
  TimeOfDay _time = TimeOfDay.now();
  List<User> _users = [];
  List<int> points = [1, 2, 3, 5, 8, 11, 13, 18, 21];
  int selectedPoint = -1;
  List<String> priority = ['Low', 'Medium', 'High'];
  int selectedPriority = -1;
  @override
  Widget build(BuildContext context) {
    _titleController.text = widget.task.name ?? '';
    _categoryController.text = widget.task.category ?? " ";
    _descriptionController.text = widget.task.description ?? "";
    _date = DateTime.parse(widget.task.deadline ?? '');
    final screenSize = MediaQuery.sizeOf(context);
    var route = ModalRoute.of(context);

    void handler(status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          built = true;
        });
        route?.animation?.removeStatusListener(handler);
      }
    }

    route?.animation?.addStatusListener(handler);
    return Theme(
      data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.dark(
            primary: kPriamaryColor,
            onPrimary: Colors.white,
            secondary: kRed,
            onSecondary: Colors.white,
            outline: Colors.grey,
          ),
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: Colors.white))),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kMainColor,
        body: Stack(
          children: [
            AnimatedBuilder(
              animation: route!.animation!,
              builder: (context, child) => Opacity(
                opacity: Curves.easeOut.transform(route.animation!.value),
                child: Container(
                  color: kBackgroundColor,
                ),
              ),
            ),
            if (built)
              SequenceAnimationBuilder(
                  repeat: false,
                  controller: _animationController,
                  delay: 0.4,
                  endCallback: () {
                    Navigator.pop(context);
                  },
                  builder: (values, [child]) {
                    return PageView(
                      controller: pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        UsersSelectionPage(
                          callback: (selectedUsers) {
                            setState(() {
                              _users = selectedUsers;
                            });
                          },
                          initialUsers: _users,
                        ),
                        Stack(
                          children: [
                            Positioned(
                              bottom: screenSize.height *
                                  (1 -
                                      (.6 *
                                          Curves.easeOutBack
                                              .transform(values[0]))),
                              top: 0,
                              width: screenSize.width,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(
                                          screenSize.width * .1)),
                                ),
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).padding.top * 1.5,
                                ),
                                clipBehavior: Clip.none,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 24),
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: CrossFade(
                                                direction:
                                                    Alignment.centerRight,
                                                value: Curves.easeOut
                                                    .transform(values[1]),
                                                child: GestureDetector(
                                                  onTap:
                                                      Navigator.of(context).pop,
                                                  child: Container(
                                                    color: Colors.transparent,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: const Icon(
                                                      Icons.arrow_back_rounded,
                                                      color: kBackgroundColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.center,
                                              child: CrossFade(
                                                direction:
                                                    Alignment.bottomCenter,
                                                value: Curves.easeOut
                                                    .transform(values[1]),
                                                child: const Text('Edit Task',
                                                    style: TextStyle(
                                                        color: kBackgroundColor,
                                                        fontSize: 24.0,
                                                        fontWeight:
                                                            FontWeight.w700)),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 24.0,
                                    ),
                                    Expanded(
                                        flex: 9,
                                        child: PageView(
                                          clipBehavior: Clip.none,
                                          controller: _pageController2,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          children: [
                                            OverflowBox(
                                              maxHeight: double.infinity,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 24.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        CrossFade(
                                                          value: Curves.easeOut
                                                              .transform(
                                                                  values[2]),
                                                          direction: Alignment
                                                              .bottomCenter,
                                                          child: const Text(
                                                            'Category',
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .black87,
                                                              fontSize: 16.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 12.0,
                                                        ),
                                                        FractionallySizedBox(
                                                          widthFactor: Curves
                                                              .easeOut
                                                              .transform(
                                                                  values[2]),
                                                          alignment:
                                                              FractionalOffset
                                                                  .centerLeft,
                                                          child: Opacity(
                                                            opacity: Curves
                                                                .easeOut
                                                                .transform(
                                                                    values[2]),
                                                            child:
                                                                TextFormField(
                                                              decoration:
                                                                  InputDecoration(
                                                                contentPadding:
                                                                    const EdgeInsets
                                                                        .symmetric(
                                                                        horizontal:
                                                                            24.0,
                                                                        vertical:
                                                                            20.0),
                                                                hintText:
                                                                    'UI/UX Design',
                                                                hintStyle: const TextStyle(
                                                                    color: Colors
                                                                        .black54,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300),
                                                                border: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0)),
                                                              ),
                                                              textInputAction:
                                                                  TextInputAction
                                                                      .next,
                                                              controller:
                                                                  _categoryController,
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .black87),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        CrossFade(
                                                          value: Curves.easeOut
                                                              .transform(
                                                                  values[2]),
                                                          direction: Alignment
                                                              .bottomCenter,
                                                          child: const Text(
                                                            'Title',
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .black87,
                                                              fontSize: 16.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 12.0,
                                                        ),
                                                        Align(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          child:
                                                              FractionallySizedBox(
                                                            widthFactor: Curves
                                                                .easeOut
                                                                .transform(
                                                                    values[2]),
                                                            child: Opacity(
                                                              opacity: Curves
                                                                  .easeOut
                                                                  .transform(
                                                                      values[
                                                                          2]),
                                                              child:
                                                                  TextFormField(
                                                                decoration:
                                                                    InputDecoration(
                                                                  contentPadding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          24.0,
                                                                      vertical:
                                                                          20.0),
                                                                  hintText:
                                                                      'Make Grocery Apps UI Design',
                                                                  hintStyle: const TextStyle(
                                                                      color: Colors
                                                                          .black54,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300),
                                                                  border: OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              16.0)),
                                                                ),
                                                                controller:
                                                                    _titleController,
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .black87),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              CrossFade(
                                                                value: Curves
                                                                    .easeOut
                                                                    .transform(
                                                                        values[
                                                                            3]),
                                                                direction: Alignment
                                                                    .bottomCenter,
                                                                child:
                                                                    const Text(
                                                                  'Date',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black87,
                                                                    fontSize:
                                                                        16.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 12.0,
                                                              ),
                                                              FractionallySizedBox(
                                                                widthFactor: Curves
                                                                    .easeOut
                                                                    .transform(
                                                                        values[
                                                                            3]),
                                                                alignment:
                                                                    FractionalOffset
                                                                        .centerLeft,
                                                                child: Opacity(
                                                                    opacity: Curves
                                                                        .easeOut
                                                                        .transform(
                                                                            values[3]),
                                                                    child: Date(
                                                                      onSelectDate:
                                                                          (newDate) =>
                                                                              _date = newDate,
                                                                    )),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 16.0,
                                                        ),
                                                        Expanded(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              CrossFade(
                                                                value: Curves
                                                                    .easeOut
                                                                    .transform(
                                                                        values[
                                                                            3]),
                                                                direction: Alignment
                                                                    .bottomCenter,
                                                                child:
                                                                    const Text(
                                                                  'Time',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black87,
                                                                    fontSize:
                                                                        16.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 12.0,
                                                              ),
                                                              Align(
                                                                alignment: Alignment
                                                                    .centerRight,
                                                                child:
                                                                    FractionallySizedBox(
                                                                  widthFactor: Curves
                                                                      .easeOut
                                                                      .transform(
                                                                          values[
                                                                              3]),
                                                                  child: Opacity(
                                                                      opacity: Curves.easeOut.transform(values[3]),
                                                                      child: Time(
                                                                        onSelectTime:
                                                                            (newTime) =>
                                                                                _time = newTime,
                                                                      )),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 24.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Text(
                                                        'Points',
                                                        style: TextStyle(
                                                          color: Colors.black87,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 12.0,
                                                      ),
                                                      Row(
                                                          children:
                                                              List.generate(
                                                        9,
                                                        (index) => Expanded(
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                if (selectedPoint ==
                                                                    index) {
                                                                  selectedPoint =
                                                                      -1;
                                                                } else {
                                                                  selectedPoint =
                                                                      index;
                                                                }
                                                              });
                                                            },
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          2.0),
                                                              child:
                                                                  AspectRatio(
                                                                aspectRatio:
                                                                    1.0,
                                                                child:
                                                                    AnimatedContainer(
                                                                  duration: const Duration(
                                                                      milliseconds:
                                                                          300),
                                                                  curve: Curves
                                                                      .easeOut,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                      color: kBackgroundColor.withOpacity(selectedPoint ==
                                                                              index
                                                                          ? 1.0
                                                                          : 0.0)),
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  child:
                                                                      AnimatedDefaultTextStyle(
                                                                    duration: const Duration(
                                                                        milliseconds:
                                                                            300),
                                                                    curve: Curves
                                                                        .easeOut,
                                                                    style: TextStyle(
                                                                        color: selectedPoint ==
                                                                                index
                                                                            ? Colors
                                                                                .white
                                                                            : kBackgroundColor.withOpacity(
                                                                                .5),
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w700,
                                                                        fontSize:
                                                                            16.0),
                                                                    child: Text(
                                                                      points[index]
                                                                          .toString(),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ))
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Text(
                                                        'Priority',
                                                        style: TextStyle(
                                                          color: Colors.black87,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 12.0,
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            (screenSize.width -
                                                                    48.0) /
                                                                3 *
                                                                .4,
                                                        child: Stack(
                                                            clipBehavior:
                                                                Clip.none,
                                                            children: [
                                                              AnimatedPositioned(
                                                                duration:
                                                                    const Duration(
                                                                        milliseconds:
                                                                            300),
                                                                curve: Curves
                                                                    .easeOutBack,
                                                                width: selectedPriority ==
                                                                        -1
                                                                    ? 0.0
                                                                    : (screenSize.width -
                                                                            48.0) /
                                                                        3,
                                                                height: (screenSize
                                                                            .width -
                                                                        48.0) /
                                                                    3 *
                                                                    .4,
                                                                left: (screenSize
                                                                            .width -
                                                                        48.0) /
                                                                    3 *
                                                                    (selectedPriority ==
                                                                            -1
                                                                        ? selectedPriority -
                                                                            .25
                                                                        : selectedPriority),
                                                                child:
                                                                    Container(
                                                                  decoration: BoxDecoration(
                                                                      color:
                                                                          kBackgroundColor,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              16.0)),
                                                                ),
                                                              ),
                                                              Row(
                                                                children: List
                                                                    .generate(
                                                                  3,
                                                                  (index) =>
                                                                      Expanded(
                                                                          child:
                                                                              GestureDetector(
                                                                    onTap: () {
                                                                      setState(
                                                                          () {
                                                                        if (selectedPriority ==
                                                                            index) {
                                                                          selectedPriority =
                                                                              -1;
                                                                        } else {
                                                                          selectedPriority =
                                                                              index;
                                                                        }
                                                                      });
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      color: Colors
                                                                          .transparent,
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      child:
                                                                          AnimatedDefaultTextStyle(
                                                                        duration:
                                                                            const Duration(milliseconds: 300),
                                                                        style:
                                                                            TextStyle(
                                                                          color: selectedPriority == index
                                                                              ? Colors.white
                                                                              : kBackgroundColor.withOpacity(.5),
                                                                          fontSize:
                                                                              16.0,
                                                                          fontWeight:
                                                                              FontWeight.w700,
                                                                        ),
                                                                        child:
                                                                            Text(
                                                                          priority[
                                                                              index],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  )),
                                                                ),
                                                              )
                                                            ]),
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Text(
                                                        'Description',
                                                        style: TextStyle(
                                                          color: Colors.black87,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 12.0,
                                                      ),
                                                      TextFormField(
                                                        decoration:
                                                            InputDecoration(
                                                          contentPadding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      24.0,
                                                                  vertical:
                                                                      20.0),
                                                          hintText:
                                                              'This task is about creating the entire design for the product...',
                                                          hintStyle:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .black54,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300),
                                                          border: OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0)),
                                                        ),
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        controller:
                                                            _descriptionController,
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.black87),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 32.0),
                                      child: AnimatedBuilder(
                                        animation: _pageController2,
                                        builder: (context, child) => SizedBox(
                                          height: 16,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                                onTap: () => _pageController2
                                                    .animateToPage(0,
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    300),
                                                        curve: Curves.easeOut),
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                            color:
                                                                kBackgroundColor,
                                                            width: 2.0)),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            2.0),
                                                    child: AnimatedContainer(
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    300),
                                                        curve: Curves.easeOut,
                                                        width: (_pageController2
                                                                        .page ??
                                                                    0.0) <=
                                                                .5
                                                            ? 8.0
                                                            : 0.0,
                                                        height: (_pageController2
                                                                        .page ??
                                                                    0.0) <=
                                                                .5
                                                            ? 8.0
                                                            : 0.0,
                                                        decoration:
                                                            const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color:
                                                              kBackgroundColor,
                                                        ))),
                                              ),
                                              const SizedBox(width: 8.0),
                                              GestureDetector(
                                                onTap: () => _pageController2
                                                    .animateToPage(1,
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    300),
                                                        curve: Curves.easeOut),
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                            color:
                                                                kBackgroundColor,
                                                            width: 2.0)),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            2.0),
                                                    child: AnimatedContainer(
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    300),
                                                        curve: Curves.easeOut,
                                                        width: (_pageController2
                                                                        .page ??
                                                                    0.0) >=
                                                                .5
                                                            ? 8.0
                                                            : 0.0,
                                                        height: (_pageController2
                                                                        .page ??
                                                                    0.0) >=
                                                                .5
                                                            ? 8.0
                                                            : 0.0,
                                                        decoration:
                                                            const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color:
                                                              kBackgroundColor,
                                                        ))),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: screenSize.height * .6,
                              bottom: screenSize.height * .075,
                              width: screenSize.width,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0, vertical: 24.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CrossFade(
                                      value:
                                          Curves.easeOut.transform(values[4]),
                                      direction: Alignment.bottomCenter,
                                      child: const Text(
                                        'Assign to',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 16.0,
                                    ),
                                    Expanded(
                                      child: GridView.builder(
                                        itemCount: _users.length + 1,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 6,
                                                mainAxisSpacing: 12.0,
                                                crossAxisSpacing: 12.0,
                                                childAspectRatio: .5),
                                        padding: EdgeInsets.zero,
                                        itemBuilder: (context, index) =>
                                            index == _users.length
                                                ? _addButton(values[4])
                                                : _userWidget(_users[index]),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              width: screenSize.width,
                              child: CrossFade(
                                direction: Alignment.bottomCenter,
                                value: Curves.easeOutBack.transform(values[5]),
                                child: GestureDetector(
                                  onTap: () async {
                                    if (_titleController.text.isEmpty) {
                                      showSnackBar('Enter valid title');
                                      return;
                                    }
                                    setState(() {
                                      next = true;
                                      stage = 1;
                                    });
                                    ApiService api = ApiService();
                                    await api.post(endPoint: '/tasks', body: {
                                      "user_id": [
                                        BlocProvider.of<ProfileCubit>(context)
                                            .myUser!
                                            .id
                                      ],
                                      'name': _titleController.text,
                                      if (_descriptionController.text
                                          .trim()
                                          .isNotEmpty)
                                        'description':
                                            _descriptionController.text,
                                      if (_categoryController.text
                                          .trim()
                                          .isNotEmpty)
                                        'category': _categoryController.text,
                                      if (selectedPriority != -1)
                                        'priority': priority[selectedPriority]
                                            .toLowerCase(),
                                      if (selectedPoint != -1)
                                        'points': points[selectedPoint],
                                      'deadline': DateTime(
                                              _date.year,
                                              _date.month,
                                              _date.day,
                                              _time.hour,
                                              _time.minute)
                                          .toIso8601String(),
                                    });
                                    setState(() {
                                      next = true;
                                      stage = 2;
                                    });
                                    await Future.delayed(
                                        const Duration(milliseconds: 1000));
                                    BlocProvider.of<TasksCubit>(context)
                                        .getAllTasks();
                                    Navigator.pop(context);
                                  },
                                  child: Center(
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 400),
                                      height: screenSize.height * .075,
                                      width: stage == 1
                                          ? screenSize.height * .075
                                          : screenSize.width,
                                      decoration: BoxDecoration(
                                          color: stage == 2
                                              ? Colors.green
                                              : kMainColor,
                                          borderRadius: BorderRadius.circular(
                                              screenSize.width)),
                                      margin: EdgeInsets.symmetric(
                                          vertical: MediaQuery.of(context)
                                                  .padding
                                                  .top *
                                              1.5,
                                          horizontal: 24.0),
                                      alignment: Alignment.center,
                                      clipBehavior: Clip.antiAlias,
                                      child: AnimatedSwitcher(
                                          duration:
                                              const Duration(milliseconds: 400),
                                          child: stages[stage]),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    );
                  },
                  animations: 6),
          ],
        ),
      ),
    );
  }

  int fibonacci(int n) {
    if (n == 0 || n == 1) {
      return n;
    }

    return fibonacci(n - 1) + fibonacci(n - 2);
  }

  _userWidget(User user) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                margin: const EdgeInsets.all(1.0),
                child: Image.asset(
                  user.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              user.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 10.0,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      );

  _addButton(value) => Column(
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  pageController.animateToPage(0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeOut);
                },
                child: FractionalTranslation(
                  translation: Offset(
                      4 - (Curves.easeOutBack.transform(value) * 4), 0.0),
                  child: Transform.rotate(
                    angle: pi * Curves.easeIn.transform(value),
                    child: Opacity(
                        opacity: Curves.easeOutQuad.transform(value),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Colors.lightGreen, width: 2.0),
                            ),
                            padding: const EdgeInsets.all(8.0),
                            child: const Icon(
                              Icons.add_rounded,
                              color: Colors.lightGreen,
                            ),
                          ),
                        )),
                  ),
                ),
              ),
            ),
          ),
          const Spacer()
        ],
      );
  int stage = 0;
  bool next = true;
  List<Widget> stages = [
    const Text(
      'Edit Task',
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18.0),
    ),
    const CircularProgressIndicator(
      color: Colors.white,
      strokeCap: StrokeCap.round,
    ),
    const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Done',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18.0),
        ),
        SizedBox(
          width: 4.0,
        ),
        Icon(
          Icons.check_rounded,
          color: Colors.white,
          size: 24.0,
        )
      ],
    ),
  ];

  void showSnackBar(String message) {
    SnackBar snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
