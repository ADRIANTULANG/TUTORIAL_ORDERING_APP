import 'package:flutterbasics/Homepage/homepage_Controller.dart';
import 'package:flutterbasics/ProductScreen/Product_view.dart';

import 'package:flutterbasics/storage.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MyHomePage extends GetView<HomepageController> {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomepageController());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 3.w, right: 3.w, top: 5.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 1.h,
              ),
              Container(
                width: 100.w,
                // color: Colors.red,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.menu_sharp,
                          color: Colors.black54,
                          size: 30.sp,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Container(
                          width: 70.w,
                          child: Text(
                            "Cagayan De Oro Misamis Orienta",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 11.sp),
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.shopping_cart,
                      color: Colors.black54,
                      size: 23.sp,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                alignment: Alignment.center,
                // color: Colors.red,
                height: 6.h,
                width: 100.w,
                child: TextField(
                  // controller: controller.username,
                  style: TextStyle(fontSize: 10.sp),
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "Search",
                      hintStyle: TextStyle(
                        color: Colors.black54,
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 5, color: Colors.black),
                          borderRadius: BorderRadius.circular(32.0))),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                width: 100.w,
                child: Text(
                  "WELCOME BACK ${Get.find<StorageService>().box.read('name').toString().toUpperCase()}!",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 15.sp),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                width: 100.h,
                child: Text(
                  "Top Stores",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                height: 22.h,
                width: 100.w,
                alignment: Alignment.center,
                child: Obx(
                  () => ListView.builder(
                    itemCount: controller.storesTopThree.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 3.w),
                        child: InkWell(
                          onTap: () {
                            Get.to(() => ProductView(), arguments: {
                              'storeid':
                                  controller.storesTopThree[index].storeid,
                              'storename':
                                  controller.storesPopular[index].storename,
                            });
                          },
                          child: Container(
                            width: 45.w,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                // color: Colors.green,
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 14.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                      ),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(controller
                                              .storesTopThree[index]
                                              .storeimage))),
                                ),
                                SizedBox(
                                  height: .5.h,
                                ),
                                Container(
                                  width: 100.w,
                                  padding: EdgeInsets.only(left: 1.5.w),
                                  child: Text(
                                    controller.storesTopThree[index].storename,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.sp,
                                        color: Colors.black),
                                  ),
                                ),
                                Container(
                                  width: 100.w,
                                  padding: EdgeInsets.only(left: 1.5.w),
                                  child: Text(
                                    controller.storesTopThree[index].address,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 9.sp,
                                        color: Colors.black54),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Container(
                width: 100.h,
                child: Text(
                  "Popular Stores",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                height: 22.h,
                width: 100.w,
                alignment: Alignment.center,
                child: Obx(
                  () => ListView.builder(
                    itemCount: controller.storesPopular.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 3.w),
                        child: InkWell(
                          onTap: () {
                            Get.to(() => ProductView(), arguments: {
                              'storeid':
                                  controller.storesPopular[index].storeid,
                              'storename':
                                  controller.storesPopular[index].storename,
                            });
                          },
                          child: Container(
                            width: 45.w,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                // color: Colors.green,
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 14.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                      ),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(controller
                                              .storesPopular[index]
                                              .storeimage))),
                                ),
                                SizedBox(
                                  height: .5.h,
                                ),
                                Container(
                                  width: 100.w,
                                  padding: EdgeInsets.only(left: 1.5.w),
                                  child: Text(
                                    controller.storesPopular[index].storename,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.sp,
                                        color: Colors.black),
                                  ),
                                ),
                                Container(
                                  width: 100.w,
                                  padding: EdgeInsets.only(left: 1.5.w),
                                  child: Text(
                                    controller.storesPopular[index].address,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 9.sp,
                                        color: Colors.black54),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Container(
                width: 100.h,
                child: Text(
                  "Near by Stores",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                // color: Colors.black,
                width: 100.w,
                alignment: Alignment.center,
                child: Obx(
                  () => ListView.builder(
                    padding: EdgeInsets.all(0),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.storesAll.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 3.w),
                        child: InkWell(
                          onTap: () {
                            Get.to(() => ProductView(), arguments: {
                              'storeid': controller.storesAll[index].storeid,
                              'storename':
                                  controller.storesAll[index].storename,
                            });
                          },
                          child: Container(
                              height: 20.h,
                              width: 100.w,
                              alignment: Alignment.bottomCenter,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(controller
                                          .storesAll[index].storeimage)),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 100.w,
                                    padding: EdgeInsets.only(left: 2.w),
                                    child: Text(
                                      controller.storesAll[index].storename,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.sp,
                                          color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    width: 100.w,
                                    padding: EdgeInsets.only(left: 2.w),
                                    child: Text(
                                      controller.storesAll[index].address,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 9.sp,
                                          color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  )
                                ],
                              )),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
