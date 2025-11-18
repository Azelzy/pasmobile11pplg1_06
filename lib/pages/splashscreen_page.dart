import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasmobile11pplg1_06/helper/sharedpref_helper.dart';
import 'package:pasmobile11pplg1_06/routes/routes.dart';

class SplashscreenPage extends StatelessWidget {
  const SplashscreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigate after 2 seconds
    Future.delayed(const Duration(seconds: 2), () async {
      try {
        final isLoggedIn = await SharedPrefHelper.isLoggedIn();
        if (isLoggedIn) {
          Get.offNamed(AppRoutes.bottomNav);
        } else {
          Get.offNamed(AppRoutes.login);
        }
      } catch (e) {
        Get.offNamed(AppRoutes.login);
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Brutalist style header
            Container(
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 3),
              ),
              child: const Text(
                'ストアー',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 4,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 60),
            // Loading indicator
            const SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'LOADING',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
