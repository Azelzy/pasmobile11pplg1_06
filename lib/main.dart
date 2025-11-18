import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasmobile11pplg1_06/routes/pages.dart';
import 'package:pasmobile11pplg1_06/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'PASMobile11PPLG106',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),

      // → Pertama kali buka app, masuk ke splashscreen
      initialRoute: AppRoutes.splashscreen,
      // → daftar semua halaman
      getPages: AppPages.pages,
    );
  }
}