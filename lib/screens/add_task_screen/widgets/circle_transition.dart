import 'dart:math';

import 'package:flutter/material.dart';

class CircleTransition extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;
  final Offset startingPoint;
  final double startingRadius;
  const CircleTransition(
      {super.key,
      required this.animation,
      required this.child,
      required this.startingPoint,
      this.startingRadius = 0.0});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    Animation<Offset> offsetAnimation = Tween(
            begin: startingPoint,
            end: Offset(screenSize.width / 2, screenSize.height / 2))
        .animate(CurvedAnimation(parent: animation, curve: Curves.easeOut));
    Animation<double> sizeAnimation =
        CurvedAnimation(parent: animation, curve: Curves.easeOut);
    return ClipRRect(
      clipper: CircleClipper(
          sizeAnimation: sizeAnimation, offsetAnimation: offsetAnimation),
      child: child,
    );
  }
}

class CircleClipper extends CustomClipper<RRect> {
  final Animation<double> sizeAnimation;
  final Animation<Offset> offsetAnimation;

  CircleClipper({required this.sizeAnimation, required this.offsetAnimation})
      : super(reclip: sizeAnimation);

  @override
  RRect getClip(Size size) {
    final radius = sqrt(pow(size.width, 2) + pow(size.height, 2)) *
        sizeAnimation.value *
        .5;
    return RRect.fromRectAndRadius(
        Rect.fromCircle(center: offsetAnimation.value, radius: radius),
        Radius.circular(radius));
  }

  @override
  bool shouldReclip(covariant CustomClipper<RRect> oldClipper) => true;
}
