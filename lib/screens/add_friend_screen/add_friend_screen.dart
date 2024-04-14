import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manger/Constants/constants.dart';
import 'package:task_manger/models/user_model.dart';
import 'package:task_manger/screens/add_friend_screen/widgets/add_friend_item.dart';
import '../../cubits/add_friend_cubit/add_friend_cubit.dart';
import '../friends_screen/widgets/friend_item.dart';

class AddFriendScreen extends StatelessWidget {
  AddFriendScreen({Key? key}) : super(key: key);
  User? user = User(
      id: "1",
      name: "Guest",
      email: "guest@gmail.com",
      active: false,
      tasks: [],
      categories: [],
      v: 1);
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Add Friend",
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: mainFont),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<AddFriendCubit, AddFriendState>(
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(height: 10.h),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                height: 60.h,
                decoration: BoxDecoration(
                  color: kItemsBackgroundColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: TextFormField(
                    onChanged: (value) {
                      user!.name = controller.text;
                      BlocProvider.of<AddFriendCubit>(context).Searching();
                    },
                    controller: controller,
                    cursorColor: kPriamaryColor,
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontFamily: mainFont),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.transparent,
                      )),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: kPriamaryColor)),
                      label: Text(
                        "Search",
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.white,
                            fontFamily: mainFont),
                      ),
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              controller.text.isEmpty
                  ? SizedBox()
                  : Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) => AddFriendItem(
                                user: user ??
                                    User(
                                        id: "1",
                                        name: "Guest",
                                        email: "guest@gmail.com",
                                        active: false,
                                        tasks: [],
                                        categories: [],
                                        v: 1),
                              ),
                          separatorBuilder: (context, index) => SizedBox(
                                height: 18.h,
                              ),
                          itemCount: 1),
                    )
            ],
          );
        },
      ),
    );
  }
}
