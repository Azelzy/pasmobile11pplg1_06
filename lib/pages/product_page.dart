import 'package:flutter/material.dart';
import '../components/product_card.dart';
import '../controllers/product_controller.dart';
import '../utils/colors.dart';
import 'package:get/get.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController controller = Get.find();

    return Scaffold(
      backgroundColor: AppColors.backround,
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.product.isEmpty) {
          return const Center(child: Text("Tidak ada data liga"));
        }

        return ListView.builder(
          padding: EdgeInsets.all(20),
          itemCount: controller.product.length,
          itemBuilder: (context, index) {
            final item = controller.product[index];

            return ProductCard(
              productName: item.title,
              price: item.price,
              category: item.category.name,
              image: item.image,
            );
          },
        );
      }),
    );
  }
}