import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:task_manger/Constants/constants.dart';
import 'package:task_manger/Screens/StatisticsScreen/overall_chart_class.dart';
import 'package:task_manger/Screens/StatisticsScreen/overall_info_class.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kItemsBackgroundColor,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Row(
                    children: [
                      for (var i in info)
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: buildItem(i, screenWidth, screenHeight),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.03),
              child: SizedBox(
                width: screenWidth,
                height: screenHeight * 0.6,
                child: Container(
                  decoration: BoxDecoration(
                    color: kItemsBackgroundColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth * 0.055),
                    child: Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tasks Done",
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth * 0.04,
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          SfCartesianChart(
                            primaryXAxis: const CategoryAxis(
                              majorGridLines:MajorGridLines(width: 0, color: Color.fromRGBO(69, 69, 73, 0.546)),
                            ),
                            legend: const Legend(
                                isVisible: true,
                                position: LegendPosition.bottom),
                            series: <CartesianSeries>[
                              SplineSeries<ChartData, String>(
                                  dataSource: chartData1,
                                  name: "Projects",
                                  splineType: SplineType.cardinal,
                                  cardinalSplineTension: 0.9,
                                  color: kMainColor,
                                  xValueMapper: (ChartData data, _) => data.x,
                                  yValueMapper: (ChartData data, _) => data.y!,
                                  markerSettings:
                                      const MarkerSettings(isVisible: true)),
                              SplineSeries<ChartData, String>(
                                  dataSource: chartData2,
                                  name: "Tasks",
                                  splineType: SplineType.cardinal,
                                  cardinalSplineTension: 0.9,
                                  color: kLightblue,
                                  xValueMapper: (ChartData data, _) => data.x,
                                  yValueMapper: (ChartData data, _) => data.y!,
                                  markerSettings:
                                      const MarkerSettings(isVisible: true)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildItem(Info i, final screenWidth, final screenHeight) {
  return SizedBox(
    width: screenWidth * 0.56,
    height: screenHeight * 0.28,
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
