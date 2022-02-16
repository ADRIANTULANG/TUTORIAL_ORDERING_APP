import 'package:flutterbasics/CartScreen/Cart_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: Text("Cart"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 3.w, right: 3.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 2.h,
              ),
              Container(
                child: Obx(
                  () => ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.cart.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 2.h),
                        child: Container(
                          height: 12.h,
                          width: 100.w,
                          child: Row(
                            children: [
                              Container(
                                height: 12.h,
                                width: 25.w,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(controller
                                            .cart[index].productimage))),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                controller
                                                    .cart[index].productname,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14.sp,
                                                ),
                                              ),
                                              Obx(
                                                () => Text(
                                                  "₱ " +
                                                      controller
                                                          .count_product_total(
                                                              index: index)
                                                          .value
                                                          .toString(),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 12.sp,
                                                      color: Colors.red),
                                                ),
                                              )
                                            ],
                                          ),
                                          Container(
                                            width: 100.w,
                                            alignment: Alignment.centerLeft,
                                            child: Text("P " +
                                                controller
                                                    .cart[index].productPrice),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  if (controller.cart[index]
                                                          .quantity.value !=
                                                      0) {
                                                    controller.cart[index]
                                                        .quantity.value--;
                                                    if (controller.cart[index]
                                                            .quantity.value ==
                                                        0) {
                                                      controller.cart
                                                          .removeAt(index);
                                                    }
                                                  }
                                                },
                                                child: Container(
                                                  height: 3.h,
                                                  width: 7.w,
                                                  alignment: Alignment.center,
                                                  color: Colors.black12,
                                                  child: Text("-"),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 2.w,
                                              ),
                                              Container(
                                                height: 3.h,
                                                width: 10.w,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black45)),
                                                child: Obx(() => Text(controller
                                                    .cart[index].quantity.value
                                                    .toString())),
                                              ),
                                              SizedBox(
                                                width: 2.w,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  controller.cart[index]
                                                      .quantity.value++;
                                                },
                                                child: Container(
                                                  height: 3.h,
                                                  width: 7.w,
                                                  color: Colors.black12,
                                                  alignment: Alignment.center,
                                                  child: Text("+"),
                                                ),
                                              ),
                                            ],
                                          ),
                                          InkWell(
                                              onTap: () {
                                                controller.cart[index].quantity
                                                    .value = 0;
                                                controller.cart.removeAt(index);
                                              },
                                              child: Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                              ))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
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
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 3.w, right: 3.w),
        height: 8.h,
        width: 100.w,
        color: Colors.yellow[700],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "TOTAL  ₱ ${controller.count_cart_total_amount().value.toStringAsFixed(2)}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13.sp,
              ),
            ),
            Container(
              height: 6.h,
              width: 50.w,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(32)),
              alignment: Alignment.center,
              child: Text(
                "Checkout",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp,
                    color: Colors.yellow[700]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
