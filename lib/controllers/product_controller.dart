import 'package:get/get.dart';
import '../models/product_model.dart';
import '../services/api_service.dart';

class ProductController extends GetxController {
  var isLoading = false.obs;
  var product = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProduct();
  }

  void fetchProduct() async {
    try {
      isLoading.value = true;
      product.value = await ApiService.getProduct();
      Get.snackbar("ヤッタ!! ☆*: .｡. o(≧▽≦)o .｡.:*☆", "List berhasil di-refresh");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
