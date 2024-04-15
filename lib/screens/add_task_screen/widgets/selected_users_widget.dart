import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/user.dart';

class SelectedUsersWidget extends StatefulWidget {
  final List<User> users;
  const SelectedUsersWidget({super.key, required this.users});

  @override
  State<SelectedUsersWidget> createState() => _SelectedUsersWidgetState();
}

class _SelectedUsersWidgetState extends State<SelectedUsersWidget> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return SizedBox(
      height: screenSize.height * .1,
      child: ShaderMask(
        shaderCallback: (bounds) => const LinearGradient(
          colors: [
            Colors.transparent,
            Colors.transparent,
            Colors.white,
          ],
          stops: [0, 0.9, 1],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ).createShader(bounds),
        blendMode: BlendMode.dstOut,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: widget.users.length,
          padding: EdgeInsets.only(right: screenSize.width * .03),
          separatorBuilder: (context, index) => const SizedBox(
            width: 8.0,
          ),
          itemBuilder: (context, index) => SizedBox(
            width: 50,
            height: 80,
            child: _userWidget(widget.users[index]),
          ),
        ),
      ),
    );
  }

  _userWidget(User user) => Container(
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
          child: Stack(
            alignment: Alignment.center,
            fit: StackFit.expand,
            children: [
              Image.asset(
                user.image,
                fit: BoxFit.cover,
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                child: Container(
                  color: Colors.black12,
                  alignment: Alignment.center,
                  child: FittedBox(
                    child: Transform.scale(
                      scale: .5,
                      child: Text(
                        user.name[0].toUpperCase(),
                        style: const TextStyle(
                            fontSize: 100,
                            color: Colors.white,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
}
