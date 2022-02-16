import 'package:flutterbasics/CartScreen/Cart_view.dart';
import 'package:flutterbasics/ProductScreen/Product_Controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:badges/badges.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProductController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: Obx(() => Text(controller.storename.value)),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Obx(
        () => controller.isLoadingProducts.value == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : controller.categoryList.isEmpty
                ? Center(
                    child:
                        Text("No products for ${controller.storename.value}"),
                  )
                : CustomScrollView(
                    slivers: <Widget>[
                      SliverFillRemaining(
                        child: Scaffold(
                          appBar: TabBar(
                            indicatorColor: Colors.yellow[700],
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.black54,
                            controller: controller.tabController,
                            isScrollable: true,
                            tabs: List<Widget>.generate(
                                controller.categoryList.length, (int index) {
                              return Tab(
                                child: Container(
                                  child: Text(
                                    controller.categoryList[index].categoryname,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11.sp,
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                          body: TabBarView(
                              controller: controller.tabController,
                              children: List<Widget>.generate(
                                  controller.categoryList.length, (int index) {
                                return Container(
                                  padding: EdgeInsets.only(
                                      left: 3.w, right: 3.w, top: 2.h),
                                  child: GridView.builder(
                                    shrinkWrap: true,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            childAspectRatio: 1),
                                    itemCount: controller.categoryList[index]
                                        .categoryproducts.length,
                                    itemBuilder:
                                        (BuildContext context, int indexList) {
                                      return Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: .5.h, horizontal: 1.w),
                                        child: InkWell(
                                          onTap: () {
                                            controller
                                                .categoryList[index]
                                                .categoryproducts[indexList]
                                                .quantity
                                                .value++;
                                          },
                                          onLongPress: () {
                                            controller
                                                .categoryList[index]
                                                .categoryproducts[indexList]
                                                .quantity
                                                .value = 0;
                                          },
                                          child: Container(
                                            width: 45.w,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey),
                                                // color: Colors.green,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Stack(
                                                  alignment:
                                                      AlignmentDirectional
                                                          .topEnd,
                                                  children: [
                                                    Container(
                                                      height: 14.h,
                                                      width: 100.w,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    15),
                                                            topRight:
                                                                Radius.circular(
                                                                    15),
                                                          ),
                                                          image: DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image: NetworkImage(controller
                                                                  .categoryList[
                                                                      index]
                                                                  .categoryproducts[
                                                                      indexList]
                                                                  .productimage))),
                                                    ),
                                                    Obx(
                                                      () => controller
                                                                  .categoryList[
                                                                      index]
                                                                  .categoryproducts[
                                                                      indexList]
                                                                  .quantity
                                                                  .value ==
                                                              0
                                                          ? Container()
                                                          : Positioned(
                                                              right: 2.w,
                                                              top: 1.h,
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                            .yellow[
                                                                        700],
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5)),
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            2.w,
                                                                        right:
                                                                            2.w,
                                                                        top: .5
                                                                            .h,
                                                                        bottom:
                                                                            .5.h),
                                                                child: Text(
                                                                  controller
                                                                      .categoryList[
                                                                          index]
                                                                      .categoryproducts[
                                                                          indexList]
                                                                      .quantity
                                                                      .value
                                                                      .toString(),
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: .5.h,
                                                ),
                                                Container(
                                                  width: 100.w,
                                                  padding: EdgeInsets.only(
                                                      left: 1.5.w),
                                                  child: Text(
                                                    controller
                                                        .categoryList[index]
                                                        .categoryproducts[
                                                            indexList]
                                                        .productname,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12.sp,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                Container(
                                                  width: 100.w,
                                                  padding: EdgeInsets.only(
                                                      left: 1.5.w),
                                                  child: Text(
                                                    "P" +
                                                        controller
                                                            .categoryList[index]
                                                            .categoryproducts[
                                                                indexList]
                                                            .productPrice,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                );
                              })),
                        ),
                      ),
                    ],
                  ),
      ),
      floatingActionButton: Obx(
        () => controller.total_Quantity().value == 0
            ? FloatingActionButton(
                backgroundColor: Colors.yellow[700],
                child: Icon(Icons.shopping_cart_outlined),
                onPressed: () {},
              )
            : Badge(
                badgeContent: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Obx(
                    () => Text(
                      controller.total_Quantity().value.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 13.sp),
                    ),
                  ),
                ),
                child: FloatingActionButton(
                  backgroundColor: Colors.yellow[700],
                  child: Icon(Icons.shopping_cart_outlined),
                  onPressed: () {
                    Get.to(() => CartView());
                  },
                ),
              ),
      ),
    );
  }
}
