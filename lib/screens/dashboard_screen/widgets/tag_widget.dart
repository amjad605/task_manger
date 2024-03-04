import 'package:flutter/material.dart';
import 'package:task_manger/Constants/constants.dart';

class TagWidget extends StatelessWidget {
  const TagWidget(
      {super.key, this.color, required this.children, this.onTap, this.size});
  final Color? color;
  final List<Widget> children;
  final void Function()? onTap;
  final Size? size;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      child: AnimatedContainer(
        width: size != null ? size!.width : 100,
        height: size != null ? size!.height : 40,
        duration: Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }
}
