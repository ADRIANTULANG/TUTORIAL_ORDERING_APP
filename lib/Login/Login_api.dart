import 'dart:async';
import 'dart:convert';

import 'package:flutterbasics/endpoints.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  // Future<List<Bus>>
  static loginapi({required String username, required String password}) async {
    try {
      var response = await http.post(
        Uri.parse("$endPoint/getLogin.php"),
        body: {
          "username": username,
          "password": password,
        },
      ).timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("timeout");
      });
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
        // return historyFromJson(json.encode(json.decode(response.body)));
      } else {
        return Future.error(true);
      }
    } catch (error) {
      print('loginapi catch error $error');
      return Future.error(true);
    }
  }
}
