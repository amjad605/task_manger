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
    graph: "assets/icons/sine blue.png",
    text: '8+ more\nfrom last week',
  ),
  Info(
    icon: Icons.assignment_outlined,
    title: 'Projects Done',
    graph: "assets/icons/sine red.png",
    text: '10+ more\nfrom last week',
  ),
  Info(
    icon: Icons.description_outlined,
    title: 'New Tasks',
    graph: "assets/icons/sine violet.png",
    text: '10+ more\nfrom last week',
  ),
];
