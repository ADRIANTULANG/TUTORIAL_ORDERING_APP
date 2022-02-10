import 'package:flutterbasics/SplashScreen/SplashScreen_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SplashScreenController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          // decoration: BoxDecoration(
          //     image: DecorationImage(
          //         image: AssetImage("assets/image/newlogo.gif"))),
          child: Image.asset(
            "assets/image/newlogo.gif",
            height: 40.h,
            width: 80.w,
          ),
        ),
      ),
    );
  }
}
