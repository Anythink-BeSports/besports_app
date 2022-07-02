import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'home_page.dart';
import 'calibration_page.dart';
import 'setting_page.dart';
import 'record_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          title: 'BeSports',
          home: const BeSports(),
        );
      }
    );
  }
}

class BeSports extends StatefulWidget{
  const BeSports({Key? key}) : super(key: key);

  @override
  State<BeSports> createState() => _BeSportsState();
}

class _BeSportsState extends State<BeSports> {
  int selectedItemIndex = 0;
  final screens = const [
    HomePage(),
    RecordPage(),
    CalibrationPage(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: IndexedStack(
          index: selectedItemIndex,
          children: screens,
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(width: 2.0, color: Color(0xFFD6D6D6)),
              )
          ),
          child: Row(
            children: [
              buildNavBarItem(Icons.home, 'Home', 0),
              buildNavBarItem(Icons.bar_chart, 'Record', 1),
              buildNavBarItem(Icons.compass_calibration_outlined, 'Calibration', 2),
              buildNavBarItem(Icons.settings, 'Setting', 3),
            ],
          ),
        )
    );
  }

  Widget buildNavBarItem(IconData icon, String string, int index) {
    return GestureDetector (
      onTap: () {
        setState(() {
          selectedItemIndex = index;
        });
      },
      child: Container(
        height: 85.h,
        width: MediaQuery.of(context).size.width / 4,
        decoration: BoxDecoration(
          color: index == selectedItemIndex ? Colors.grey[350] : Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 28.sp, color: index == selectedItemIndex ? Colors.indigo : Colors.black,),
            Text(string, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold,
              color: index == selectedItemIndex ? Colors.indigo : Colors.black,),),
          ],
        ),
      ),
    );
  }
}