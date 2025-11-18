import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pasmobile11pplg1_06/models/login_model.dart';
import 'package:pasmobile11pplg1_06/models/register_model.dart';
import 'package:pasmobile11pplg1_06/helper/sharedpref_helper.dart';
import 'package:pasmobile11pplg1_06/networks/client_network.dart';
import 'package:pasmobile11pplg1_06/routes/routes.dart';

class AuthController extends GetxController {
  final isLoading = false.obs;
  final errorMessage = ''.obs;

  // Login method
  Future<void> login({
    required String username,
    required String password,
  }) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final response = await http
          .post(
            Uri.parse(ClientNetwork.login),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({'username': username, 'password': password}),
          )
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final loginModel = loginModelFromJson(response.body);

        if (loginModel.status) {
          // Save token dan username
          await SharedPrefHelper.saveToken(loginModel.token);
          await SharedPrefHelper.saveUsername(username);
          await SharedPrefHelper.saveLoginType('api');

          Get.snackbar(
            'Success',
            loginModel.message,
            backgroundColor: const Color(0xFF4CAF50),
            colorText: const Color(0xFFFFFFFF),
            duration: const Duration(seconds: 2),
          );

          // Navigate to bottom nav
          Get.offAllNamed(AppRoutes.bottomNav);
        } else {
          errorMessage.value = loginModel.message;
          Get.snackbar(
            'Error',
            loginModel.message,
            backgroundColor: const Color(0xFFF44336),
            colorText: const Color(0xFFFFFFFF),
          );
        }
      } else {
        errorMessage.value = 'Login failed: ${response.statusCode}';
        Get.snackbar(
          'Error',
          'Login failed: ${response.statusCode}',
          backgroundColor: const Color(0xFFF44336),
          colorText: const Color(0xFFFFFFFF),
        );
      }
    } catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar(
        'Error',
        'Login error: ${e.toString()}',
        backgroundColor: const Color(0xFFF44336),
        colorText: const Color(0xFFFFFFFF),
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Register method
  Future<void> register({
    required String username,
    required String password,
    required String email,
    required String fullName,
  }) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final response = await http
          .post(
            Uri.parse(ClientNetwork.register),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              'username': username,
              'password': password,
              'email': email,
              'full_name': fullName,
            }),
          )
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final registerModel = registerModelFromJson(response.body);

        if (registerModel.status) {
          Get.snackbar(
            'Success',
            registerModel.message,
            backgroundColor: const Color(0xFF4CAF50),
            colorText: const Color(0xFFFFFFFF),
            duration: const Duration(seconds: 2),
          );

          // Navigate to login
          Get.offAllNamed(AppRoutes.login);
        } else {
          errorMessage.value = registerModel.message;
          Get.snackbar(
            'Error',
            registerModel.message,
            backgroundColor: const Color(0xFFF44336),
            colorText: const Color(0xFFFFFFFF),
          );
        }
      } else {
        errorMessage.value = 'Register failed: ${response.statusCode}';
        Get.snackbar(
          'Error',
          'Register failed: ${response.statusCode}',
          backgroundColor: const Color(0xFFF44336),
          colorText: const Color(0xFFFFFFFF),
        );
      }
    } catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar(
        'Error',
        'Register error: ${e.toString()}',
        backgroundColor: const Color(0xFFF44336),
        colorText: const Color(0xFFFFFFFF),
      );
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
}
