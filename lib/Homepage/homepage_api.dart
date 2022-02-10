import 'dart:async';
import 'dart:convert';

import 'package:flutterbasics/Homepage/homepage_model.dart';
import 'package:flutterbasics/endpoints.dart';
import 'package:http/http.dart' as http;

class HomepageApi {
  // Future<List<Bus>>
  static Future<List<TopthreeStore>> getStores_Top_Three() async {
    try {
      var response = await http.post(
        Uri.parse("$endPoint/get-stores-top-three.php"),
        body: {},
      ).timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("timeout");
      });
      if (response.statusCode == 200) {
        return topthreeStoreFromJson(jsonEncode(jsonDecode(response.body)));
        // return historyFromJson(json.encode(json.decode(response.body)));
      } else {
        return Future.error(true);
      }
    } catch (error) {
      print('getStores_Top_Three catch error $error');
      return Future.error(true);
    }
  }

  static Future<List<PopularStores>> getStores_Popular_Stores() async {
    try {
      var response = await http.post(
        Uri.parse("$endPoint/get-stores-popular-stores.php"),
        body: {},
      ).timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("timeout");
      });
      if (response.statusCode == 200) {
        return popularStoresFromJson(jsonEncode(jsonDecode(response.body)));
        // return historyFromJson(json.encode(json.decode(response.body)));
      } else {
        return Future.error(true);
      }
    } catch (error) {
      print('getStores_Popular_Stores catch error $error');
      return Future.error(true);
    }
  }

  static Future<List<AllStores>> getStores_all_stores() async {
    try {
      var response = await http.post(
        Uri.parse("$endPoint/get-stores-all.php"),
        body: {},
      ).timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("timeout");
      });
      if (response.statusCode == 200) {
        return allStoresFromJson(jsonEncode(jsonDecode(response.body)));
        // return historyFromJson(json.encode(json.decode(response.body)));
      } else {
        return Future.error(true);
      }
    } catch (error) {
      print('getStores_all_stores catch error $error');
      return Future.error(true);
    }
  }
}
