

import 'package:flutter/material.dart';

class CrossFade extends StatelessWidget {
  final double value;
  final Widget child;
  final Alignment direction;
  const CrossFade(
      {super.key,
        required this.value,
        required this.child,
        required this.direction});

  @override
  Widget build(BuildContext context) {
    return FractionalTranslation(
      translation: Offset(direction.x != 0 ? direction.x - value : 0.0,
          direction.y != 0 ? direction.y - value : 0.0),
      child: Opacity(
        opacity: value.clamp(0, 1),
        child: child,
      ),
    );
  }
}
