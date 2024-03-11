import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:task_manger/Constants/constants.dart';
import 'package:task_manger/Screens/StatisticsScreen/overall_chart_class.dart';
import 'package:task_manger/Screens/StatisticsScreen/overall_info_class.dart';
import 'package:task_manger/cubits/statistics_screen_states.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StatisticsCubit(),
      child: StatisticsScreenContent(),
    );
  }
}

class StatisticsScreenContent extends StatelessWidget {
  const StatisticsScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatisticsCubit, int>(
      builder: (context, selectedIndex) {
        final screenWidth = MediaQuery.of(context).size.width;
        final screenHeight = MediaQuery.of(context).size.height;
        List<List<ChartData>> data1 = [
          weeklyData1,
          monthlyData1,
          dailyData1,
        ];
        List<List<ChartData>> data2 = [weeklyData2, monthlyData2, dailyData2];
        List<String> titles = ["Weekly", "Monthly", "Daily"];

        return Column(
          children: [
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     children: [
            //       Row(
            //         children: [
            //           for (var i in info)
            //             Padding(
            //               padding: const EdgeInsets.all(10),
            //               child: buildItem(i, screenWidth, screenHeight),
            //             ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.00),
              child: SizedBox(
                child: Container(
                  width: screenWidth,
                  height: screenHeight * 0.5,
                  decoration: BoxDecoration(
                      // color: kItemsBackgroundColor,
                      //  borderRadius: BorderRadius.circular(30),
                      ),
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Tasks Done",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth * 0.04,
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.05,
                            ),
                            SizedBox(
                              height: screenHeight * 0.07,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  for (var index = 0;
                                      index < titles.length;
                                      index++)
                                    TextButton(
                                      onPressed: () {
                                        context
                                            .read<StatisticsCubit>()
                                            .updateSelectedIndex(index);
                                      },
                                      style: ButtonStyle(
                                        overlayColor: MaterialStateProperty
                                            .resolveWith<Color?>(
                                          (states) {
                                            return index == selectedIndex
                                                ? kLightblue.withOpacity(0.1)
                                                : null;
                                          },
                                        ),
                                      ),
                                      child: Text(
                                        titles[index],
                                        style: TextStyle(
                                          color: index == selectedIndex
                                              ? kLightblue
                                              : Colors.white,
                                          fontSize: screenWidth * 0.03,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            )
                          ],
                        ),
                        //   const Spacer(),
                        Expanded(
                          child: SfCartesianChart(
                            plotAreaBorderWidth: 0,
                            primaryXAxis: const CategoryAxis(
                              // majorGridLines: MajorGridLines(width: 0.3),
                              //majorTickLines: MajorTickLines(size: 0),
                              majorGridLines: MajorGridLines(
                                  width: 0,
                                  color: Color.fromRGBO(69, 69, 73, 0.546)),
                            ),
                            legend: const Legend(
                                iconBorderWidth: 2,
                                isVisible: true,
                                position: LegendPosition.bottom),
                            series: [
                              SplineSeries<ChartData, String>(
                                dataSource: data1[selectedIndex],
                                name: "Projects",
                                splineType: SplineType.cardinal,
                                cardinalSplineTension: 0.9,
                                color: kMainColor,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y!,
                                markerSettings: const MarkerSettings(
                                  color: kMainColor,
                                  borderColor: kMainColor,
                                  isVisible: true,
                                ),
                              ),
                              SplineSeries<ChartData, String>(
                                dataSource: data2[selectedIndex],
                                name: "Tasks",
                                splineType: SplineType.cardinal,
                                cardinalSplineTension: 0.9,
                                color: kLightblue,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y!,
                                markerSettings: const MarkerSettings(
                                    isVisible: true,
                                    color: kLightblue,
                                    borderColor: kLightblue),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

Widget buildItem(Info i, final screenWidth, final screenHeight) {
  return SizedBox(
    width: screenWidth * 0.56,
    height: screenHeight * 0.25,
    child: Container(
      decoration: BoxDecoration(
        color: kItemsBackgroundColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.02),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(screenWidth * 0.02),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(38, 38, 42, 0.827),
                    ),
                    padding: EdgeInsets.all(screenWidth * 0.02),
                    child: Icon(
                      i.icon,
                      size: screenWidth * 0.05,
                    ),
                  ),
                ),
                Text(
                  i.title,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.03,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: Color.fromRGBO(38, 38, 42, 0.827),
            indent: 15,
            endIndent: 15,
          ),
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.02),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(i.graph),
                  width: screenWidth * 0.3,
                  height: screenHeight * 0.1,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        i.text,
                        style: TextStyle(
                          color: const Color.fromARGB(154, 255, 255, 255),
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.025,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
