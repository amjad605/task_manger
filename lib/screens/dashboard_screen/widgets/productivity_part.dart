import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:task_manger/Constants/constants.dart';
import 'package:task_manger/screens/StatisticsScreen/statistics_screen.dart';
import '../models/bar.dart';
import '../models/bar_data_model.dart';

class ProductivityPart extends StatelessWidget {
  const ProductivityPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: tintBlack.withOpacity(0.3),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              // Text("Completed in the last 7 Days"),
              Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                child: SfCartesianChart(
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
                ),
              ),
              const StatisticsScreen()
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
