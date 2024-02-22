import 'package:flutter/material.dart';

class Info {
  final IconData icon;
  final String title;
  final String graph;
  final String text;

  Info({
    required this.icon,
    required this.title,
    required this.graph,
    required this.text,
  });
}

List<Info> info = [
  Info(
    icon: Icons.star_border_outlined,
    title: 'Tasks Completed',
    graph:
        "Assets/Icons/sine blue.png",
    text: '8+ more\nfrom last week',
  ),
  Info(
    icon: Icons.assignment_outlined,
    title: 'Projects Done',
    graph:
        "Assets/Icons/sine red.png",
    text: '10+ more\nfrom last week',
  ),
  Info(
    icon: Icons.description_outlined,
    title: 'New Tasks',
    graph:
        "Assets/Icons/sine violet.png",
    text: '10+ more\nfrom last week',
  ),
];
