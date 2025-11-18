import 'package:get/get.dart';
import '../models/bookmark_model.dart';
import '../services/db_helper.dart';

class BookmarkController extends GetxController {
  var bookmarks = <BookmarkModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadBookmarks();
  }

  Future<void> loadBookmarks() async {
    final data = await DBHelper.getBookmarks();
    bookmarks.value = data.map((e) => BookmarkModel.fromJson(e)).toList();
    Get.snackbar("ヤッタ!! ☆*: .｡. o(≧▽≦)o .｡.:*☆", "List berhasil di-refresh");
  }

  Future<void> toggleBookmark(BookmarkModel item) async {
    final exists = bookmarks.any((e) => e.title == item.title);

    if (exists) {
      await DBHelper.delete(item.title);
      Get.snackbar("ヤッタ!! ☆*: .｡. o(≧▽≦)o .｡.:*☆", "Item berhasil di-unbookmark");
    } else {
      await DBHelper.insert(item.toJson());
      Get.snackbar("ヤッタ!! ☆*: .｡. o(≧▽≦)o .｡.:*☆", "Item berhasil di-bookmark");
    }

    await loadBookmarks();
  }

  bool isBookmarked(String title) {
    return bookmarks.any((e) => e.title == title);
  }
}
