import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splashscreen_controller.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    // inisialisasi controller
    Get.put(SplashScreenController());

    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          "MY APP",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}