import 'package:get/get.dart';
import 'package:pasmobile11pplg1_06/controllers/favoritepage_controller.dart';

class FavoritepageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavoriteController>(() => FavoriteController());
  }
}
