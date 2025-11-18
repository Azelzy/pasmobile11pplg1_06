import 'package:get/get.dart';
import '../controllers/bookmark_controller.dart';

class BookmarkBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(BookmarkController());
  }

}