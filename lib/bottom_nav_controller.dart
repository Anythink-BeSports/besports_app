import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavController extends GetxController {
  GlobalKey<NavigatorState> calendarPageNavigationKey = GlobalKey<NavigatorState>();

  static BottomNavController get to => Get.find();
  RxInt pageIndex = 0.obs;
  List<int> bottomHistory = [0];

  void changeBottomNav(int value, {bool hasGesture = true}) {
    pageIndex(value);
    if (!hasGesture) return;
    if (bottomHistory.contains(value)) {
      bottomHistory.remove(value);
    }
    bottomHistory.add(value);
  }

  Future<bool> willPopAction() async {
    if (bottomHistory.length == 1) {
      if (bottomHistory.last == 1) {
        bool value = await calendarPageNavigationKey.currentState!.maybePop();
        if (value) return false;
      }
      print('exit!');
      return true;
    }
    else {
      if (bottomHistory.last == 1) {
        bool value = await calendarPageNavigationKey.currentState!.maybePop();
        if (value) return false;
      }
      print('goto before page!');
      bottomHistory.removeLast();
      var index = bottomHistory.last;
      changeBottomNav(index, hasGesture: false);
      print(bottomHistory);
      return false;
    }
  }
}