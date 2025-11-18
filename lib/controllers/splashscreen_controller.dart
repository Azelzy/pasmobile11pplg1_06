import 'package:get/get.dart';
import 'package:pasmobile11pplg1_06/helper/sharedpref_helper.dart';
import 'package:pasmobile11pplg1_06/routes/routes.dart';

class SplashscreenController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    _checkLoginStatus();
  }

  // Check if user is logged in and navigate accordingly
  Future<void> _checkLoginStatus() async {
    try {
      // Simulate splash screen delay
      await Future.delayed(const Duration(seconds: 2));

      final isLoggedIn = await SharedPrefHelper.isLoggedIn();

      print('Is logged in: $isLoggedIn'); // Debug log

      if (isLoggedIn) {
        print('Navigating to bottomNav'); // Debug log
        Get.offAllNamed(AppRoutes.bottomNav);
      } else {
        print('Navigating to login'); // Debug log
        Get.offAllNamed(AppRoutes.login);
      }
    } catch (e) {
      print('Error checking login status: $e');
      // Jika ada error, arahkan ke login
      Get.offAllNamed(AppRoutes.login);
    }
  }
}