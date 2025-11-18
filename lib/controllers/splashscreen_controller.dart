import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../routes/routes.dart';

class SplashScreenController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    checkLogin();
  }

  Future<void> checkLogin() async {
    await Future.delayed(const Duration(seconds: 2)); // delay splash 2 detik

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token != null && token.isNotEmpty) {
      // Sudah login → masuk ke bottomnav
      Get.offAllNamed(AppRoutes.bottomnav);
    } else {
      // Belum login → ke login page
      Get.offAllNamed(AppRoutes.login);
    }
  }
}