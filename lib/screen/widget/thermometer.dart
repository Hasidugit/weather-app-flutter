import 'package:flutter/material.dart';
import 'package:flutter_application_weather_app/screen/widget/customer_text.dart';

class ThermometerWidget extends StatelessWidget {
  const ThermometerWidget({
    super.key,
    required this.max,
    required this.min,
  });
  final double max;
  final double min;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120, // Further reduced width
      height: 150, // Further reduced height
      decoration: const BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.rectangle,
        borderRadius:
            BorderRadius.all(Radius.circular(8)), // Further reduced radius
      ),
      child: Stack(
        children: [
          Positioned(
              right: 10,
              top: 40, // Adjusted position
              child: CustomerText(
                title: "$max°C",
                fontSize: 11.5,
                color2: Colors.white,
                strokeWidth: 1,
              )),
          Positioned(
              right: 10,
              top: 80, // Adjusted position
              child: CustomerText(
                title: "$min°C",
                fontSize: 11.5,
                color2: Colors.white,
                strokeWidth: 1,
              )),
          Align(
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  width: 40, // Further reduced width
                  margin: const EdgeInsets.only(top: 80), // Adjusted margin
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFBFC9D7),
                        blurRadius: 5, // Further reduced blur radius
                        offset: Offset(1, 1.5), // Further reduced offset
                      )
                    ],
                  ),
                ),
                Container(
                  width: 20, // Further reduced width
                  height: 100, // Further reduced height
                  margin: const EdgeInsets.only(top: 10), // Adjusted margin
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFBFC9D7),
                        blurRadius: 5, // Further reduced blur radius
                        offset: Offset(1, 1.5), // Further reduced offset
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15), // Further reduced radius
                      topRight: Radius.circular(15), // Further reduced radius
                    ),
                  ),
                ),
                Container(
                  width: 30, // Further reduced width
                  margin: const EdgeInsets.only(top: 80), // Adjusted margin
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
                Container(
                  width: 15, // Further reduced width
                  height: 80, // Further reduced height
                  margin: const EdgeInsets.only(top: 40), // Adjusted margin
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 159, 33, 33),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8), // Further reduced radius
                      topRight: Radius.circular(8), // Further reduced radius
                    ),
                  ),
                ),
                Container(
                  width: 30, // Further reduced width
                  margin: const EdgeInsets.only(top: 80), // Adjusted margin
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 214, 67, 67),
                  ),
                ),
                // Mark 20°C
              ],
            ),
          ),
        ],
      ),
    );
  }
}
