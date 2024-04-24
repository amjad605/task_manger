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
          Positioned(
              top: height * 0.3,
              right: 0,
              bottom: 0,
              left: 0,
              child: Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                          itemCount: 3, itemBuilder: (ctx, indx) => SubTask())),
                ],
              )),
          Positioned(
            top: 0,
            bottom: height * 0.48,
            right: 0,
            left: 0,
            child: Container(
              decoration: BoxDecoration(
                  color: kMainColor, borderRadius: BorderRadius.circular(30)),
              child: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${task.description!} ",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
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
                      Row(
                        children: [
                          for (int i = 0; i < 4; i++)
                            i == 3
                                ? Align(
                                    widthFactor: 1 / 2,
                                    child: CircleAvatar(
                                      radius: 22.r,
                                      backgroundColor: Colors.white,
                                      child: CircleAvatar(
                                          radius: 20.r,
                                          backgroundColor:
                                              kItemsBackgroundColor,
                                          child: IconButton(
                                            icon: Icon(Icons.add),
                                            onPressed: () {},
                                          )),
                                    ))
                                : Align(
                                    widthFactor: 1 / 2,
                                    child: CircleAvatar(
                                      radius: 22.r,
                                      backgroundColor: Colors.white,
                                      child: CircleAvatar(
                                        radius: 20.r,
                                        backgroundImage: const AssetImage(
                                          "assets/images/Person_1.png",
                                        ),
                                      ),
                                    )),
                        ],
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
  });

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
            const Text(
              "Sub Task 1 ",
              style: TextStyle(fontSize: 18),
            ),
            Checkbox.adaptive(
                activeColor: kLightblue,
                checkColor: Colors.black,
                tristate: true,
                fillColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return kLightblue.withOpacity(.32);
                  }
                  return kLightblue;
                }),
                shape: const CircleBorder(),
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value ?? false;
                  });
                })
          ],
        ),
      ),
    );
  }
}
