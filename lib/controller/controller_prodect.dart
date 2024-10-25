import 'package:get/state_manager.dart';
import '../model/model_product.dart';
import '../service/service_controller.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;

  // Correct the type and initialization of productList
  var productList = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
