import 'package:get/get.dart';
import '../controllers/bottomnav_controller.dart';
import '../controllers/bookmark_controller.dart';
import '../controllers/product_controller.dart';
import '../controllers/profile_controller.dart';
import '../controllers/login_controller.dart';

class BottomnavBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController());
    Get.put(BookmarkController());
    Get.put(ProductController());
    Get.put(ProfileController());
    Get.put(LoginController());
  }
}
