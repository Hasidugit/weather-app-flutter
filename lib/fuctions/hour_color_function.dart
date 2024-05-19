import 'package:flutter/material.dart';

BoxDecoration getWeatherDecoration(String condition) {
  Color bgColor;
  Color borderColor;
  LinearGradient gradient;

  switch (condition) {
    case 'Moderate or heavy rain shower':
      bgColor = const Color.fromARGB(255, 182, 187, 196);
      borderColor = const Color.fromARGB(255, 60, 90, 175);
      gradient = const LinearGradient(colors: [
        Color.fromARGB(255, 233, 223, 229),
        Color.fromARGB(255, 69, 103, 69),
        Color.fromRGBO(229, 59, 185, 1),
      ]);
      break;
    case 'Moderate rain':
      bgColor = const Color.fromARGB(255, 224, 240, 222);
      borderColor = const Color.fromARGB(255, 105, 200, 105);
      gradient = const LinearGradient(colors: [
        Color.fromARGB(255, 170, 230, 170),
        Color.fromARGB(255, 150, 210, 150),
        Color.fromRGBO(130, 190, 130, 1),
      ]);
      break;
    case 'Heavy rain':
      bgColor = const Color.fromARGB(255, 205, 240, 255);
      borderColor = const Color.fromARGB(255, 100, 207, 200);
      gradient = const LinearGradient(colors: [
        Color.fromARGB(255, 140, 225, 230),
        Color.fromARGB(255, 100, 207, 210),
        Color.fromRGBO(90, 190, 200, 1),
      ]);
      break;
    case 'Torrential rain shower':
      bgColor = const Color.fromARGB(255, 255, 215, 220);
      borderColor = const Color.fromARGB(255, 190, 50, 50);
      gradient = const LinearGradient(colors: [
        Color.fromARGB(255, 240, 100, 100),
        Color.fromARGB(255, 230, 70, 70),
        Color.fromRGBO(210, 60, 60, 1),
      ]);
      break;
    default:
      bgColor = const Color.fromARGB(255, 182, 187, 196);
      borderColor = const Color.fromARGB(255, 60, 90, 175);
      gradient = const LinearGradient(colors: [
        Color.fromARGB(255, 143, 70, 115),
        Color.fromARGB(255, 70, 160, 70),
        Color.fromRGBO(229, 59, 185, 1),
      ]);
  }

  return BoxDecoration(
    color: bgColor,
    border: Border.all(
      color: borderColor,
      width: 1.0,
    ),
    borderRadius: BorderRadius.circular(10.0),
    gradient: gradient,
    boxShadow: const [
      BoxShadow(
        color: Colors.grey,
        blurRadius: 2.0,
        offset: Offset(2.0, 2.0),
      ),
    ],
  );
}
