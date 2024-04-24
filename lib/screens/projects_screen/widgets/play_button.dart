import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manger/Constants/constants.dart';

class CirclePlay extends StatefulWidget {
  const CirclePlay({
    super.key,
  });

  @override
  State<CirclePlay> createState() => _CirclePlayState();
}

class _CirclePlayState extends State<CirclePlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool isPlaying = false;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        setState(() {
          isPlaying = true;
          isPlaying
              ? _animationController.forward()
              : _animationController.reverse();
        });
      },
      child: Container(
        height: height * 0.09,
        width: width * 0.12,
        //    margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: kBackgroundColor.withOpacity(0.5),
          // boxShadow: const [
          //   BoxShadow(
          //       blurStyle: BlurStyle.inner,
          //       color: kBackgroundColor,
          //       blurRadius: 4,
          //       spreadRadius: 2),
          // ]
        ),
        child: Center(
          child: AnimatedIcon(
            icon: AnimatedIcons.play_pause,
            progress: _animationController,
          ),
        ),
      ),
    );
  }
}
