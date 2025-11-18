import 'package:get/get.dart';
import '../controllers/profile_controller.dart';
import '../controllers/login_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
    if (!Get.isRegistered<LoginController>()) {
      Get.put(LoginController());
    }
  }
}
