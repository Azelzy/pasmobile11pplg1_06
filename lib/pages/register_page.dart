import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/custom_appbar.dart';
import '../components/custom_button.dart';
import '../components/login_textfield.dart';
import '../controllers/register_controller.dart';
import '../utils/colors.dart';
import '../utils/apptextstyle.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RegisterController>();

    return Scaffold(
      backgroundColor: AppColors.backround,
      appBar: CustomAppbar(
        title: 'レジスター',
        leftIcon: Icons.arrow_back,
        onLeftPressed: () => Get.back(),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                'Create an Account',
                style: AppTextStyle.title.copyWith(color: AppColors.primary),
              ),
              const SizedBox(height: 10),
              Text(
                'Sign up to get started',
                style: AppTextStyle.paragraph.copyWith(
                  color: AppColors.secondary,
                ),
              ),
              const SizedBox(height: 40),

              // Full Name
              Text(
                'Full Name',
                style: AppTextStyle.paragraph.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 10),
              LoginTextfield(
                controller: controller.fullnameController,
                hintText: 'Enter your full name',
                prefixIcon: Icons.person,
              ),
              const SizedBox(height: 25),

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
                prefixIcon: Icons.person_outline,
              ),
              const SizedBox(height: 25),

              // Email
              Text(
                'Email',
                style: AppTextStyle.paragraph.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 10),
              LoginTextfield(
                controller: controller.emailController,
                hintText: 'Enter your email',
                prefixIcon: Icons.email,
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

              // Register Button
              Obx(() {
                return CustomButton(
                  text: controller.isLoading.value ? 'Loading...' : 'Register',
                  onPressed: controller.isLoading.value
                      ? null
                      : () => controller.register(),
                );
              }),
              const SizedBox(height: 20),

              // Login Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: AppTextStyle.paragraph.copyWith(
                      color: AppColors.secondary,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Text(
                      'Login',
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
