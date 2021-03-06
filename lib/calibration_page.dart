import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 26.sp,
            fontWeight: FontWeight.bold
        ),
        toolbarHeight: 85.h,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1.5,
      ),
    );
  }
}