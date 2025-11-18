import 'package:get/get.dart';
import 'package:pasmobile11pplg1_06/controllers/listproduk_controller.dart';

class ListprodukBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListprodukController>(() => ListprodukController());
  }
}
