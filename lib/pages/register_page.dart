import 'package:flutter/material.dart';
import '../components/custom_button.dart';
import '../components/login_textfield.dart';
import '../controllers/register_controller.dart';
import '../routes/routes.dart';
import '../utils/apptextstyle.dart';
import '../utils/colors.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterController controller = Get.find();

    return Scaffold(
      backgroundColor: AppColors.backround,
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Center(child: Text('AmbaStore App', style: AppTextStyle.title)),
              SizedBox(height: 50),
              Center(
                child: Text(
                  'Silahkan membuat akun disini!',
                  style: AppTextStyle.paragraph.copyWith(
                    color: AppColors.secondary,
                  ),
                ),
              ),
              SizedBox(height: 25),
              LoginTextfield(
                controller: controller.usernameController,
                hintText: 'Masukkan Username',
              ),
              SizedBox(height: 15),
              Obx(
                () => LoginTextfield(
                  controller: controller.passwordController,
                  hintText: 'Masukkan Password',
                  obscure: controller.obscurePassword.value,
                  onToggleObscrure: controller.toggleObscure,
                  isPassword: true,
                ),
              ),
              SizedBox(height: 15),
              LoginTextfield(
                controller: controller.fullnameController,
                hintText: 'Masukkan Nama Lengkap',
              ),
              SizedBox(height: 15),
              LoginTextfield(
                controller: controller.emailController,
                hintText: 'Masukkan Email',
              ),
              SizedBox(height: 25),
              CustomButton(
                  text: 'Buat Akun',
                  onPressed: controller.register
              ),
              SizedBox(height: 25),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sudah punya akun?',
                      style: AppTextStyle.paragraph.copyWith(
                        color: AppColors.secondary,
                      ),
                    ),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Get.offAllNamed(AppRoutes.login);
                      }  ,
                      child: Text(
                        'Login',
                        style: AppTextStyle.paragraph.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    )
                  ],
                )
              ),
            ],
          ),
        ],
      ),
    );
  }
}