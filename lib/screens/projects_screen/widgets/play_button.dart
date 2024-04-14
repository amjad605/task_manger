import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manger/Constants/constants.dart';

class CirclePlay extends StatefulWidget {
  const CirclePlay({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

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
    return GestureDetector(
        onTap: () {
          setState(() {
            isPlaying = !isPlaying;
            isPlaying
                ? _animationController.forward()
                : _animationController.reverse();
          });
        },
        child: Container(
            height: widget.height * 0.06,
            width: widget.width * 0.1,
            margin: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: kMainColor,
                boxShadow: [
                  BoxShadow(
                      blurStyle: BlurStyle.inner,
                      color: Color.fromARGB(149, 94, 93, 93),
                      blurRadius: 4,
                      spreadRadius: 2),
                ]),
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