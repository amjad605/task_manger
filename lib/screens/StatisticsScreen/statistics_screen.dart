import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:task_manger/cubits/statistics_screen_states.dart';
import '../../Api/api_servies.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StatisticsCubit(ApiService()),
      child: const StatisticsScreenContent(),
    );
  }
}

class StatisticsScreenContent extends StatelessWidget {
  const StatisticsScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatisticsCubit, TaskStatistics>(
      builder: (context, taskStatistics) {
        if (taskStatistics.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        final screenWidth = MediaQuery.of(context).size.width;
        final screenHeight = MediaQuery.of(context).size.height;

        List<ChartData> chartData = [
          ChartData('In Progress', taskStatistics.inProgress),
          ChartData('Finished', taskStatistics.finished),
          ChartData('Deadline within 3 days', taskStatistics.deadline),
        ];

        return Column(
          children: [
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.00),
              child: SizedBox(
                width: screenWidth,
                height: screenHeight * 0.5,
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Tasks Status",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth * 0.04,
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                      Expanded(
                        child: SfCircularChart(
                          legend: const Legend(
                            isVisible: true,
                            position: LegendPosition.bottom,
                          ),
                          series: <CircularSeries>[
                            PieSeries<ChartData, String>(
                              dataSource: chartData,
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y,
                              radius: '94%',
                              dataLabelSettings: DataLabelSettings(
                                isVisible: true,
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenWidth * 0.04,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final int y;
}