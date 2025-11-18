import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasmobile11pplg1_06/helper/sharedpref_helper.dart';
import 'package:pasmobile11pplg1_06/routes/routes.dart';

class ProfileController extends GetxController {
  final isLoading = false.obs;
  final username = ''.obs;
  final email = ''.obs;
  final fullName = ''.obs;
  final photoUrl = ''.obs;
  final errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserProfile();
  }

  // Load user profile from SharedPreferences
  Future<void> loadUserProfile() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final user = await SharedPrefHelper.getUsername();
      final userEmail = await SharedPrefHelper.getEmail();
      final userFullName = await SharedPrefHelper.getFullName();
      final userPhotoUrl = await SharedPrefHelper.getPhotoUrl();

      username.value = user ?? 'Guest';
      email.value = userEmail ?? '-';
      fullName.value = userFullName ?? '-';
      photoUrl.value = userPhotoUrl ?? '';
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  // Logout method
  Future<void> logout() async {
    try {
      await SharedPrefHelper.logout();
      Get.offAllNamed(AppRoutes.login);
    } catch (e) {
      Get.snackbar(
        'Error',
        'Logout error: ${e.toString()}',
        backgroundColor: const Color(0xFFF44336),
        colorText: const Color(0xFFFFFFFF),
      );
    }
  }

  // Update profile method (optional)
  Future<void> updateProfile({
    String? newUsername,
    String? newEmail,
    String? newFullName,
  }) async {
    try {
      isLoading.value = true;

      if (newUsername != null) {
        await SharedPrefHelper.saveUsername(newUsername);
        username.value = newUsername;
      }

      if (newEmail != null) {
        await SharedPrefHelper.saveEmail(newEmail);
        email.value = newEmail;
      }

      if (newFullName != null) {
        await SharedPrefHelper.saveFullName(newFullName);
        fullName.value = newFullName;
      }

      Get.snackbar(
        'Success',
        'Profile updated',
        backgroundColor: const Color(0xFF4CAF50),
        colorText: const Color(0xFFFFFFFF),
        duration: const Duration(seconds: 2),
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Update error: ${e.toString()}',
        backgroundColor: const Color(0xFFF44336),
        colorText: const Color(0xFFFFFFFF),
      );
    } finally {
      isLoading.value = false;
    }
  }
}
