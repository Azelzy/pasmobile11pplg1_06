class BookmarkModel {
  final String title;
  final double price;
  final String category;
  final String image;

  BookmarkModel({
    required this.title,
    required this.price,
    required this.category,
    required this.image,
  });

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "price": price,
      "category": category,
      "image": image,
    };
  }

  factory BookmarkModel.fromJson(Map<String, dynamic> json) {
    return BookmarkModel(
      title: json["title"],
      price: json["price"],
      category: json["category"],
      image: json["image"],
    );
  }
}