import 'dart:async';

import 'package:flutterbasics/Homepage/homepage.dart';
import 'package:flutterbasics/Login/Login_view.dart';
import 'package:flutterbasics/storage.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    timer();
    super.onInit();
  }

  timer() {
    Timer(Duration(seconds: 4), () {
      if (Get.find<StorageService>().box.read('userid') == null) {
        print("no user");
        Get.to(() => LoginView());
      } else {
        print("has user");
        Get.to(() => MyHomePage());
      }
    });
  }
}
