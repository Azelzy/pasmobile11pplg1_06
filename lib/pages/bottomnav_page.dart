import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/bottomnav_controller.dart';
import '../pages/product_page.dart';
import '../pages/bookmark_page.dart';
import '../pages/profile_page.dart';
import '../utils/colors.dart';

class BottomnavPage extends StatelessWidget {
  const BottomnavPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BottomNavController>();

    final pages = [
      const ProductPage(),
      const BookmarkPage(),
      const ProfilePage(),
    ];

    return Scaffold(
      backgroundColor: AppColors.backround,
      body: Obx(() {
        return pages[controller.currentIndex.value];
      }),
      bottomNavigationBar: Obx(() {
        return Container(
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: AppColors.primary, width: 2)),
            color: AppColors.backround,
          ),
          child: NavigationBar(
            height: 70,
            backgroundColor: AppColors.backround,
            indicatorColor: AppColors.primary,
            selectedIndex: controller.currentIndex.value,
            onDestinationSelected: (index) {
              controller.changeTabIndex(index);
            },
            destinations: [
              NavigationDestination(
                icon: Icon(
                  Icons.shopping_bag_outlined,
                  color: controller.currentIndex.value == 0
                      ? AppColors.white
                      : AppColors.primary,
                  size: 28,
                ),
                selectedIcon: Icon(
                  Icons.shopping_bag,
                  color: AppColors.white,
                  size: 28,
                ),
                label: 'Products',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.bookmark_border,
                  color: controller.currentIndex.value == 1
                      ? AppColors.white
                      : AppColors.primary,
                  size: 28,
                ),
                selectedIcon: Icon(
                  Icons.bookmark,
                  color: AppColors.white,
                  size: 28,
                ),
                label: 'Bookmarks',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.person_outline,
                  color: controller.currentIndex.value == 2
                      ? AppColors.white
                      : AppColors.primary,
                  size: 28,
                ),
                selectedIcon: Icon(
                  Icons.person,
                  color: AppColors.white,
                  size: 28,
                ),
                label: 'Profile',
              ),
            ],
          ),
        );
      }),
    );
  }
}
