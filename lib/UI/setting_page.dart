import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:sports_application/service.controller/auth_controller.dart';

import '../model/setting.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  List<Setting> setting = [
    const Setting(title: "알림 및 소리", settingTypes: SettingTypes.notification),
    const Setting(title: "방해금지 모드", settingTypes: SettingTypes.notification),
    const Setting(title: "계정/정보 관리", settingTypes: SettingTypes.userInfor),
    const Setting(title: "기타 설정", settingTypes: SettingTypes.userInfor),
    const Setting(title: "계정 탈퇴", settingTypes: SettingTypes.userInfor),
    const Setting(title: "버전 정보", settingTypes: SettingTypes.etc),
    const Setting(title: "로그아웃", settingTypes: SettingTypes.etc),
    const Setting(title: "문의하기", settingTypes: SettingTypes.etc)
  ];

  var _isNotification = false;
  var _isInterference = false;


  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Setting'),
        ),
        body: ListView(
          children: [
            Container(
                padding: const EdgeInsets.only(left: 15,top: 15),
                height: 120.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "알림 설정",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 3,
                              child: Text(
                                setting[0].title,
                                style: TextStyle(
                                    fontSize: 20.sp
                                ),
                              )),
                          Expanded(
                              flex: 1,
                              child: FlutterSwitch(
                                inactiveColor: Color(0xffD8D8D8),
                                activeColor: Colors.green,
                                width: 55.w,
                                height: 28.h,
                                value: _isNotification,
                                onToggle: (val) {
                                  setState(() {
                                    _isNotification = val;
                                  });
                                },
                              ))
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 3,
                              child: Text(
                                setting[1].title,
                                style: TextStyle(
                                    fontSize: 20.sp
                                ),
                              )),
                          Expanded(
                              flex: 1,
                              child: FlutterSwitch(
                                inactiveColor: Color(0xffD8D8D8),
                                activeColor: Colors.green,
                                width: 55.w,
                                height: 28.h,
                                value: _isInterference,
                                onToggle: (val) {
                                  setState(() {
                                    _isInterference = val;
                                  });
                                },
                              ))
                        ],
                      ),
                    ),
                  ],
                )
            ),
            const Divider( color: Colors.black),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                      title: Text(
                        "사용자 설정",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold
                        ),
                      )
                  ),
                  ListTile(
                    title: Text(setting[2].title, style: TextStyle(fontSize: 20.sp)),
                    onTap: () { print(setting[2].title); },
                  ),
                  ListTile(
                    title: Text(setting[3].title, style: TextStyle(fontSize: 20.sp)),
                    onTap: () { print(setting[3].title); },
                  ),
                  ListTile(
                    title: Text(setting[4].title, style: TextStyle(fontSize: 20.sp)),
                    onTap: () { print(setting[4].title); },
                  ),
                ]),
            const Divider( color: Colors.black ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                      title: Text(
                        "기타",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold
                        ),
                      )
                  ),
                  ListTile(
                    title: Text(setting[5].title, style: TextStyle(fontSize: 20.sp)),
                    onTap: () { print(setting[5].title); },
                  ),
                  ListTile(
                    title: Text(setting[6].title, style: TextStyle(fontSize: 20.sp)),
                    onTap: () { AuthController.instance.logOut(); },
                  ),
                  ListTile(
                    title: Text(setting[7].title, style: TextStyle(fontSize: 20.sp)),
                    onTap: () { print(setting[7].title); },
                  ),
                ]),
          ],
        )
    );
  }
}