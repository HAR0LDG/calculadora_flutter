import 'package:calculadora/widgets/calc_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:math_expressions/math_expressions.dart";

void main(List<String> args) {
  runApp(const CalculadoraApp());
}

class CalculadoraApp extends StatefulWidget {
  const CalculadoraApp({super.key});

  @override
  State<CalculadoraApp> createState() => _CalculadoraAppState();
}

class _CalculadoraAppState extends State<CalculadoraApp> {
  String historial = " ";
  String expresion = " ";

  void allClear(String text) {
    setState(() {
      historial = " ";
      expresion = " ";
    });
  }

  void clear(String text) {
    setState(() {
      expresion = " ";
    });
  }

  void numClick(String text) {
    setState(() {
      expresion += text;
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(expresion);
    ContextModel cm = ContextModel();
    setState(() {
      historial = expresion;
      expresion = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculadora",
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                alignment: const Alignment(1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Text(
                    historial,
                    style: GoogleFonts.rubik(
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: const Alignment(1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    expresion,
                    style: GoogleFonts.rubik(
                      fontSize: 48,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Calcbutton(
                      background: Colors.red,
                      foreColor: const Color.fromARGB(255, 255, 255, 255),
                      text: "AC",
                      callback: allClear,
                      textSize: 20,
                      textColor: Colors.white),
                  Calcbutton(
                    background: Colors.orange,
                    foreColor: const Color.fromARGB(255, 255, 255, 255),
                    textColor: Colors.white,
                    text: "C",
                    callback: allClear,
                    textSize: 20,
                  ),
                  Calcbutton(
                    text: "%",
                    callback: numClick,
                    textSize: 20,
                  ),
                  Calcbutton(
                    text: "/",
                    callback: numClick,
                    textSize: 20,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Calcbutton(
                    text: "7",
                    callback: numClick,
                    textSize: 20,
                  ),
                  Calcbutton(
                    text: "8",
                    callback: numClick,
                    textSize: 20,
                  ),
                  Calcbutton(
                    text: "9",
                    callback: numClick,
                    textSize: 20,
                  ),
                  Calcbutton(
                    text: "*",
                    callback: numClick,
                    textSize: 20,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Calcbutton(
                    text: "4",
                    callback: numClick,
                    textSize: 20,
                  ),
                  Calcbutton(
                    text: "5",
                    callback: numClick,
                    textSize: 20,
                  ),
                  Calcbutton(
                    text: "6",
                    callback: numClick,
                    textSize: 20,
                  ),
                  Calcbutton(
                    text: "-",
                    callback: numClick,
                    textSize: 20,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Calcbutton(
                    text: "1",
                    callback: numClick,
                    textSize: 20,
                  ),
                  Calcbutton(
                    text: "2",
                    callback: numClick,
                    textSize: 20,
                  ),
                  Calcbutton(
                    text: "3",
                    callback: numClick,
                    textSize: 20,
                  ),
                  Calcbutton(
                    text: "+",
                    callback: numClick,
                    textSize: 20,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Calcbutton(
                    text: ".",
                    callback: numClick,
                    textSize: 20,
                  ),
                  Calcbutton(
                    text: "0",
                    callback: numClick,
                    textSize: 20,
                  ),
                  Calcbutton(
                    text: "00",
                    callback: numClick,
                    textSize: 20,
                  ),
                  Calcbutton(
                    text: "=",
                    callback: evaluate,
                    textSize: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
