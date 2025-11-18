import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasmobile11pplg1_06/controllers/listproduk_controller.dart';
import 'package:pasmobile11pplg1_06/widgets/button.dart';

class ListprodukPage extends GetView<ListprodukController> {
  const ListprodukPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'PRODUCTS',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: Colors.black, height: 2),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              strokeWidth: 3,
            ),
          );
        }

        if (controller.products.isEmpty) {
          return const Center(
            child: Text(
              'NO PRODUCTS',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                color: Colors.black,
              ),
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () => controller.fetchProducts(),
          color: Colors.black,
          backgroundColor: Colors.white,
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: controller.products.length,
            itemBuilder: (context, index) {
              final product = controller.products[index];
              final isFavorited = controller.isFavorited(product.id);

              return Container(
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product image
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.black, width: 2),
                        ),
                        color: Colors.grey[100],
                      ),
                      child: Image.network(
                        product.image,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Text('IMAGE NOT AVAILABLE'),
                          );
                        },
                      ),
                    ),
                    // Product info
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title
                          Text(
                            product.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                              height: 1.3,
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Price and rating
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$${product.price.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  letterSpacing: 1,
                                ),
                              ),
                              Text(
                                '⭐ ${product.rating.rate}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          // Category
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1),
                            ),
                            child: Text(
                              product.category.name,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          // Bookmark button
                          AppButton(
                            label: isFavorited ? 'UNBOOKMARK' : 'BOOKMARK',
                            onPressed: () => controller.toggleFavorite(product),
                            backgroundColor: isFavorited
                                ? Colors.black
                                : Colors.white,
                            textColor: isFavorited
                                ? Colors.white
                                : Colors.black,
                            height: 44,
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
