import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasmobile11pplg1_06/controllers/auth_controller.dart';
import 'package:pasmobile11pplg1_06/routes/routes.dart';
import 'package:pasmobile11pplg1_06/widgets/button.dart';

class LoginPage extends GetView<AuthController> {
  LoginPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              // Header
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: const Text(
                  'LOGIN',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 48),
              // Username field
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    hintText: 'USERNAME',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      letterSpacing: 1,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(16),
                  ),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Password field
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'PASSWORD',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      letterSpacing: 1,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(16),
                  ),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              // Login button
              Obx(
                () => AppButton(
                  label: 'LOGIN',
                  isLoading: controller.isLoading.value,
                  onPressed: () {
                    if (usernameController.text.isEmpty ||
                        passwordController.text.isEmpty) {
                      Get.snackbar(
                        'Error',
                        'Please fill all fields',
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                      return;
                    }
                    controller.login(
                      username: usernameController.text,
                      password: passwordController.text,
                    );
                  },
                  borderSide: const BorderSide(color: Colors.black, width: 2),
                ),
              ),
              const SizedBox(height: 24),
              // Register link
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'No account? ',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        letterSpacing: 0.5,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed(AppRoutes.register),
                      child: const Text(
                        'REGISTER',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
