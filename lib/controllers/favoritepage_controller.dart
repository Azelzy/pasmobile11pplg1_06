import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasmobile11pplg1_06/helper/dbproduct_helper.dart';
import 'package:pasmobile11pplg1_06/models/Store_model.dart';
import 'package:pasmobile11pplg1_06/controllers/listproduk_controller.dart';

class FavoriteController extends GetxController {
  final isLoading = false.obs;
  final favorites = <FakeStoreModel>[].obs;
  final errorMessage = ''.obs;

  final dbHelper = DbProductHelper();

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  // Load all favorites from database
  Future<void> loadFavorites() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final result = await dbHelper.getAllFavorites();
      favorites.assignAll(result);
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  // Remove favorite
  Future<void> removeFavorite(int productId) async {
    try {
      await dbHelper.removeFromFavorites(productId);
      favorites.removeWhere((p) => p.id == productId);
      
      // FIX #3: Update favoriteIds di ListprodukController jika ada
      try {
        final listController = Get.find<ListprodukController>();
        await listController.refreshFromFavorite();
      } catch (e) {
        // ListprodukController mungkin belum di-load, tidak masalah
        print('ListprodukController not found: $e');
      }
      
      Get.snackbar(
        'Removed',
        'Removed from favorites',
        backgroundColor: const Color(0xFF111111),
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to remove favorite',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  // Clear all favorites
  Future<void> clearAllFavorites() async {
    try {
      await dbHelper.clearAllFavorites();
      favorites.clear();
      
      // FIX #3: Update favoriteIds di ListprodukController jika ada
      try {
        final listController = Get.find<ListprodukController>();
        await listController.refreshFromFavorite();
      } catch (e) {
        // ListprodukController mungkin belum di-load, tidak masalah
        print('ListprodukController not found: $e');
      }
      
      Get.snackbar(
        'Cleared',
        'All favorites cleared',
        backgroundColor: const Color(0xFF111111),
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to clear favorites',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  // Refresh favorites
  Future<void> refreshFavorites() async {
    await loadFavorites();
  }
}