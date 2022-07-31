import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';
import 'package:sports_application/UI/home_page.dart';

class BleController{

  String macAddress="";
  Stream<List<int>>? stream;

  BleController(this.macAddress);

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

      scanResults.forEach((scanResult) {
        for(ScanResult sr in scanResult){
          if(macAddress == sr.device.id.id){
            sr.device.connect();

            if(sr.device.state == BluetoothDeviceState.connected){
              stopScan();
              getData(sr.device);
            }
            break;
          }
        }
      });
    }

  void getData(BluetoothDevice device) async {
    print("device:$device");

    List<BluetoothService> services = await device.discoverServices();

    print("services:$services");

    services.forEach((service) {
      service.characteristics.forEach((characterlistic) {
        if (characterlistic.properties.notify) {
          characterlistic.setNotifyValue(!characterlistic.isNotifying);

          stream = characterlistic.value;

          print("stream:$stream");
        }
      });
    });
  }
}