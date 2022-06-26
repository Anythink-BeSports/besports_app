import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      title: 'BeSports',
      home: const Exercise(),
    );
  }
}

class Exercise extends StatefulWidget{
  const Exercise({Key? key}) : super(key: key);

  @override
  State<Exercise> createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {
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
                top: BorderSide(width: 1.0, color: Color(0xFFD6D6D6)),
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
        height: 85,
        width: MediaQuery.of(context).size.width / 4,
        decoration: BoxDecoration(
          color: index == selectedItemIndex ? Colors.grey[350] : Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: index == selectedItemIndex ? Colors.indigo : Colors.black,),
            Text(string, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,
              color: index == selectedItemIndex ? Colors.indigo : Colors.black,),),
          ],
        ),
      ),
    );
  }
}