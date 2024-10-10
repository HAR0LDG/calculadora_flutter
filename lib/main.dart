import 'package:calculadora/widgets/calc_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const CalculadoraApp());
}

class CalculadoraApp extends StatefulWidget {
  const CalculadoraApp({super.key});

  @override
  State<CalculadoraApp> createState() => _CalculadoraAppState();
}

class _CalculadoraAppState extends State<CalculadoraApp> {
  String historial = "";
  String expresion = "";

  void allClear(String text) {
    setState(() {
      historial = "";
      expresion = "";
    });
  }

  void clear(String text) {
    setState(() {
      expresion = "";
    });
  }

  void backspace(String text) {
    setState(() {
      if (expresion.isNotEmpty) {
        expresion = expresion.substring(0, expresion.length - 1);
      }
    });
  }

  void numClick(String text) {
    setState(() {
      expresion += text;
    });
  }

  void evaluate(String text) {
    // Si la expresión está vacía, evalúa el historial
    if (expresion.isEmpty) {
      if (historial.isNotEmpty) {
        expresion = historial; // Restaura la expresión del historial
      } else {
        return; // No hay nada que calcular
      }
    }

    Parser p = Parser();
    Expression exp = p.parse(expresion);
    ContextModel cm = ContextModel();
    setState(() {
      double result = exp.evaluate(EvaluationType.REAL, cm);
      historial = expresion; // Guarda la expresión en el historial
      expresion = result == result.toInt() ? result.toInt().toString() : result.toStringAsFixed(2); // Elimina decimales si son cero
    });
  }

  // Lista de botones
  final List<List<String>> buttons = [
    ["AC", "C", "%", "/"],
    ["7", "8", "9", "*"],
    ["4", "5", "6", "-"],
    ["1", "2", "3", "+"],
    [".", "0", "←", "="],
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculadora",
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Text(historial, style: GoogleFonts.rubik(fontSize: 24)),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(expresion, style: GoogleFonts.rubik(fontSize: 48)),
              ),
              ...buttons.map((row) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: row.map((text) {
                    Color? background = (text == "AC") ? Colors.red : (text == "C") ? Colors.orange : Colors.white;
                    Color? textColor = (text == "AC" || text == "C") ? Colors.white : Colors.blue;
                    Color? foregroundColor = (text == "AC" || text == "C") ? Colors.white : Colors.blue;
                   
                    return Calcbutton(
                      text: text,
                      textSize: 22,
                      background: background,
                      textColor: textColor,
                      foreColor: foregroundColor,
                      callback: (text == "AC") ? allClear : (text == "C") ? clear : (text == "←") ? backspace : (text == "=") ? evaluate : numClick,
                    );
                  }).toList(),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
