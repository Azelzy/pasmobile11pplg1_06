import 'package:get/get.dart';
import '../controllers/product_controller.dart';
import '../controllers/bookmark_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BookmarkController());
    Get.put(ProductController());
  }
}
