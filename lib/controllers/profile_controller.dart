import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasmobile11pplg1_06/controllers/auth_controller.dart';
import 'package:pasmobile11pplg1_06/helper/sharedpref_helper.dart';

class ProfileController extends GetxController {
  final username = ''.obs;
  final email = ''.obs;
  final fullName = ''.obs;
  final isLoading = false.obs;

  // FIX #4: Gunakan Get.find dengan orElse untuk handle jika belum ada
  AuthController get authController {
    try {
      return Get.find<AuthController>();
    } catch (e) {
      // Jika AuthController belum ada, buat instance baru
      Get.put(AuthController());
      return Get.find<AuthController>();
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadUserInfo();
  }

  // Load user info from SharedPreferences
  Future<void> loadUserInfo() async {
    try {
      isLoading.value = true;
      final savedUsername = await SharedPrefHelper.getUsername();
      final savedEmail = await SharedPrefHelper.getEmail();
      final savedFullName = await SharedPrefHelper.getFullName();

      if (savedUsername != null) username.value = savedUsername;
      if (savedEmail != null) email.value = savedEmail;
      if (savedFullName != null) fullName.value = savedFullName;
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to load user info',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Logout
  Future<void> logout() async {
    await authController.logout();
  }

  // Refresh user info
  Future<void> refreshUserInfo() async {
    await loadUserInfo();
  }
}