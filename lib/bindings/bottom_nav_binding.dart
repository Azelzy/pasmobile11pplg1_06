import 'package:get/get.dart';
import 'package:pasmobile11pplg1_06/controllers/bottom_nav_controller.dart';

class BottomNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavController>(() => BottomNavController());
  }
}
