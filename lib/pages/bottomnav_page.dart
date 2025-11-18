import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasmobile11pplg1_06/controllers/bottom_nav_controller.dart';
import 'package:pasmobile11pplg1_06/pages/favorite_page.dart';
import 'package:pasmobile11pplg1_06/pages/listproduk_page.dart';
import 'package:pasmobile11pplg1_06/pages/profile_page.dart';

class BottomnavPage extends GetView<BottomNavController> {
  BottomnavPage({super.key});

  final List<Widget> pages = [
    const ListprodukPage(),
    const FavoritePage(),
    const ProfilePage(),
  ];

  final List<String> titles = ['PRODUCTS', 'BOOKMARKS', 'PROFILE'];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        body: pages[controller.currentIndex.value],
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Colors.black, width: 2)),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            elevation: 0,
            currentIndex: controller.currentIndex.value,
            onTap: (index) => controller.changeTabIndex(index),
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: controller.currentIndex.value == 0
                          ? Colors.black
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: const Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.black,
                  ),
                ),
                label: 'PRODUCTS',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: controller.currentIndex.value == 1
                          ? Colors.black
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: const Icon(
                    Icons.bookmark_outlined,
                    color: Colors.black,
                  ),
                ),
                label: 'BOOKMARKS',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: controller.currentIndex.value == 2
                          ? Colors.black
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: const Icon(Icons.person_outlined, color: Colors.black),
                ),
                label: 'PROFILE',
              ),
            ],
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              letterSpacing: 0.5,
            ),
            unselectedLabelStyle: const TextStyle(fontSize: 12),
          ),
        ),
      ),
    );
  }
}
