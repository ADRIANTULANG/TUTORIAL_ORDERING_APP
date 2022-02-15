import 'dart:async';
import 'dart:convert';

import 'package:flutterbasics/ProductScreen/Product_api.dart';
import 'package:flutterbasics/ProductScreen/Product_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ProductController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxString storeid = "".obs;
  RxString storename = ''.obs;

  RxList<TemporyProductModel> temporaryList = <TemporyProductModel>[].obs;
  RxList<TemporyProductModel> temporaryMasterList = <TemporyProductModel>[].obs;

  RxList<FinalProductModel> categoryList = <FinalProductModel>[].obs;

  TabController? tabController;
  RxBool isLoadingProducts = true.obs;
  @override
  void onInit() async {
    storeid.value = await Get.arguments['storeid'];
    storename.value = await Get.arguments['storename'];
    getProducts();
    super.onInit();
  }

  getProducts() async {
    var result = await ProductsApi.get_products(storeid: storeid.value);

    temporaryList.assignAll(result);
    temporaryMasterList.assignAll(result);

    final category = temporaryList.map((e) => e.categoryid).toSet();
    temporaryList.retainWhere((x) => category.remove(x.categoryid));

    List list = [];
    for (var i = 0; i < temporaryList.length; i++) {
      Map map = {
        'categoryid': temporaryList[i].categoryid,
        'categoryname': temporaryList[i].categoryname,
        'categoryimage': temporaryList[i].categoryimage,
        'categorystoreid': temporaryList[i].categorystoreid,
        'categoryproducts': []
      };
      list.add(map);
    }

    for (var i = 0; i < list.length; i++) {
      for (var z = 0; z < temporaryMasterList.length; z++) {
        if (list[i]['categoryid'].toString() ==
            temporaryMasterList[z].productCategoryid) {
          Map map = {
            'productid': temporaryMasterList[z].productid,
            'productname': temporaryMasterList[z].productname,
            'productPrice': temporaryMasterList[z].productPrice,
            'productimage': temporaryMasterList[z].productimage,
            'productCategoryid': temporaryMasterList[z].productCategoryid,
            'productStoreId': temporaryMasterList[z].productStoreId,
          };
          list[i]['categoryproducts'].add(map);
        }
      }
    }
    categoryList.assignAll(finalProductModelFromJson(jsonEncode(list)));

    tabController = TabController(
        length: categoryList.length, vsync: this, initialIndex: 0);
    Timer(Duration(seconds: 1), () {
      isLoadingProducts(false);
    });
  }

  RxInt total_Quantity() {
    var total = 0;
    for (var i = 0; i < categoryList.length; i++) {
      for (var z = 0; z < categoryList[i].categoryproducts.length; z++) {
        total = total + categoryList[i].categoryproducts[z].quantity.value;
      }
    }
    return total.obs;
  }
}
