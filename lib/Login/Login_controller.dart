import 'package:flutter/material.dart';
import 'package:flutterbasics/Homepage/homepage.dart';
import 'package:flutterbasics/Login/Login_api.dart';
import 'package:flutterbasics/storage.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  RxString text = "Login".obs;
  RxBool boolean = false.obs;
  RxInt asdasd = 0.obs;
  RxList lst = [].obs;

  login({
    required String user,
    required String pass,
    required BuildContext context,
  }) async {
    List result = await LoginApi.loginapi(username: user, password: pass);

    if (result.isNotEmpty) {
      print(result[0]['userid']);
      print(result[0]['name']);
      print(result[0]['pass']);
      print(result[0]['user']);
      print(result[0]['gender']);
      await Get.find<StorageService>().setUser(
        userid: result[0]['userid'],
        name: result[0]['name'],
        pass: result[0]['pass'],
        user: result[0]['user'],
        gender: result[0]['gender'],
      );
      Get.to(() => MyHomePage());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('User did not exist!'),
        backgroundColor: Colors.red,
      ));
    }
  }
}
