import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:sports_application/getx/counter_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ValueNotifier<dynamic> result = ValueNotifier(null);

  Stream<List<int>>? stream;
  final String macAddress = "34:AB:95:5E:70:DE";
  late final BluetoothDevice device;
  int count = 0;
  bool isReady = false;

  void tagRead() {
    print('tag읽기 시작합니다');
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async{
      result.value = await tag.data;
      startScan();
      findDevice();
    });
  }

  void startScan(){
    FlutterBlue.instance.startScan();
    print('스캔시작합니다');
  } // 스캔시작

  void stopScan(){
    FlutterBlue.instance.stopScan();
    print('스캔종료합니다');
  } // 스캔종료

  void findDevice() async{

    print('장치 찾는중입니다');
    Stream<List<ScanResult>> scanResults = await FlutterBlue.instance.scanResults;

    scanResults.forEach((scanResult) async {
      for(ScanResult sr in scanResult){
        if(macAddress == sr.device.id.id){
          device = sr.device;
          await device.connect();

          stopScan();
          await getData();

          break;
        }
      }
    });
  }

  void disconnectFromDevice(){
    device.disconnect();
  }

  void setState(VoidCallback fn){
    super.setState(fn);
  }

  Future<void> getData() async {
    print("device:$device");


    List<BluetoothService> services = await device.discoverServices();

    print("services:$services");



    services.forEach((service) {
      service.characteristics.forEach((characterlistic) {
        if (characterlistic.properties.notify) {
          characterlistic.setNotifyValue(!characterlistic.isNotifying);
          stream = characterlistic.value;

          setState((){
            isReady = true;
          });
        }
      });
    });
  }


  @override
  initState(){
    super.initState();
    tagRead();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Exercise'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 85.h,
                  width: MediaQuery.of(context).size.width / 3,
                  child: Column(
                    children: [
                      Text('Set', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),),
                      SizedBox(height: 6.h,),
                      Text('0', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                SizedBox(
                  height: 85.h,
                  width: MediaQuery.of(context).size.width / 3,
                  child: Column(
                    children: [
                      Text('Time', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),),
                      SizedBox(height: 6.h,),
                      Text('00:00', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                SizedBox(
                  height: 85.h,
                  width: MediaQuery.of(context).size.width / 3,
                  child: Column(
                    children: [
                      Text('Rest', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),),
                      SizedBox(height: 6.h,),
                      Text('00:00.0', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),),
                    ],
                  ),
                )
              ],
            ),
            Container(
              width: 230.w,
              height: 230.h,
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: CircleBorder(
                      side: BorderSide(
                        width: 35.w,
                        color: Colors.grey[350]!,
                      )
                  )
              ),
              child: !isReady?const Center(child: Text('Loading...')):Center(
                child: StreamBuilder<List<int>>(
                  stream: stream,
                  builder: (BuildContext context, AsyncSnapshot<List<int>> snapshot){

                    if(snapshot.hasError){
                      return Text('Error:${snapshot.error}');
                    }

                    if(snapshot.connectionState == ConnectionState.active){
                      count++;
                      return Text('${count-1} 개');
                    }

                    else {
                      return const Text('0 개');
                    }
                  },
                ),
              )
              ),
            Text('Weight : 0kg', style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w500),),
            SizedBox(
              width: 110.w,
              height: 50.h,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                ),
                child: Text('SET', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),)
              ),
            ),
          ],
        )
    );
  }
}