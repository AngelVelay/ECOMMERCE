// import 'package:esmanagement/app/widgets/chart/chartContainer.widget.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';

// // ignore: must_be_immutable
// class CustomChart extends StatelessWidget {
//   String title;
//   FlTitlesData columnNFiles;
//   List<LineChartBarData> lineChartBarData;
//   List<Container> defineColor;

//   CustomChart(
//       this.title, this.columnNFiles, this.lineChartBarData, this.defineColor);

//   @override
//   Widget build(BuildContext context) {
//     return ChartContainer(
//       title: title,
//       color: Colors.transparent,
//       defineColor: defineColor,
//       chart: LineChart(
//         LineChartData(
//             titlesData: columnNFiles,
//             borderData: FlBorderData(
//                 show: false,
//                 border: Border.all(color: Colors.white, width: 0.5)),
//             gridData:
//                 FlGridData(drawHorizontalLine: true, drawVerticalLine: false),
//             lineBarsData: lineChartBarData),
//       ),
//     );
//   }
// }
