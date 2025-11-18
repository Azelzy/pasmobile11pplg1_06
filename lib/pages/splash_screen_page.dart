import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splashscreen_controller.dart';
import '../utils/colors.dart';
import '../utils/apptextstyle.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<SplashScreenController>();

    return Scaffold(
      backgroundColor: AppColors.backround,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ストアー',
              style: AppTextStyle.title.copyWith(color: AppColors.primary),
            ),
            const SizedBox(height: 10),
            // Loading Circle
            SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                strokeWidth: 4,
              ),
            ),
            const SizedBox(height: 30),
            // App Title
            
            const SizedBox(height: 10),
            // Loading Text
            Text(
              'Loading...',
              style: AppTextStyle.paragraph.copyWith(
                color: AppColors.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
