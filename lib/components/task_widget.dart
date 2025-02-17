import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Constants/constants.dart';

class TaskWidget extends StatelessWidget {
  final String title;
  final String? body;
  final String deadlineDate;
  final String startDate;
  final bool isfinished;
  const TaskWidget({
    required this.title,
    this.body,
    this.isfinished = false,
    Key? key,
    required this.deadlineDate,
    required this.startDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: tintBlack,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 250.w,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Visibility(
                visible: isfinished,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white.withOpacity(0.5),
                  ),
                  child: const CircleAvatar(
                    backgroundColor: kMainColor,
                    radius: 10,
                    child: Icon(
                      Icons.done,
                      size: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            body ??
                """For now, there is no description. You can edit your task and provide a description.""",
            style:
                TextStyle(color: Colors.white.withOpacity(.75), fontSize: 14),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "$startDate - ",
                style: const TextStyle(
                  color: kMainColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                deadlineDate,
                style: const TextStyle(
                  color: kMainColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
