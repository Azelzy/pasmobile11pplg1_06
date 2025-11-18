import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/bookmark_controller.dart';

class BookmarkPage extends StatelessWidget {
  BookmarkPage({super.key});

  final BookmarkController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bookmark")),
      body: Obx(() {
        if (controller.bookmarks.isEmpty) {
          return Center(child: Text("Belum ada bookmark"));
        }

        return ListView.builder(
          padding: EdgeInsets.all(20),
          itemCount: controller.bookmarks.length,
          itemBuilder: (context, index) {
            final item = controller.bookmarks[index];
            return Card(
              child: ListTile(
                leading: Image.network(item.image, height: 60),
                title: Text(item.title),
                subtitle: Text("Rp ${item.price}"),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    controller.toggleBookmark(item);
                  },
                ),
              ),
            );
          },
        );
      }),
    );
  }
}