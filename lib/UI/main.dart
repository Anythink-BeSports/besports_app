import 'dart:html';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sports_application/service.controller/auth_controller.dart';
import 'package:sports_application/service.controller/record_controller.dart';
import '../collection/record_data.dart';
import 'calibration_page.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'setting_page.dart';
import 'record_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyB3qid04D4osUkvTVBSOWxEIe9WQv-wBH4",
          appId: "1:318975849915:android:9ce3a0f937d78111d5009e",
          messagingSenderId: "345146137232",
          projectId: "BeSports")
  ).then((value) => Get.put(AuthController()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          title: 'BeSports',
          home: const LoginPage(),
        );
      }
    );
  }
}

class BeSports extends StatefulWidget{
  const BeSports({Key? key}) : super(key: key);

  @override
  State<BeSports> createState() => _BeSportsState(Get.arguments);
}

class _BeSportsState extends State<BeSports> {
  int selectedItemIndex = 0;
  final screens = const [
    HomePage(),
    RecordPage(),
    CalibrationPage(),
    SettingPage(),
  ];

  _BeSportsState(email) {
    Get.put(RecordController(email));
    RecordController.instance.readRecord().then((value) {

    });
  }

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