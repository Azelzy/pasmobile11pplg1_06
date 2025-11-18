import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/bookmark_controller.dart';
import '../utils/colors.dart';
import '../utils/apptextstyle.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  'ブックマーク',
                  style: AppTextStyle.paragraph.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          // Bookmarks List
          Expanded(
            child: Obx(() {
              if (bookmarkController.bookmarks.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.bookmark_border,
                        size: 60,
                        color: AppColors.secondary,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'No bookmarks yet',
                        style: AppTextStyle.paragraph.copyWith(
                          color: AppColors.secondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: bookmarkController.bookmarks.length,
                itemBuilder: (context, index) {
                  final bookmark = bookmarkController.bookmarks[index];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(color: AppColors.primary, width: 2),
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Bookmark Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(0),
                          child: Container(
                            width: double.infinity,
                            height: 200,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.primary,
                                width: 1,
                              ),
                            ),
                            child: Image.network(
                              bookmark.image,
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

                        // Title
                        Text(
                          bookmark.title,
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
                              '\$${bookmark.price.toStringAsFixed(2)}',
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
                                bookmark.category,
                                style: AppTextStyle.paragraph2.copyWith(
                                  color: AppColors.primary,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),

                        // Delete Button
                        GestureDetector(
                          onTap: () {
                            bookmarkController.toggleBookmark(bookmark);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
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
                                  Icons.delete,
                                  color: AppColors.white,
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Remove',
                                  style: AppTextStyle.paragraph.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
