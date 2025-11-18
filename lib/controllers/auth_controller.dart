import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasmobile11pplg1_06/helper/sharedpref_helper.dart';
import 'package:pasmobile11pplg1_06/networks/client_network.dart';
import 'package:pasmobile11pplg1_06/routes/routes.dart';

class AuthController extends GetxController {
  final isLoading = false.obs;
  final errorMessage = ''.obs;
  final username = ''.obs;
  final token = ''.obs;

  // Register
  Future<void> register({
    required String username,
    required String password,
    required String fullName,
    required String email,
  }) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final response = await ClientNetwork.register(
        username: username,
        password: password,
        fullName: fullName,
        email: email,
      );

      if (response.status) {
        Get.snackbar(
          'Success',
          response.message,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.offNamed(AppRoutes.login);
      } else {
        errorMessage.value = response.message;
        Get.snackbar(
          'Error',
          response.message,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Login
  Future<void> login({
    required String username,
    required String password,
  }) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final response = await ClientNetwork.login(
        username: username,
        password: password,
      );

      if (response.status) {
        // Save token to SharedPreferences
        await SharedPrefHelper.saveToken(response.token);
        await SharedPrefHelper.saveUserInfo(username, '', '');

        // Assign ke property class
        this.username.value = username;
        token.value = response.token;

        Get.snackbar(
          'Success',
          'Login Successful',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        Get.offNamed(AppRoutes.bottomNav);
      } else {
        errorMessage.value = response.message;
        Get.snackbar(
          'Error',
          response.message,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Logout
  Future<void> logout() async {
    try {
      isLoading.value = true;
      await SharedPrefHelper.logout();
      username.value = '';
      token.value = '';
      Get.offNamed(AppRoutes.login);
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Check if user is logged in
  Future<bool> checkLogin() async {
    return await SharedPrefHelper.isLoggedIn();
  }

  // Load user info from SharedPreferences
  Future<void> loadUserInfo() async {
    final savedUsername = await SharedPrefHelper.getUsername();
    final savedToken = await SharedPrefHelper.getToken();

    if (savedUsername != null) {
      username.value = savedUsername;
    }
    if (savedToken != null) {
      token.value = savedToken;
    }
  }
}