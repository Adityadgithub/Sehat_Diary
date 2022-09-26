import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

List<FlSpot>? spotlist = [];

class LineChartWidget extends StatelessWidget {
  LineChartWidget({Key? key}) : super(key: key);
  final List<Color> gradientcolor = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 15.0),
        child: Container(
          child: LineChart(LineChartData(
              // minX: 0,
              // maxX: 11,
              // minY: 0,
              // maxY: 6,
              titlesData: FlTitlesData(
                  show: true,
                  topTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 70,
                          interval: 1,
                          getTitlesWidget: (value, TitleMeta meta) {
                            switch (value.toInt()) {
                              case 1:
                                return Text('Jan');
                              case 1:
                                return Text('Jan');
                              case 2:
                                return Text('Feb');
                              case 3:
                                return Text('Mar');
                              case 4:
                                return Text('Apr');
                              case 5:
                                return Text('May');
                              case 6:
                                return Text('Jun');
                              case 7:
                                return Text('Jul');
                              case 8:
                                return Text('Aug');
                              case 9:
                                return Text('Sept');
                              case 10:
                                return Text('Oct');
                              case 11:
                                return Text('Nov');
                              case 12:
                                return Text('Dec');

                              default:
                                return Text('');
                            }
                          }))),
              gridData: FlGridData(
                  show: true,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(color: Colors.grey, strokeWidth: 1);
                  },
                  drawVerticalLine: false,
                  getDrawingVerticalLine: (value) {
                    return FlLine(color: Colors.grey, strokeWidth: 1);
                  }),
              borderData: FlBorderData(show: true, border: Border.all()),
              lineBarsData: [
                LineChartBarData(
                    spots: spotlist,
                    isCurved: true,
                    gradient: LinearGradient(colors: gradientcolor),
                    barWidth: 3,
                    dotData: FlDotData(
                      show: true,
                    ),
                    // aboveBarData: BarAreaData(show: true),
                    belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                            colors: gradientcolor
                                .map((color) => color.withOpacity(0.3))
                                .toList())))
              ])),
        ),
      ),
    );
  }
}
