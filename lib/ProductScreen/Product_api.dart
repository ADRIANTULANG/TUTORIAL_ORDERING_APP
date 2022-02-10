import 'dart:async';
import 'dart:convert';

import 'package:flutterbasics/ProductScreen/Product_model.dart';
import 'package:flutterbasics/endpoints.dart';

import 'package:http/http.dart' as http;

class ProductsApi {
  //
  static Future<List<TemporyProductModel>> get_products(
      {required String storeid}) async {
    try {
      var response = await http.post(
        Uri.parse("$endPoint/getproducts.php"),
        body: {'storeid': storeid},
      ).timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("timeout");
      });
      if (response.statusCode == 200) {
        return temporaryModelFromJson(json.encode(json.decode(response.body)));
      } else {
        return Future.error(true);
      }
    } catch (error) {
      print('get_products catch error $error');
      return Future.error(true);
    }
  }
}
