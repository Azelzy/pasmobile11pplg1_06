import 'package:get/get.dart';
import 'package:pasmobile11pplg1_06/helper/sharedpref_helper.dart';
import 'package:pasmobile11pplg1_06/routes/routes.dart';

class SplashscreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _checkLoginStatus();
  }

  // Check if user is logged in and navigate accordingly
  Future<void> _checkLoginStatus() async {
    try {
      // Simulate splash screen delay
      await Future.delayed(const Duration(seconds: 2));

      final isLoggedIn = await SharedPrefHelper.isLoggedIn();

      if (isLoggedIn) {
        Get.offNamed(AppRoutes.bottomNav);
      } else {
        Get.offNamed(AppRoutes.login);
      }
    } catch (e) {
      print('Error checking login status: $e');
      Get.offNamed(AppRoutes.login);
    }
  }
}
