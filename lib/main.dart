import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const CalculadoraApp());
}

class CalculadoraApp extends StatefulWidget {
  const CalculadoraApp({super.key});

  @override
  State<CalculadoraApp> createState() => _CalculadoraAppState();
}

class _CalculadoraAppState extends State<CalculadoraApp> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
