import 'package:flutter/material.dart';

class CalibrationPage extends StatefulWidget {
  const CalibrationPage({Key? key}) : super(key: key);

  @override
  State<CalibrationPage> createState() => _CalibrationPageState();
}

class _CalibrationPageState extends State<CalibrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Calibration'),
        titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold
        ),
        toolbarHeight: 85,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
    );
  }
}