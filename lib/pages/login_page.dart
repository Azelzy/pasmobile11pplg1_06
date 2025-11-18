import 'package:flutter/material.dart';
import '../components/custom_button.dart';
import '../components/login_textfield.dart';
import '../controllers/login_controller.dart';
import '../routes/routes.dart';
import '../utils/apptextstyle.dart';
import '../utils/colors.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.find();

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
                  'Silahkan login disini!',
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
              SizedBox(height: 25),
              CustomButton(
                  text: 'Login',
                  onPressed: controller.login
              ),
              SizedBox(height: 25),
              Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Belum punya akun?',
                        style: AppTextStyle.paragraph.copyWith(
                          color: AppColors.secondary,
                        ),
                      ),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.register);
                        }  ,
                        child: Text(
                          'Daftar Akun',
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