import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_manger/Constants/constants.dart';

class TaskDetailBody extends StatelessWidget {
  const TaskDetailBody({super.key});

  @override
  Widget build(BuildContext context) {
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
              child: ListView.builder(itemBuilder: (ctx, indx) => SubTask())),
          Positioned(
            top: 0,
            bottom: height * 0.6,
            right: 0,
            left: 0,
            child: Container(
              decoration: BoxDecoration(
                  color: kMainColor, borderRadius: BorderRadius.circular(30)),
              child: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40.0, vertical: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Creating Flutter Project and Work on it ",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Row(
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
                                "Date : 21 nov",
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
                                "Date : 21 nov",
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ],
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
                                        width: 5,
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
          border: Border.all(color: Color.fromARGB(134, 82, 80, 80)),
          borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: EdgeInsets.all(18.0),
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
