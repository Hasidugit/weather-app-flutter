import 'package:flutter/material.dart';
import 'package:flutter_application_weather_app/screen/widget/customer_text.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CusMeter extends StatelessWidget {
  const CusMeter({super.key, required this.count});
  final double count;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 100,
        height: 100,
        child: SfRadialGauge(axes: <RadialAxis>[
          RadialAxis(minimum: 0, maximum: 100, ranges: <GaugeRange>[
            GaugeRange(
                startWidth: 1,
                rangeOffset: 2,
                startValue: 0,
                endValue: 50,
                color: Colors.green),
            GaugeRange(
                startWidth: 1,
                rangeOffset: 2,
                startValue: 50,
                endValue: 100,
                color: const Color.fromARGB(255, 122, 94, 51)),
          ], pointers: <GaugePointer>[
            NeedlePointer(
              value: count,
              needleStartWidth: 1,
              needleEndWidth: 3,
              lengthUnit: GaugeSizeUnit.factor,
              needleLength: 0.6,
              needleColor: Colors.white54,
            )
          ], annotations: <GaugeAnnotation>[
            GaugeAnnotation(
                axisValue: BorderSide.strokeAlignCenter,
                widget: Container(
                    child: CustomerText(
                  title: count.toString(),
                  fontSize: 14,
                  color2: Colors.white,
                  strokeWidth: 2,
                )),
                angle: 90,
                positionFactor: 1.0)
          ])
        ]));
  }
}
