import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Calcbutton extends StatelessWidget {
  final Function callback;
  final String text;
  final double textSize;
  final Color textColor;
  final Color foreColor;
  final Color background;

  const Calcbutton({
    super.key,
    required this.callback,
    required this.text,
    required this.textSize,
    this.textColor = Colors.blue,
    this.foreColor = Colors.blue,
    this.background = Colors.white, // No nullable y valor predeterminado
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: SizedBox(
        width: 65,
        height: 65,
        child: TextButton(
          onPressed: () {
            callback(text);
          },
          style: TextButton.styleFrom(
            backgroundColor: background, // Usar el color de fondo aquí
            foregroundColor: foreColor,
            padding: const EdgeInsets.all(16.0),
            textStyle: const TextStyle(
              fontSize: 20.0,
            ),
          ),
          child: Text(
            text,
            style: GoogleFonts.rubik(
              textStyle: TextStyle(
                fontSize: textSize,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
