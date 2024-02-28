import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../constants.dart';
import '../models/bar.dart';
import '../models/bar_data_model.dart';
import 'tag_widget.dart';

class ProductivityPart extends StatelessWidget {
  const ProductivityPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: tintBlack.withOpacity(0.3),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Daily Goal",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 15),
                      TagWidget(
                        color: kRed.withOpacity(0.5),
                        children: const [
                          Text("3/5 tasks"),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 100,
                    child: CircularPercentIndicator(
                      radius: 40,
                      lineWidth: 4.0,
                      startAngle: 110,
                      percent: 3 / 5,
                      progressColor: kRed,
                      center: const Text("LOGO"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const Text("You marked 3/5 tasks are done 🎉"),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {},
                clipBehavior: Clip.antiAlias,
                style: ElevatedButton.styleFrom(
                  backgroundColor: kMainColor,
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  foregroundColor: Colors.white,
                  shadowColor: kMainColor.withOpacity(0.5),
                  elevation: 10,
                ),
                child: const Text(
                  "Leftover Tasks",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: tintBlack.withOpacity(0.3),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              // Text("Completed in the last 7 Days"),
              SfCartesianChart(
                plotAreaBorderWidth: 0.2,
                title: const ChartTitle(
                  text: 'Completed in the last 7 Days',
                  textStyle: TextStyle(fontSize: 12),
                ),
                palette: const [kPriamaryColor, kMainColor],
                legend: const Legend(
                  isVisible: true,
                  position: LegendPosition.bottom,
                ),
                primaryXAxis: const CategoryAxis(
                  // minimum: DateTime.monday * 1.0,
                  // maximum: DateTime.sunday * 1.0,
                  // maximumLabels: 100,
                  majorGridLines: MajorGridLines(width: 0.3),
                  majorTickLines: MajorTickLines(size: 0),
                  axisLine: AxisLine(width: 0.3),
                ),
                primaryYAxis: const NumericAxis(
                  // minimum: 0,
                  // maximum: 20,
                  axisLine: AxisLine(width: 0.3),
                  majorGridLines: MajorGridLines(width: 0.3),
                  majorTickLines: MajorTickLines(size: 0),
                ),
                series: _getDefaultColumnSeries(),
                // tooltipBehavior: _tooltipBehavior,
              )
            ],
          ),
        )
      ],
    );
  }

  List<ColumnSeries<Bar, String>> _getDefaultColumnSeries() {
    return [
      ColumnSeries<Bar, String>(
        dataSource: BarDataModel.barsData,
        name: "Tasks",
        width: 0.3,
        xValueMapper: (Bar bar, _) => DateFormat('E').format(bar.dayX),
        yValueMapper: (Bar bar, _) => bar.numTasksY,
        dataLabelSettings: const DataLabelSettings(
          isVisible: true,
          textStyle: TextStyle(fontSize: 10),
        ),
      ),
    ];
  }
}
