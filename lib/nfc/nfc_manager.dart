import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';
import '../ble/ble_controller.dart';

class NfcController {

  ValueNotifier<dynamic> result = ValueNotifier(null);

  final String nfcData = "";

  BleController Ble = BleController("34:AB:95:5E:70:DE");

  void tagRead() {
    print('tag읽기 시작합니다');
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async{
      result.value = await tag.data;
      Ble.startScan();
      Ble.findDevice();
    });
  }

}