import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:like_button/like_button.dart';
import 'package:ltddnc_nhom04_k19/View/product_view.dart';
import 'package:ltddnc_nhom04_k19/controller/UserController.dart';
import '../Styles/color.dart';
import '../Styles/font_styles.dart';
import 'package:flutter_bounce/flutter_bounce.dart';

import '../controller/LaptopController.dart';
import '../controller/OrderController.dart';
import '../model/Laptop.dart';
import 'buy-item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final orderController = Get.find<OrderController>(tag: "orderController");
  final userController = Get.find<UserController>(tag: "userController");
  final laptopController = Get.find<LaptopController>(tag: "laptopController");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF8F9FA),
        body: Column(
            children: [
              Obx(() =>
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 10),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       InkWell(
          //         onTap: () {
          //           Navigator.pop(context);
          //         },
          //         child: Container(
          //           width: 45,
          //           height: 45,
          //           decoration: BoxDecoration(
          //             color: Colors.white,
          //             borderRadius: BorderRadius.circular(30.0),
          //             image: const DecorationImage(
          //               image: AssetImage("assets/icons/back_ic.png"),
          //               fit: BoxFit.cover,
          //             ),
          //           ),
          //         ),
          //       ),
          //       const Text(
          //         'Cart',
          //         style: TextStyle(
          //             color: Colors.black,
          //             fontSize: 16,
          //             fontWeight: FontWeight.w500),
          //       ),
          //       InkWell(
          //         child: Container(
          //           width: 45,
          //           height: 45,
          //           decoration: BoxDecoration(
          //             color: Colors.white,
          //             borderRadius: BorderRadius.circular(30.0),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Expanded(
              child: Padding(
                  padding:
                      const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
                  child: DefaultTabController(
                    length: 5,
                    child: Scaffold(
                      appBar: AppBar(
                        bottom: TabBar(
                          tabs: [
                            Tab(
                              icon: Icon(Icons.card_travel),
                              text: 'Giỏ hàng',
                            ),
                            Tab(
                              icon: Icon(Icons.access_alarm),
                              text: 'Chờ phê duyệt',
                            ),
                            Tab(
                                icon: Icon(Icons.local_shipping_outlined),
                                text: 'Đang giao'),
                            Tab(icon: Icon(Icons.receipt), text: 'Đã nhận'),
                            Tab(icon: Icon(Icons.cancel), text: 'Đã hủy')
                          ],
                        ),
                        title: Text('CART'),
                      ),
                      body: TabBarView(
                        children: [
                          Expanded(
                              child: SingleChildScrollView(
                                  child: Column(children: [
                            Column(
                              children: userController.currentCart.value
                                  .map((cartItem) => Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5.0),
                                        child: InkWell(
                                          onTap: () {},
                                          child: Container(
                                            width: double.infinity,
                                            height: 200,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                color: Colors.white),
                                            child: FutureBuilder<Laptop>(
                                              future: laptopController
                                                  .fetchLaptopByProductId(
                                                      jsonDecode(cartItem)[
                                                          'productId']),
                                              builder: (context, snapshot) {
                                                if (snapshot.hasError) {
                                                  return Center(
                                                    child: Text(
                                                        "${snapshot.error}"),
                                                  );
                                                } else if (snapshot.hasData) {
                                                  return Row(
                                                    children: [
                                                      Expanded(
                                                          child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(15.0),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "BEST CHOISE",
                                                              style: textStyle6,
                                                            ),
                                                            const SizedBox(
                                                              height: 5,
                                                            ),
                                                            Text(
                                                              snapshot
                                                                  .data!.name,
                                                              style: textStyle4,
                                                            ),
                                                            const SizedBox(
                                                              height: 5,
                                                            ),
                                                            Text(
                                                              "Số lượng: ${jsonDecode(cartItem)['quantity']}",
                                                              style: textStyle4,
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text(
                                                              "${jsonDecode(cartItem)['quantity'] * snapshot.data!.price} VNĐ",
                                                              style: textStyle4,
                                                            ),
                                                            Text(''),
                                                            Positioned(
                                                              bottom: 0,
                                                              right: 0,
                                                              child: Bounce(
                                                                onPressed: () {
                                                                  Navigator
                                                                      .push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                const BuyItem()),
                                                                  );
                                                                },
                                                                duration:
                                                                    const Duration(
                                                                        milliseconds:
                                                                            500),
                                                                child:
                                                                    SizedBox(
                                                                        height:
                                                                            45.0,
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsets.only( left: 5.0,),
                                                                              child: TextButton(
                                                                                style: TextButton.styleFrom(
                                                                                  backgroundColor: Colors.blueAccent,
                                                                                  // background
                                                                                  foregroundColor: Colors.white, // foreground
                                                                                ),
                                                                                child: Icon(Icons.remove),
                                                                                onPressed: () async {
                                                                                  await userController.updateCart(jsonDecode(cartItem)['productId'], jsonDecode(cartItem)['quantity'] - 1);
                                                                                },
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsets.only( left: 5.0,),
                                                                              child: TextButton(
                                                                                style: TextButton.styleFrom(
                                                                                  backgroundColor: Colors.blueAccent,
                                                                                  // background
                                                                                  foregroundColor: Colors.white, // foreground
                                                                                ),
                                                                                child: Icon(Icons.add),
                                                                                onPressed: () async {
                                                                                  await userController.updateCart(jsonDecode(cartItem)['productId'], jsonDecode(cartItem)['quantity'] + 1);
                                                                                },
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsets.only( left: 5.0,),
                                                                              child: TextButton(
                                                                                style: TextButton.styleFrom(
                                                                                  backgroundColor: Colors.redAccent,
                                                                                  // background
                                                                                  foregroundColor: Colors.white, // foreground
                                                                                ),
                                                                                child: Icon(Icons.delete_forever),
                                                                                onPressed: () async {
                                                                                  await userController.deleteFromCart(jsonDecode(cartItem)['productId']);
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        )),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      )),
                                                      Expanded(
                                                          child: SizedBox(
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        child: Image.network(
                                                          snapshot.data!.image,
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              double.infinity,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      )),
                                                    ],
                                                  );
                                                } else {
                                                  return LinearProgressIndicator();
                                                }
                                              },
                                            ),
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            )
                          ]))),
                          Expanded(
                              child: SingleChildScrollView(
                                  child: Column(children: [
                            Column(
                              // Chờ phê duyệt
                              children: orderController.waitingConfirm.value
                                  .map((order) => Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5.0),
                                        child: InkWell(
                                          onTap: () {},
                                          child: Container(
                                            width: double.infinity,
                                            height: 180,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                color: Colors.white),
                                            child: FutureBuilder<Laptop>(
                                              future: laptopController
                                                  .fetchLaptopByProductId(
                                                      order.product),
                                              builder: (context, snapshot) {
                                                if (snapshot.hasError) {
                                                  return Center(
                                                    child: Text(
                                                        "${snapshot.error}"),
                                                  );
                                                } else if (snapshot.hasData) {
                                                  return Row(
                                                    children: [
                                                      Expanded(
                                                          child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(15.0),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "BEST CHOISE",
                                                              style: textStyle6,
                                                            ),
                                                            const SizedBox(
                                                              height: 5,
                                                            ),
                                                            Text(
                                                              snapshot
                                                                  .data!.name,
                                                              style: textStyle4,
                                                            ),
                                                            const SizedBox(
                                                              height: 5,
                                                            ),
                                                            Text(
                                                              "Số lượng: ${order.quantity}",
                                                              style: textStyle4,
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text(
                                                              "${order.total} VNĐ",
                                                              style: textStyle4,
                                                            ),
                                                            Text(''),
                                                            Positioned(
                                                              bottom: 0,
                                                              right: 0,
                                                              child: Bounce(
                                                                onPressed: () {
                                                                  Navigator
                                                                      .push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                const BuyItem()),
                                                                  );
                                                                },
                                                                duration:
                                                                    const Duration(
                                                                        milliseconds:
                                                                            500),
                                                                child:
                                                                    Container(
                                                                  width: 34.0,
                                                                  height: 34.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color:
                                                                        customBlue,
                                                                    borderRadius: const BorderRadius
                                                                            .only(
                                                                        topLeft:
                                                                            Radius.circular(
                                                                                20.0),
                                                                        bottomRight:
                                                                            Radius.circular(16.0)),
                                                                  ),
                                                                  child:
                                                                      const Icon(
                                                                    Icons.add,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      )),
                                                      Expanded(
                                                          child: SizedBox(
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        child: Image.network(
                                                          snapshot.data!.image,
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              double.infinity,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      )),
                                                    ],
                                                  );
                                                } else {
                                                  return LinearProgressIndicator();
                                                }
                                              },
                                            ),
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            )
                          ]))),
                          Expanded(
                              child: SingleChildScrollView(
                                  child: Column(children: [
                            Column(
                              //Đang giao
                              children: orderController.delivery.value
                                  .map((order) => Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5.0),
                                        child: InkWell(
                                          onTap: () {},
                                          child: Container(
                                            width: double.infinity,
                                            height: 180,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                color: Colors.white),
                                            child: FutureBuilder<Laptop>(
                                              future: laptopController
                                                  .fetchLaptopByProductId(
                                                      order.product),
                                              builder: (context, snapshot) {
                                                if (snapshot.hasError) {
                                                  return Center(
                                                    child: Text(
                                                        "${snapshot.error}"),
                                                  );
                                                } else if (snapshot.hasData) {
                                                  return Row(
                                                    children: [
                                                      Expanded(
                                                          child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(15.0),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "BEST CHOISE",
                                                              style: textStyle6,
                                                            ),
                                                            const SizedBox(
                                                              height: 5,
                                                            ),
                                                            Text(
                                                              snapshot
                                                                  .data!.name,
                                                              style: textStyle4,
                                                            ),
                                                            const SizedBox(
                                                              height: 5,
                                                            ),
                                                            Text(
                                                              "Số lượng: ${order.quantity}",
                                                              style: textStyle4,
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text(
                                                              "${order.total} VNĐ",
                                                              style: textStyle4,
                                                            ),
                                                            Text(''),
                                                            Positioned(
                                                              bottom: 0,
                                                              right: 0,
                                                              child: Bounce(
                                                                onPressed: () {
                                                                  Navigator
                                                                      .push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                const BuyItem()),
                                                                  );
                                                                },
                                                                duration:
                                                                    const Duration(
                                                                        milliseconds:
                                                                            500),
                                                                child:
                                                                    Container(
                                                                  width: 34.0,
                                                                  height: 34.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color:
                                                                        customBlue,
                                                                    borderRadius: const BorderRadius
                                                                            .only(
                                                                        topLeft:
                                                                            Radius.circular(
                                                                                20.0),
                                                                        bottomRight:
                                                                            Radius.circular(16.0)),
                                                                  ),
                                                                  child:
                                                                      const Icon(
                                                                    Icons.add,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      )),
                                                      Expanded(
                                                          child: SizedBox(
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        child: Image.network(
                                                          snapshot.data!.image,
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              double.infinity,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      )),
                                                    ],
                                                  );
                                                } else {
                                                  return LinearProgressIndicator();
                                                }
                                              },
                                            ),
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            )
                          ]))),
                          Expanded(
                              child: SingleChildScrollView(
                                  child: Column(children: [
                            Column(
                              //Đã nhận
                              children: orderController.received.value
                                  .map((order) => Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5.0),
                                        child: InkWell(
                                          onTap: () {},
                                          child: Container(
                                            width: double.infinity,
                                            height: 180,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                color: Colors.white),
                                            child: FutureBuilder<Laptop>(
                                              future: laptopController
                                                  .fetchLaptopByProductId(
                                                      order.product),
                                              builder: (context, snapshot) {
                                                if (snapshot.hasError) {
                                                  return Center(
                                                    child: Text(
                                                        "${snapshot.error}"),
                                                  );
                                                } else if (snapshot.hasData) {
                                                  return Row(
                                                    children: [
                                                      Expanded(
                                                          child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(15.0),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "BEST CHOISE",
                                                              style: textStyle6,
                                                            ),
                                                            const SizedBox(
                                                              height: 5,
                                                            ),
                                                            Text(
                                                              snapshot
                                                                  .data!.name,
                                                              style: textStyle4,
                                                            ),
                                                            const SizedBox(
                                                              height: 5,
                                                            ),
                                                            Text(
                                                              "Số lượng: ${order.quantity}",
                                                              style: textStyle4,
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text(
                                                              "${order.total} VNĐ",
                                                              style: textStyle4,
                                                            ),
                                                            Text(''),
                                                            Positioned(
                                                              bottom: 0,
                                                              right: 0,
                                                              child: Bounce(
                                                                onPressed: () {
                                                                  Navigator
                                                                      .push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                const BuyItem()),
                                                                  );
                                                                },
                                                                duration:
                                                                    const Duration(
                                                                        milliseconds:
                                                                            500),
                                                                child:
                                                                    Container(
                                                                  width: 34.0,
                                                                  height: 34.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color:
                                                                        customBlue,
                                                                    borderRadius: const BorderRadius
                                                                            .only(
                                                                        topLeft:
                                                                            Radius.circular(
                                                                                20.0),
                                                                        bottomRight:
                                                                            Radius.circular(16.0)),
                                                                  ),
                                                                  child:
                                                                      const Icon(
                                                                    Icons.add,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      )),
                                                      Expanded(
                                                          child: SizedBox(
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        child: Image.network(
                                                          snapshot.data!.image,
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              double.infinity,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      )),
                                                    ],
                                                  );
                                                } else {
                                                  return LinearProgressIndicator();
                                                }
                                              },
                                            ),
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            )
                          ]))),
                          Expanded(
                              child: SingleChildScrollView(
                                  child: Column(children: [
                            Column(
                              //Đã hủy
                              children: orderController.cancelled.value
                                  .map((order) => Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5.0),
                                        child: InkWell(
                                          onTap: () {},
                                          child: Container(
                                            width: double.infinity,
                                            height: 180,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                color: Colors.white),
                                            child: FutureBuilder<Laptop>(
                                              future: laptopController
                                                  .fetchLaptopByProductId(
                                                      order.product),
                                              builder: (context, snapshot) {
                                                if (snapshot.hasError) {
                                                  return Center(
                                                    child: Text(
                                                        "${snapshot.error}"),
                                                  );
                                                } else if (snapshot.hasData) {
                                                  return Row(
                                                    children: [
                                                      Expanded(
                                                          child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(15.0),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "BEST CHOISE",
                                                              style: textStyle6,
                                                            ),
                                                            const SizedBox(
                                                              height: 5,
                                                            ),
                                                            Text(
                                                              snapshot
                                                                  .data!.name,
                                                              style: textStyle4,
                                                            ),
                                                            const SizedBox(
                                                              height: 5,
                                                            ),
                                                            Text(
                                                              "Số lượng: ${order.quantity}",
                                                              style: textStyle4,
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text(
                                                              "${order.total} VNĐ",
                                                              style: textStyle4,
                                                            ),
                                                            Text(''),
                                                            Positioned(
                                                              bottom: 0,
                                                              right: 0,
                                                              child: Bounce(
                                                                onPressed: () {
                                                                  Navigator
                                                                      .push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                const BuyItem()),
                                                                  );
                                                                },
                                                                duration:
                                                                    const Duration(
                                                                        milliseconds:
                                                                            500),
                                                                child:
                                                                    Container(
                                                                  width: 34.0,
                                                                  height: 34.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color:
                                                                        customBlue,
                                                                    borderRadius: const BorderRadius
                                                                            .only(
                                                                        topLeft:
                                                                            Radius.circular(
                                                                                20.0),
                                                                        bottomRight:
                                                                            Radius.circular(16.0)),
                                                                  ),
                                                                  child:
                                                                      const Icon(
                                                                    Icons.add,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      )),
                                                      Expanded(
                                                          child: SizedBox(
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        child: Image.network(
                                                          snapshot.data!.image,
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              double.infinity,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      )),
                                                    ],
                                                  );
                                                } else {
                                                  return LinearProgressIndicator();
                                                }
                                              },
                                            ),
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            )
                          ])))
                        ],
                      ),
                    ),
                  )))
              )]));
  }
}
