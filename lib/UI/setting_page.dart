import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_application/service.controller/auth_controller.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Setting'),
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
      body:
      TextButton(style: TextButton.styleFrom(
          primary: Colors.black,
          minimumSize: Size(30, 15.h),
          textStyle: TextStyle(fontSize: 18.sp),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          )
      ),
          onPressed: () => AuthController.instance.logOut(),
          child: const Text("로그아웃")),
    );
  }
}