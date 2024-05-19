import 'package:flutter/material.dart';

class CustomerText extends StatelessWidget {
  const CustomerText({
    super.key,
    required this.title,
    this.color1 = Colors.blue,
    this.color2 = Colors.grey,
    this.fontSize = 20,
    this.strokeWidth = 2,
  });

  final String title;
  final Color color1;
  final Color color2;
  final double fontSize;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Stroked text as border.
        Center(
          child: Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: fontSize,
              foreground: Paint()
                ..style = PaintingStyle.stroke // Set to stroke style
                ..strokeWidth = strokeWidth
                ..color = color1, // Set stroke color
            ),
          ),
        ),

        // Solid text as fill.
        Center(
          child: Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: fontSize,
              color: color2, // Set fill color
            ),
          ),
        ),
      ],
    );
  }
}
