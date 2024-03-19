import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:task_manger/screens/add_task_screen/models/task.dart';
import 'package:task_manger/screens/add_task_screen/models/user.dart';
import 'package:task_manger/screens/add_task_screen/pages/user_selection_page.dart';

import '../../../constants.dart';
import '../widgets/cross_fade.dart';
import '../widgets/date_time.dart';
import '../widgets/sequence_animation_builder.dart';

final PageController pageController = PageController(initialPage: 1);

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  bool built = false;
  bool assigningScreen = false;
  final SequenceAnimationController _animationController =
      SequenceAnimationController();

  final _categoryController = TextEditingController();
  final _titleController = TextEditingController();
  DateTime _date = DateTime.now();
  TimeOfDay _time = TimeOfDay.now();
  List<User> _users = [];
  @override
  Widget build(BuildContext context) {
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
                opacity: Curves.easeOut.transform(route!.animation!.value),
                child: Container(
                  color: kBackgroungColor,
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
                                padding: EdgeInsets.symmetric(
                                    vertical:
                                        MediaQuery.of(context).padding.top *
                                            1.5,
                                    horizontal: 24.0),
                                child: OverflowBox(
                                  maxHeight: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Stack(
                                        children: [
                                          Positioned(
                                            top: 4.0,
                                            child: CrossFade(
                                              direction: Alignment.centerRight,
                                              value: Curves.easeOut
                                                  .transform(values[1]),
                                              child: GestureDetector(
                                                onTap:
                                                    Navigator.of(context).pop,
                                                child: Container(
                                                  color: Colors.transparent,
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: const Icon(
                                                    Icons.arrow_back_rounded,
                                                    color: kBackgroungColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.center,
                                            child: CrossFade(
                                              direction: Alignment.bottomCenter,
                                              value: Curves.easeOut
                                                  .transform(values[1]),
                                              child: const Text('Add Task',
                                                  style: TextStyle(
                                                      color: kBackgroungColor,
                                                      fontSize: 24.0,
                                                      fontWeight:
                                                          FontWeight.w700)),
                                            ),
                                          )
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CrossFade(
                                            value: Curves.easeOut
                                                .transform(values[2]),
                                            direction: Alignment.bottomCenter,
                                            child: const Text(
                                              'Category',
                                              style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 12.0,
                                          ),
                                          FractionallySizedBox(
                                            widthFactor: Curves.easeOut
                                                .transform(values[2]),
                                            alignment:
                                                FractionalOffset.centerLeft,
                                            child: Opacity(
                                              opacity: Curves.easeOut
                                                  .transform(values[2]),
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 24.0,
                                                          vertical: 20.0),
                                                  hintText: 'UI/UX Design',
                                                  hintStyle: const TextStyle(
                                                      color: Colors.black54,
                                                  fontWeight: FontWeight.w300),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0)),
                                                ),
                                                textInputAction: TextInputAction.next,
                                                controller: _categoryController,
                                                style: const TextStyle(
                                                    color: Colors.black87),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CrossFade(
                                            value: Curves.easeOut
                                                .transform(values[2]),
                                            direction: Alignment.bottomCenter,
                                            child: const Text(
                                              'Title',
                                              style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 12.0,
                                          ),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: FractionallySizedBox(
                                              widthFactor: Curves.easeOut
                                                  .transform(values[2]),
                                              child: Opacity(
                                                opacity: Curves.easeOut
                                                    .transform(values[2]),
                                                child: TextFormField(
                                                  decoration: InputDecoration(
                                                    contentPadding:
                                                        const EdgeInsets
                                                            .symmetric(
                                                            horizontal: 24.0,
                                                            vertical: 20.0),
                                                    hintText:
                                                        'Make Grocery Apps UI Design',
                                                    hintStyle:
                                                        const TextStyle(
                                                            color:
                                                                Colors.black54,
                                                            fontWeight: FontWeight.w300),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    16.0)),
                                                  ),
                                                  controller: _titleController,
                                                  style: const TextStyle(
                                                      color: Colors.black87),
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
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CrossFade(
                                                  value: Curves.easeOut
                                                      .transform(values[3]),
                                                  direction:
                                                      Alignment.bottomCenter,
                                                  child: const Text(
                                                    'Date',
                                                    style: TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 12.0,
                                                ),
                                                FractionallySizedBox(
                                                  widthFactor: Curves.easeOut
                                                      .transform(values[3]),
                                                  alignment: FractionalOffset
                                                      .centerLeft,
                                                  child: Opacity(
                                                      opacity: Curves.easeOut
                                                          .transform(values[3]),
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
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CrossFade(
                                                  value: Curves.easeOut
                                                      .transform(values[3]),
                                                  direction:
                                                      Alignment.bottomCenter,
                                                  child: const Text(
                                                    'Time',
                                                    style: TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 12.0,
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: FractionallySizedBox(
                                                    widthFactor: Curves.easeOut
                                                        .transform(values[3]),
                                                    child: Opacity(
                                                        opacity: Curves.easeOut
                                                            .transform(
                                                                values[3]),
                                                        child: Time(
                                                          onSelectTime:
                                                              (newTime) =>
                                                                  _time =
                                                                      newTime,
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
                                    Expanded(child: GridView.builder(
                                      itemCount: _users.length + 1,
                                      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 6,
                                        mainAxisSpacing: 12.0,
                                        crossAxisSpacing: 12.0,
                                        childAspectRatio: .5
                                      ),
                                      padding: EdgeInsets.zero,
                                      itemBuilder: (context, index) => index == _users.length ?  _addButton(values[4]):_userWidget(_users[index]),),
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
                                  onTap: () async{
                                    if (_categoryController.text.isEmpty) {
                                      showSnackBar('Enter valid category');
                                      return;
                                    }
                                    if (_titleController.text.isEmpty) {
                                      showSnackBar('Enter valid title');
                                      return;
                                    }
                                    setState(() {
                                      next = true;
                                      stage = 1;
                                    });
                                    Task task = Task(
                                        category: _categoryController.text,
                                        title: _titleController.text,
                                        date: DateTime(
                                            _date.year,
                                            _date.month,
                                            _date.day,
                                            _time.hour,
                                            _time.minute),
                                        users: _users);

                                    // TODO: Replace timers with async functions to load data from database

                                    await Future.delayed(const Duration(milliseconds: 1000) );
                                    setState(() {
                                      next = true;
                                      stage = 2;
                                    });
                                    await Future.delayed(const Duration(milliseconds: 1000) );
                                    print(task);
                                    Navigator.pop(context);
                                  },
                                  child: Center(
                                    child: AnimatedContainer(
                                      duration: const Duration(milliseconds: 400),
                                      height: screenSize.height * .075,
                                      width: stage == 1 ?screenSize.height * .075 : screenSize.width,
                                      decoration: BoxDecoration(
                                          color: stage == 2 ? Colors.green : kMainColor,
                                          borderRadius: BorderRadius.circular(
                                              screenSize.width)),
                                      margin: EdgeInsets.symmetric(
                                          vertical:
                                              MediaQuery.of(context).padding.top *
                                                  1.5,
                                          horizontal: 24.0),

                                      alignment: Alignment.center,
                                      clipBehavior:Clip.antiAlias,
                                      child: AnimatedSwitcher(
                                        duration: const Duration(milliseconds: 400),
                                        child: stages[stage]
                                      ),
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
            fontSize: 10.0 ,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ],
  );

  _addButton(value) =>  Column(
    children: [
      Expanded(
        flex: 2,
        child: Center(
          child: GestureDetector(
            onTap: () {
              pageController.animateToPage(0,
                  duration: const Duration(
                      milliseconds: 500),
                  curve: Curves.easeOut);
            },
            child: FractionalTranslation(
              translation: Offset(
                  4 -
                      (Curves.easeOutBack
                          .transform(value) *
                          4),
                  0.0),
              child: Transform.rotate(
                angle: pi *
                    Curves.easeIn
                        .transform(value),
                child: Opacity(
                    opacity: Curves.easeOutQuad
                        .transform(value),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Colors.lightGreen,
                              width: 2.0),
                        ),
                        padding:
                        const EdgeInsets.all(8.0),
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
      'Create Task',
      style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 18.0),
    ),
    const CircularProgressIndicator(color: Colors.white ,strokeCap: StrokeCap.round,),
    const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Done',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 18.0),
        ),
        SizedBox(width: 4.0,),
        Icon(Icons.check_rounded,color: Colors.white, size: 24.0,)
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
