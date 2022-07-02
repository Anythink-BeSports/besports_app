import 'package:get/get.dart';
import 'package:sports_application/bottom_nav_controller.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController(), permanent: true);
  }
}