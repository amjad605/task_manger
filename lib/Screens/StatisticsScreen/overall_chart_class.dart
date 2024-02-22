class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double? y;
}

final List<ChartData> monthlyData1 = [
  ChartData('May', 35),
  ChartData('Jun', 13),
  ChartData('Jul', 34),
  ChartData('Aug', 27),
  ChartData('Sep', 40)
];

final List<ChartData> monthlyData2 = [
  ChartData('May', 40),
  ChartData('Jun', 9),
  ChartData('Jul', 45),
  ChartData('Aug', 17),
  ChartData('Sep', 10)
];

List<ChartData> dailyData1 = [
  ChartData("01:00", 10),
  ChartData("03:00", 20),
  ChartData("06:00", 15),
  ChartData("09:00", 30),
  ChartData("12:00", 25)
];

List<ChartData> dailyData2 = [
  ChartData("01:00", 15),
  ChartData("03:00", 10),
  ChartData("06:00", 5),
  ChartData("09:00", 35),
  ChartData("12:00", 40)
];

List<ChartData> weeklyData1 = [
  ChartData("Mon", 30),
  ChartData("Tue", 40),
  ChartData("Wed", 50),
  ChartData("Thu", 45),
  ChartData("Fri", 60)
];

List<ChartData> weeklyData2 = [
  ChartData("Mon", 40),
  ChartData("Tue", 30),
  ChartData("Wed", 60),
  ChartData("Thu", 55),
  ChartData("Fri", 65)
];
