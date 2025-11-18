import 'package:get/get.dart';
import 'package:pasmobile11pplg1_06/controllers/splashscreen_controller.dart';

class SplashscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashscreenController>(() => SplashscreenController());
  }
}
