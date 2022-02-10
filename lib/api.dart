import 'dart:async';
import 'dart:convert';
import 'package:flutterbasics/endpoints.dart';
import 'package:http/http.dart' as http;

class MyApi {
// Future<List<StoreDetailsModel>>

  String stringname = "";

  static getData() async {
    var response;
    response = await http.post(
      Uri.parse("$endPoint/getdata.php"),
      body: {},
    );
    if (response.statusCode == 200) {
      // return busFromJson(json.encode(json.decode(response.body)));
    } else {
      return Future.error(true);
    }
  }

  static getData_api() async {
    try {
      var response = await http.post(Uri.parse("$endPoint/getdata.php"));
      if (response.statusCode == 200) {
        print("Request success");
        return jsonDecode(response.body);
        // return null;
      } else if (response.statusCode == 400) {
        print("fail");
        return "Server fail";
      }
    } on Exception catch (e) {
      print("ERROR: $e");

      return null;
    }
  }

  static add_Data_api(
      {required String name,
      required String gender,
      required String user,
      required String pass}) async {
    try {
      var response =
          await http.post(Uri.parse("$endPoint/addUsers.php"), body: {
        "name": name,
        "user": user,
        "pass": pass,
        "gender": gender,
      });
      if (response.statusCode == 200) {
        print("Request success");
        return "Success";
        // return null;
      } else if (response.statusCode == 400) {
        print("fail");
        return "Server fail";
      }
    } on Exception catch (e) {
      print("ERROR: $e");
      return "error";
    }
  }

  static update_api(
      {required String name,
      required String gender,
      required String user,
      required String id,
      required String pass}) async {
    try {
      var response = await http.post(Uri.parse("$endPoint/updateUser.php"),
          body: {
            "name": name,
            "user": user,
            "pass": pass,
            "gender": gender,
            "userid": id
          });
      print(response.body);
      if (response.statusCode == 200) {
        print("Request success");
        return "Success";
        // return null;
      } else if (response.statusCode == 400) {
        print("fail");
        return "Server fail";
      }
    } on Exception catch (e) {
      print("ERROR: $e");
      return "error";
    }
  }

// Future<List<Bus>>
  // static Future<List<History>> getHistory({
  //   required String customerid,
  // }) async {
  //   try {
  //     var response = await http.post(
  //       Uri.parse("$endPoint/getHistory.php"),
  //       body: {
  //         "customerid": customerid,
  //       },
  //     ).timeout(const Duration(seconds: 10), onTimeout: () {
  //       throw TimeoutException("timeout");
  //     });

  //     // print('getHistory code ${response.statusCode}');
  //     // print('getHistory body ${response.body}');
  //     // print(json.encode(json.decode(response.body)));
  //     if (response.statusCode == 200) {
  //       return historyFromJson(json.encode(json.decode(response.body)));
  //     } else {
  //       return Future.error(true);
  //     }
  //   } catch (error) {
  //     print('getBus catch error $error');
  //     return Future.error(true);
  //   }
  // }
}
