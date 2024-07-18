import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:task_manger/Constants/constants.dart';
import 'package:task_manger/models/task_model.dart';

class TaskDetailBody extends StatelessWidget {
  const TaskDetailBody({super.key, required this.task});
  final Data task;
  @override
  Widget build(BuildContext context) {
    DateTime createdAtdate = DateTime.parse(task.createdAt!);
    DateTime deadLinedate = DateTime.parse(task.deadline!);
    String formattedCreatedAtdate = DateFormat('dd MMM').format(createdAtdate);
    String formattedDeadLinedate = DateFormat('dd MMM').format(deadLinedate);
    var height = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.black,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
              top: height * 0.35,
              right: 0,
              bottom: 10,
              left: 0,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            //shrinkWrap: true,
                            //   reverse: true,
                            itemCount: task.subTasks.length,
                            itemBuilder: (ctx, indx) => SubTask(
                                  title: task.subTasks[indx],
                                )),
                      ),
                    ],
                  ),
                ),
              )),
          Positioned(
            right: 0,
            //  top: 0,
            left: 0,
            child: Container(
              width: double.infinity,
              // height: 200,
              decoration: BoxDecoration(
                  color: kMainColor, borderRadius: BorderRadius.circular(30)),
              child: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${task.description!} ",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_month,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "${formattedCreatedAtdate}",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.alarm,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "${formattedDeadLinedate}",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 55,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                              child: ListView.separated(
                                  //   physics: NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (ctx, indx) => CircleAvatar(
                                        radius: 35,
                                        backgroundColor: kLightblue,
                                        child: CircleAvatar(
                                          backgroundColor: kMainColor,
                                          radius: 25,
                                          child: Image.asset(
                                            "assets/images/Daco_5969784.png",
                                            scale: 9,
                                          ),
                                        ),
                                      ),
                                  separatorBuilder: (ctx, indx) =>
                                      const SizedBox(
                                        width: 1,
                                      ),
                                  itemCount: 3),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SubTask extends StatefulWidget {
  const SubTask({
    super.key,
    required this.title,
  });
  final String title;
  @override
  State<SubTask> createState() => _SubTaskState();
}

class _SubTaskState extends State<SubTask> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: kItemsBackgroundColor.withOpacity(0.6),
          border: Border.all(color: Color.fromARGB(134, 82, 80, 80)),
          borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: TextStyle(fontSize: 18),
            ),
            // Checkbox.adaptive(
            //     activeColor: kLightblue,
            //     checkColor: Colors.black,
            //     tristate: true,
            //     fillColor: MaterialStateProperty.resolveWith<Color>(
            //         (Set<MaterialState> states) {
            //       if (states.contains(MaterialState.disabled)) {
            //         return kLightblue.withOpacity(.32);
            //       }
            //       return kLightblue;
            //     }),
            //     shape: const CircleBorder(),
            //     value: isChecked,
            //     onChanged: (value) {
            //       setState(() {
            //         isChecked = value ?? false;
            //       });
            //     })
          ],
        ),
      ),
    );
  }
}
