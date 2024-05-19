import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartSample2 extends StatefulWidget {
  const LineChartSample2({super.key});

  @override
  State<LineChartSample2> createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  final List<Color> gradientColors = [
    const Color.fromARGB(255, 203, 216, 218),
    const Color.fromARGB(255, 213, 219, 224),
  ];
  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 185 * 2,
      height: 120,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: LineChart(showAvg ? avgData() : mainData()),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
        fontWeight: FontWeight.bold, fontSize: 8, color: Colors.black);
    switch (value.toInt()) {
      case 0:
        return const Text('0h', style: style);
      case 4:
        return const Text('4h', style: style);
      case 8:
        return const Text('8h', style: style);
      case 12:
        return const Text('12h', style: style);
      case 16:
        return const Text('16h', style: style);
      case 20:
        return const Text('20h', style: style);
      case 24:
        return const Text('24h', style: style);
      default:
        return const Text('');
    }
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 5,
        verticalInterval: 5,
        getDrawingHorizontalLine: (_) => const FlLine(
          color: Color.fromARGB(255, 162, 171, 179),
          strokeWidth: 0.5,
        ),
        getDrawingVerticalLine: (_) => const FlLine(
          color: Color.fromARGB(255, 149, 156, 162),
          strokeWidth: 0.5,
        ),
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles:
            const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 15,
            interval: 4,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d), width: 0.5),
      ),
      minX: 0,
      maxX: 24,
      minY: 0,
      maxY: 30,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 15),
            FlSpot(2, 17),
            FlSpot(4, 20),
            FlSpot(6, 22),
            FlSpot(8, 24),
            FlSpot(10, 20),
            FlSpot(12, 19),
            FlSpot(14, 23),
            FlSpot(16, 25),
            FlSpot(18, 27),
            FlSpot(20, 28),
            FlSpot(22, 26),
            FlSpot(24, 24),
          ],
          isCurved: true,
          gradient: LinearGradient(colors: gradientColors),
          barWidth: 2.0,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        verticalInterval: 5,
        horizontalInterval: 5,
        getDrawingVerticalLine: (_) => const FlLine(
          color: Color.fromARGB(255, 196, 198, 200),
          strokeWidth: 0.5,
        ),
        getDrawingHorizontalLine: (_) => const FlLine(
          color: Color.fromARGB(255, 183, 186, 189),
          strokeWidth: 0.5,
        ),
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 15,
            interval: 4,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles:
            const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d), width: 0.5),
      ),
      minX: 0,
      maxX: 24,
      minY: 0,
      maxY: 30,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 20),
            FlSpot(2, 20),
            FlSpot(4, 20),
            FlSpot(6, 20),
            FlSpot(8, 20),
            FlSpot(10, 20),
            FlSpot(12, 20),
            FlSpot(14, 20),
            FlSpot(16, 20),
            FlSpot(18, 20),
            FlSpot(20, 20),
            FlSpot(22, 20),
            FlSpot(24, 20),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors:
                gradientColors.map((color) => color.withOpacity(0.1)).toList(),
          ),
          barWidth: 2.0,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.1))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
