import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/product_controller.dart';
import '../controllers/bookmark_controller.dart';
import '../models/bookmark_model.dart';
import '../utils/colors.dart';
import '../utils/apptextstyle.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productController = Get.find<ProductController>();
    final bookmarkController = Get.find<BookmarkController>();

    return Scaffold(
      backgroundColor: AppColors.backround,
      body: Column(
        children: [
          // Custom AppBar with Refresh
          Container(
            padding: const EdgeInsets.only(
              left: 25,
              right: 25,
              top: 25,
              bottom: 15,
            ),
            decoration: BoxDecoration(
              color: AppColors.backround,
              border: Border(
                bottom: BorderSide(color: AppColors.primary, width: 2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'プロダクト',
                  style: AppTextStyle.paragraph.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                    fontSize: 20,
                  ),
                ),
                // Refresh Button
                Obx(() {
                  return GestureDetector(
                    onTap: productController.isLoading.value
                        ? null
                        : () => productController.fetchProduct(),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primary, width: 2),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Icon(
                        Icons.refresh,
                        color: AppColors.primary,
                        size: 20,
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
          // Products List
          Expanded(
            child: Obx(() {
              if (productController.isLoading.value) {
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.primary,
                    ),
                  ),
                );
              }

              if (productController.product.isEmpty) {
                return Center(
                  child: Text(
                    'No products available',
                    style: AppTextStyle.paragraph.copyWith(
                      color: AppColors.secondary,
                    ),
                  ),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: productController.product.length,
                itemBuilder: (context, index) {
                  final product = productController.product[index];

                  return Obx(() {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        border: Border.all(color: AppColors.primary, width: 2),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Product Image
                          ClipRRect(
                            borderRadius: BorderRadius.circular(0),
                            child: Container(
                              width: 400,
                              height: 400,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.primary,
                                  width: 1,
                                ),
                              ),
                              child: Image.network(
                                product.image,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: AppColors.gray,
                                    child: Center(
                                      child: Text(
                                        'Image not available',
                                        style: AppTextStyle.paragraph.copyWith(
                                          color: AppColors.secondary,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),

                          // Product Title
                          Text(
                            product.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle.paragraph.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(height: 8),

                          // Price and Category
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$${product.price.toStringAsFixed(2)}',
                                style: AppTextStyle.paragraph.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primary,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.primary,
                                    width: 1,
                                  ),
                                ),
                                child: Text(
                                  product.category.toString().split('.').last,
                                  style: AppTextStyle.paragraph2.copyWith(
                                    color: AppColors.primary,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),

                          // Rating
                          Text(
                            'Rating: ${product.rating.rate} (${product.rating.count} reviews)',
                            style: AppTextStyle.paragraph2.copyWith(
                              color: AppColors.secondary,
                            ),
                          ),
                          const SizedBox(height: 15),

                          // Bookmark Button
                          GestureDetector(
                            onTap: () {
                              final bookmarkItem = BookmarkModel(
                                title: product.title,
                                price: product.price,
                                category: product.category
                                    .toString()
                                    .split('.')
                                    .last,
                                image: product.image,
                              );
                              bookmarkController.toggleBookmark(bookmarkItem);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    bookmarkController.isBookmarked(
                                      product.title,
                                    )
                                    ? AppColors.primary
                                    : AppColors.backround,
                                border: Border.all(
                                  color: AppColors.primary,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    bookmarkController.isBookmarked(
                                          product.title,
                                        )
                                        ? Icons.bookmark
                                        : Icons.bookmark_border,
                                    color:
                                        bookmarkController.isBookmarked(
                                          product.title,
                                        )
                                        ? AppColors.white
                                        : AppColors.primary,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    bookmarkController.isBookmarked(
                                          product.title,
                                        )
                                        ? 'Bookmarked'
                                        : 'Bookmark',
                                    style: AppTextStyle.paragraph.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color:
                                          bookmarkController.isBookmarked(
                                            product.title,
                                          )
                                          ? AppColors.white
                                          : AppColors.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  });
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
