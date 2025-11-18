import 'package:get/get.dart';
import '../controllers/bottomnav_controller.dart';

class BottomnavBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(BottomNavController());
  }

}