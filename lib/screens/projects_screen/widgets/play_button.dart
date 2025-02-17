import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger/Constants/constants.dart';
import 'package:task_manger/components/task_screen_components/show_toast.dart';
import 'package:task_manger/cubits/profile_cubit/profile_cubit.dart';
import 'package:task_manger/cubits/tasks/cubit.dart';
import 'package:task_manger/cubits/tasks/states.dart';
import 'package:task_manger/cubits/tasks/update/cubit/update_cubit.dart';

class CirclePlay extends StatefulWidget {
  CirclePlay(
      {super.key,
      required this.taskId,
      required this.started,
      required this.finshed});
  final String taskId;
  String? started;
  String? finshed;
  @override
  State<CirclePlay> createState() => _CirclePlayState();
}

class _CirclePlayState extends State<CirclePlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 450));

    widget.started != null
        ? _animationController.forward()
        : _animationController.reverse();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return BlocBuilder<UpdateCubit, UpdateState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () async {
            if (widget.finshed != null) {
              showToast(text: "task already finshed");
              return;
            }
            if (widget.started == null) {
              widget.started = DateTime.now().toString();
              showToast(text: "task started successfully ");
              _animationController.forward();
              BlocProvider.of<UpdateCubit>(context).updateTask(
                taskId: widget.taskId,
                taskData: {
                  "started_at": DateTime.now().toString(),
                  "user_id": [BlocProvider.of<ProfileCubit>(context).myUser!.id]
                },
              );
            } else {
              showToast(text: "task finshed successfully ");
              widget.finshed = DateTime.now().toIso8601String();
              _animationController.reverse();
              BlocProvider.of<UpdateCubit>(context).updateTask(
                taskId: widget.taskId,
                taskData: {
                  "finished_at": DateTime.now().toString(),
                  "user_id": [BlocProvider.of<ProfileCubit>(context).myUser!.id]
                },
              );
            }
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            height: widget.finshed == null ? width * 0.14 : height * 0.05,
            width: widget.finshed == null ? width * 0.14 : width * 0.25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              //  shape:
              //      widget.finshed == null ? BoxShape.circle : BoxShape.rectangle,
              color: widget.finshed == null
                  ? kBackgroundColor.withOpacity(0.5)
                  : kBackgroundColor,
            ),
            child: Center(
              child: widget.finshed != null
                  ? const Text("finshed")
                  : AnimatedIcon(
                      icon: AnimatedIcons.play_pause,
                      progress: _animationController,
                    ),
            ),
          ),
        );
      },
    );
  }
}
