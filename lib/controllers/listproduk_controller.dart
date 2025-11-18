import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasmobile11pplg1_06/helper/dbproduct_helper.dart';
import 'package:pasmobile11pplg1_06/models/fakestore_model.dart';
import 'package:pasmobile11pplg1_06/networks/client_network.dart';

class ListprodukController extends GetxController {
  final isLoading = false.obs;
  final products = <FakeStoreModel>[].obs;
  final favoriteIds = <int>{}.obs;
  final errorMessage = ''.obs;

  final dbHelper = DbProductHelper();

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
    loadFavorites();
  }

  // Fetch all products from API
  Future<void> fetchProducts() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final result = await ClientNetwork.getProducts();
      products.assignAll(result);
    } catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar(
        'Error',
        'Failed to load products: ${e.toString()}',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Load favorite IDs from database
  Future<void> loadFavorites() async {
    try {
      final favorites = await dbHelper.getAllFavorites();
      favoriteIds.assignAll(favorites.map((p) => p.id));
    } catch (e) {
      errorMessage.value = e.toString();
    }
  }

  // Check if product is favorited
  bool isFavorited(int productId) {
    return favoriteIds.contains(productId);
  }

  // Toggle favorite
  Future<void> toggleFavorite(FakeStoreModel product) async {
    try {
      if (isFavorited(product.id)) {
        // Remove from favorites
        await dbHelper.removeFromFavorites(product.id);
        favoriteIds.remove(product.id);
        Get.snackbar(
          'Removed',
          'Removed from favorites',
          backgroundColor: Colors.orange,
          colorText: Colors.white,
        );
      } else {
        // Add to favorites
        await dbHelper.addToFavorites(product);
        favoriteIds.add(product.id);
        Get.snackbar(
          'Added',
          'Added to favorites',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to update favorite: ${e.toString()}',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
