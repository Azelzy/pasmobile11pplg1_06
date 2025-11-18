import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../models/login_model.dart';
import '../routes/routes.dart';
import '../services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final obscurePassword = true.obs;
  final isLoading = false.obs;

  void toggleObscure() {
    obscurePassword.value = !obscurePassword.value;
  }

  Future<void> login() async {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Semua field harus diisi!");
      return;
    }

    isLoading.value = true;

    try {
      LoginModel user = await ApiService.login(username, password);

      // Simpan token di SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', user.token);

      Get.snackbar("ヤッタ!! ☆*: .｡. o(≧▽≦)o .｡.:*☆", "Login berhasil!");
      Get.offAllNamed(AppRoutes.bottomnav);
    } catch (e) {
      Get.snackbar("Login Gagal", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');

    Get.snackbar("ヤッタ!! ☆*: .｡. o(≧▽≦)o .｡.:*☆", "Logout berhasil!");
    Get.offAllNamed(AppRoutes.login);
  }
}
