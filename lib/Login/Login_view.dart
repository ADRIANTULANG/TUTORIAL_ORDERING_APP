import 'package:flutterbasics/Login/Login_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 3.w, right: 3.w, top: 3.h, bottom: 3.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 40.h,
                width: 100.w,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage("assets/image/logo.png"))),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                alignment: Alignment.center,
                // color: Colors.red,
                height: 6.h,
                width: 100.w,
                child: TextField(
                  controller: controller.username,
                  style: TextStyle(fontSize: 10.sp),
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "Username",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0))),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                alignment: Alignment.center,
                // color: Colors.red,
                height: 6.h,
                width: 100.w,
                child: TextField(
                  obscureText: true,
                  controller: controller.password,
                  style: TextStyle(fontSize: 10.sp),
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0))),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              InkWell(
                onTap: () {
                  controller.login(
                      context: context,
                      user: controller.username.text,
                      pass: controller.password.text);
                },
                child: Container(
                  height: 6.h,
                  width: 100.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.yellow[700],
                      borderRadius: BorderRadius.circular(32)),
                  child: Text(
                    "Login",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
