import 'package:flutterbasics/ProductScreen/Product_Controller.dart';
import 'package:flutterbasics/ProductScreen/Product_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxList<FinalProductModel> categoryList =
      Get.find<ProductController>().categoryList;
  List<Categoryproduct> cart = <Categoryproduct>[].obs;
  @override
  void onInit() {
    get_Cart_items();
    super.onInit();
  }

  get_Cart_items() {
    for (var i = 0; i < categoryList.length; i++) {
      for (var z = 0; z < categoryList[i].categoryproducts.length; z++) {
        if (categoryList[i].categoryproducts[z].quantity.value != 0) {
          cart.add(categoryList[i].categoryproducts[z]);
        }
      }
    }
  }

  RxDouble count_product_total({required int index}) {
    var total = 0.0;
    total = double.parse(cart[index].productPrice) * cart[index].quantity.value;
    return total.obs;
  }

  RxDouble count_cart_total_amount() {
    var total = 0.0;
    for (var i = 0; i < cart.length; i++) {
      total =
          total + (double.parse(cart[i].productPrice) * cart[i].quantity.value);
    }
    return total.obs;
  }
}
