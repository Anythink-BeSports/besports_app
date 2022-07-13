import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_application/bottom_nav_controller.dart';
import 'home_page.dart';
import 'package:get/get.dart';
import 'package:sports_application/service.controller/auth_controller.dart';
import 'package:sports_application/service.controller/record_controller.dart';
import 'calibration_page.dart';
import '../init_bindings.dart';
import 'login_page.dart';
import 'setting_page.dart';
import 'calendar_page.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDnGnl32I4B3pv09DMCBusgLQ8ESTBQYKc",
          appId: "1:375585344643:android:1f2e022e7f1fd502ea9fb6",
          messagingSenderId: "375585344643",
          projectId: "besports-841e2")
  ).then((value) => Get.put(AuthController()));
  initializeDateFormatting().then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return GetMaterialApp(
          initialBinding: InitBinding(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.red,
            appBarTheme: AppBarTheme(
              iconTheme: const IconThemeData(
                color: Colors.black
              ),
              titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold
              ),
              toolbarHeight: 85.h,
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 1.5,
            )
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
  final screens = [
    const HomePage(),
    Navigator(
      key: BottomNavController.to.calendarPageNavigationKey,
      onGenerateRoute: (routeSetting) {
        return MaterialPageRoute(
          builder: (context)=> const CalendarPage(),
        );
      },
    ),
    const CalibrationPage(),
    const SettingPage(),
  ];

  _BeSportsState(email) {
    Get.put(RecordController(email));
    RecordController.instance.readRecord().then((value) {

    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: BottomNavController.to.willPopAction,
      child: Obx(() => Scaffold(
          body: IndexedStack(
            index: BottomNavController.to.pageIndex.value,
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
      ),),
    );
  }

  Widget buildNavBarItem(IconData icon, String string, int index) {
    return GestureDetector (
      onTap: () {
        setState(() {
          BottomNavController.to.changeBottomNav(index);
        });
      },
      child: Container(
        height: 85.h,
        width: MediaQuery.of(context).size.width / 4,
        decoration: BoxDecoration(
          color: index == BottomNavController.to.pageIndex.value ? Colors.grey[350] : Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 28.sp, color: index == BottomNavController.to.pageIndex.value ? Colors.indigo : Colors.black,),
            Text(string, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold,
              color: index == BottomNavController.to.pageIndex.value ? Colors.indigo : Colors.black,),),
          ],
        ),
      ),
    );
  }
}