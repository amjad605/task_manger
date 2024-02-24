import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../Constants/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String name = "User Name", mail = "e-mail@gmail.com";

    return ListView(
      children: [
        SizedBox(
          height: 10,
        ),
        AppBar(
          leading: SizedBox(),
          title: Text(
            "Profile",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white70,
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {},
              child: Icon(
                Icons.edit,
                color: kMainColor,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: kItemsBackgroundColor,
              ),
            ),
            SizedBox(width: 14)
          ],
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        SizedBox(height: 20),
        CircleAvatar(
          radius: 70.0, // Set your desired radius
          child: ClipOval(
            child: Image.asset(
              "Assets/images/Profile_pic.png",
            ),
          ),
        ),
        SizedBox(height: 20),
        Text(
          name,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 2,),
        Text(
          mail,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
        ),

      ],
    );
  }
}
