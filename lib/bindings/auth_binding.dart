import 'package:get/get.dart';
import 'package:pasmobile11pplg1_06/controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
