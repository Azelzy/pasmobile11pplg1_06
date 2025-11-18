import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasmobile11pplg1_06/controllers/splashscreen_controller.dart';

class SplashscreenPage extends GetView<SplashscreenController> {
  const SplashscreenPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                'STORE',
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
            SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.black),
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
