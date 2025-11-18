import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/bookmark_controller.dart';
import '../models/bookmark_model.dart';
import '../utils/apptextstyle.dart';
import '../utils/colors.dart';

class ProductCard extends StatelessWidget {
  final String productName;
  final double price;
  final String category;
  final String image;

  const ProductCard({
    super.key,
    required this.productName,
    required this.price,
    required this.category,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final bookmarkController = Get.find<BookmarkController>();

    return Obx(() {
      final isSaved = bookmarkController.isBookmarked(productName);

      return Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(productName, style: AppTextStyle.paragraph.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(price.toString(), style: AppTextStyle.paragraph),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    bookmarkController.toggleBookmark(
                      BookmarkModel(
                        title: productName,
                        price: price,
                        category: category,
                        image: image,
                      ),
                    );
                  },
                  child: Icon(
                    isSaved ? Icons.bookmark : Icons.bookmark_border,
                    color: isSaved ? Colors.orange : Colors.grey,
                  ),
                ),
              ],
            )

          ],
        )
      );
    });
  }
}