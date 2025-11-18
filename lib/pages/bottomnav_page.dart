
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/bookmark_controller.dart';
import '../controllers/bottomnav_controller.dart';
import '../controllers/product_controller.dart';
import '../controllers/profile_controller.dart';
import '../pages/bookmark_page.dart';
import '../pages/product_page.dart';
import '../pages/profile_page.dart';
import '../utils/colors.dart';

class BottomnavPage extends StatelessWidget {
  BottomnavPage({super.key});

  final ProductController productController = Get.put(ProductController());
  final BookmarkController bookmarkController = Get.put(BookmarkController());
  final ProfileController profileController = Get.put(ProfileController());

  final BottomNavController controller = Get.find();

  final List<Widget> pages = [
    ProductPage(),
    BookmarkPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    if (args != null && args is int) {
      controller.currentIndex.value = args;
    }

    return Obx(() => Scaffold(
      backgroundColor: AppColors.white,
      body: pages[controller.currentIndex.value],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: controller.currentIndex.value,
        onTap: (index) => controller.currentIndex.value = index,
        selectedItemColor: AppColors.primary2,
        unselectedItemColor: AppColors.secondary2,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket_rounded),
            label: 'Product',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    ));
  }
}