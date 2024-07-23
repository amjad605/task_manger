import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:task_manger/Constants/constants.dart';
import 'package:task_manger/cubits/friends/friends_cubit.dart';
import 'package:task_manger/models/user_model.dart';
import 'package:task_manger/screens/add_task_screen/models/user.dart';
import 'package:task_manger/screens/add_task_screen/widgets/selected_users_widget.dart';

import 'add_task_screen.dart';

class UsersSelectionPage extends StatefulWidget {
  final List<Friend> initialUsers;
  final Function(List<Friend> selectedUsers) callback;
  const UsersSelectionPage(
      {super.key, required this.initialUsers , required this.callback,  this.selectedID=const[]});
final List<String> selectedID;
  @override
  State<UsersSelectionPage> createState() => _UsersSelectionPageState();
}

class _UsersSelectionPageState extends State<UsersSelectionPage> {
  List<Friend> allUsers = [];
  List<Friend> currentUsers = [];

  List<Friend> selectedUsers = [];
  Timer? _timer;
  bool isLoading = false;

  @override
  void initState() {
    BlocProvider.of<FriendsCubit>(context).getMyFriends();
    super.initState();
    currentUsers = allUsers;
    selectedUsers = widget.initialUsers;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return BlocBuilder<FriendsCubit, FriendsState>(
      builder: (context, state) {
       if(state is GetMyFriendsSuccessState) {
        currentUsers=state.Friends;
       selectedUsers.addAll(currentUsers.where((user) => 
        widget.selectedID.contains(user.id)).toList());
        return SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Search name...',
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 12.0),
                          hintStyle: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w300),
                        ),
                        onChanged: (value) {
                          setState(() {
                            isLoading = true;
                          });
                          // TODO: Replace with the async function that searches users from database
                          // Timer is only demonstration
                          if (_timer != null) {
                            _timer!.cancel();
                          }
                          _timer = Timer(const Duration(milliseconds: 500), () {
                            setState(() {
                              isLoading = false;
                              if (value.isEmpty) {
                                currentUsers = allUsers;
                              } else {
                                currentUsers = allUsers
                                    .where((element) => element.name!
                                        .toLowerCase()
                                        .contains(value.toLowerCase()))
                                    .toList();
                              }
                            });
                          });
                        },
                      ),
                      Expanded(
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 800),
                          child: isLoading
                              ? const SizedBox()
                              : GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    childAspectRatio: .7,
                                    crossAxisSpacing: 24.0,
                                    mainAxisSpacing: 24.0,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 32.0),
                                  itemCount: currentUsers.length,
                                  itemBuilder: (context, index) =>
                                      GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (selectedUsers
                                            .any((user) => user.id == currentUsers[index].id)) {
                                         selectedUsers.removeWhere((user) => user.id == currentUsers[index].id);
                                        } else {
                                          selectedUsers
                                              .add(currentUsers[index]);
                                        }
                                        widget.callback.call(selectedUsers);
                                      });
                                    },
                                    child: _userWidget(currentUsers[index],
                                        isSelected: selectedUsers
                                        .any((user) => user.id == currentUsers[index].id)),
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      Expanded(
                          child: SelectedUsersWidget(users: selectedUsers)),
                      GestureDetector(
                        onTap: () => pageController.animateToPage(1,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeOut),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(screenSize.width),
                              color: Colors.green),
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 24),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Done',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    fontSize: 16.0),
                              ),
                              SizedBox(
                                width: 12.0,
                              ),
                              Icon(
                                Icons.check_rounded,
                                color: Colors.white,
                                size: 20.0,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }
      else if(state is GetMyFriendsFailureState){
        return const Center(child: Text("Something Went Wrong"),);
      }
      else{
          return Center(
            child: LoadingAnimationWidget.twistingDots(
                leftDotColor: kMainColor, rightDotColor: kLightblue, size: 30),
          );
      }
  },
    );
  }

  _userWidget(Friend user, {bool isSelected = false}) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Transform.scale(
            scale: .9,
            child: AspectRatio(
                aspectRatio: 1.0,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned.fill(
                      child: Container(
                          clipBehavior: Clip.antiAlias,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey
                          ),
                          child: Text(
                            user.name![0].toUpperCase(),
                          style: TextStyle(
                            fontSize: 35.sp,
                            color: Colors.white,
                            ),
                          )
                          ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: AnimatedScale(
                        duration:
                            Duration(milliseconds: isSelected ? 400 : 200),
                        scale: isSelected ? 1.0 : 0.0,
                        alignment: Alignment.center,
                        curve: isSelected ? Curves.easeOutBack : Curves.easeOut,
                        child: Container(
                          height: 36,
                          width: 36,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.green),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(4.0),
                          child: const FittedBox(
                            child: Icon(Icons.check_rounded),
                          ),
                        ),
                      ),
                    )
                  ],
                )),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Expanded(
            child: Text(
              user.name!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      );
}
