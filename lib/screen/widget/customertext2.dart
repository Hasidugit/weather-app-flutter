import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomerText2 extends StatelessWidget {
  const CustomerText2({
    super.key,
    required this.titile,
    this.fontSize = 20,
    this.color = Colors.white,
  });
  final String titile;
  final double fontSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      titile,
      style: GoogleFonts.lato(
        fontSize: fontSize, // Change font size
        color: color,
        // Change text color
        fontWeight: FontWeight.bold, // Add font weight
        fontStyle: FontStyle.italic, // Add italic style

        shadows: const [
          Shadow(
            blurRadius: 1,
            color: Colors.black,
            offset: Offset(2, 1),
          ),
        ], // Add shadow
      ),
    );
  }
}
