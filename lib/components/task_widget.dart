import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../Constants/constants.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget(
      {super.key,
      required this.percent,
      required this.titleTask,
      required this.deadlineDate,
      required this.urlImages});
  final double percent;
  final String titleTask, deadlineDate;
  final List<String> urlImages;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //CircularPrecentage
          Expanded(
            flex: 2,
            child: CircularPercentIndicator(
              animation: true,
              rotateLinearGradient: false,
              backgroundColor: kMainColor.withOpacity(0.3),
              radius: 35,
              lineWidth: 3,
              percent: percent,
              progressColor: kLightblue,
              center: Text("${((percent) * 100).toInt()}%"),
            ),
          ),
          const SizedBox(width: 15),
          //Texts of tasks
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titleTask,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Deadline:$deadlineDate",
                  style: const TextStyle(fontSize: 10),
                ),
              ],
            ),
          ),
          //  friends
          Expanded(
            flex: 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i = 0; i < urlImages.length; i++)
                  Align(
                    widthFactor: 1 / urlImages.length,
                    child: CircleAvatar(
                      radius: 21,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(
                          urlImages[i],
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
