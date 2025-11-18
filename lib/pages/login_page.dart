import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/custom_appbar.dart';
import '../components/custom_button.dart';
import '../components/login_textfield.dart';
import '../controllers/login_controller.dart';
import '../utils/colors.dart';
import '../utils/apptextstyle.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();

    return Scaffold(
      backgroundColor: AppColors.backround,
      appBar: CustomAppbar(title: 'ロギン'),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                'おかえり!',
                style: AppTextStyle.title.copyWith(color: AppColors.primary),
              ),
              const SizedBox(height: 10),
              Text(
                'Login to continue',
                style: AppTextStyle.paragraph.copyWith(
                  color: AppColors.secondary,
                ),
              ),
              const SizedBox(height: 40),

              // Username
              Text(
                'Username',
                style: AppTextStyle.paragraph.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 10),
              LoginTextfield(
                controller: controller.usernameController,
                hintText: 'Enter your username',
                prefixIcon: Icons.person,
              ),
              const SizedBox(height: 25),

              // Password
              Text(
                'Password',
                style: AppTextStyle.paragraph.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 10),
              Obx(() {
                return LoginTextfield(
                  controller: controller.passwordController,
                  hintText: 'Enter your password',
                  isPassword: true,
                  obscure: controller.obscurePassword.value,
                  onToggleObscrure: () => controller.toggleObscure(),
                  prefixIcon: Icons.lock,
                );
              }),
              const SizedBox(height: 40),

              // Login Button
              Obx(() {
                return CustomButton(
                  text: controller.isLoading.value ? 'Loading...' : 'Login',
                  onPressed: controller.isLoading.value
                      ? null
                      : () => controller.login(),
                );
              }),
              const SizedBox(height: 20),

              // Register Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account? ',
                    style: AppTextStyle.paragraph.copyWith(
                      color: AppColors.secondary,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed('/register'),
                    child: Text(
                      'Register',
                      style: AppTextStyle.paragraph.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
