import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:like_button/like_button.dart';
import 'package:ltddnc_nhom04_k19/View/product_view.dart';
import 'package:ltddnc_nhom04_k19/View/profile.dart';
import 'package:ltddnc_nhom04_k19/controller/UserController.dart';
import '../Styles/color.dart';
import '../Styles/font_styles.dart';
import 'package:flutter_bounce/flutter_bounce.dart';

import '../controller/LaptopController.dart';
import '../controller/OrderController.dart';
import '../model/Laptop.dart';
import 'buy-item.dart';
import 'favourite_screen.dart';
import 'home_page.dart';
import 'notifications_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final orderController = Get.find<OrderController>(tag: "orderController");
  final userController = Get.find<UserController>(tag: "userController");
  final laptopController = Get.find<LaptopController>(tag: "laptopController");

  int navigationIndex = 0;


  setBottomBarIndex(index) {
    setState(() {
      navigationIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }
    return Scaffold(
        backgroundColor: const Color(0xffF8F9FA),
        body: Column(
            children: [
              Obx(() =>
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
                              child: Scaffold(
                                  backgroundColor: bgWhite,
                                  body: SizedBox(
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
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
                                                                        height: 220,
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
                                                                              int index = userController.currentCart.value.indexOf(cartItem);
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
                                                                                        ),
                                                                                        Expanded(
                                                                                          child:  ListTile(
                                                                                            selectedTileColor: Colors.black26,
                                                                                            minLeadingWidth: 25,
                                                                                            leading: Checkbox(
                                                                                              checkColor: Colors.white,
                                                                                              fillColor: MaterialStateProperty.resolveWith(getColor),
                                                                                              value: userController.isCheckedCartItem.value[index],
                                                                                              onChanged: (bool? value) {
                                                                                                setState(() {
                                                                                                  userController.isCheckedCartItem.value[index] = value!;
                                                                                                });
                                                                                              },
                                                                                            ),
                                                                                            title:Text('Mua'),

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
                                                                              return const Center(
                                                                                  child: SizedBox(
                                                                                    height: 7,
                                                                                    child: LinearProgressIndicator(),
                                                                                  )
                                                                              );
                                                                            }
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ))
                                                              .toList(),
                                                        )
                                                      ])))),
                                  bottomNavigationBar: Container(
                                    width: double.infinity,
                                    height: 70.0,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(24.0),
                                            topLeft: Radius.circular(24.0)),
                                        boxShadow: [
                                          BoxShadow(
                                            spreadRadius: 0.1,
                                            blurRadius: 25,
                                            color: bgWhite,
                                          )
                                        ]),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 10.0,
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Giá",
                                                style: textStyle1,
                                              ),
                                              Text(
                                                "0 VNĐ",
                                                style: textStyle4,
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          Bounce(
                                            onPressed: () {},
                                            duration: const Duration(milliseconds: 200),
                                            child: Container(
                                                width: 165.0,
                                                height: 55.0,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    color: customBlue,
                                                    borderRadius: BorderRadius.circular(50.0),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        spreadRadius: 1,
                                                        blurRadius: 5,
                                                        color: customBlue,
                                                      )
                                                    ]),
                                                child:
                                                TextButton(
                                                  child: const Text(
                                                    "Đặt hàng",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.w600,
                                                        color: Colors.white,
                                                        fontFamily: "airbnb"),
                                                  ),
                                                  onPressed: () async {
                                                    // int? statusCode = await userController.addToCart(laptop.productId, 1);
                                                    // if (statusCode == 200) {
                                                    //   _showAlertDialog(
                                                    //       "Thêm sản phẩm thành công");
                                                    // }
                                                    // else if (statusCode == 409) {
                                                    //   _showAlertDialog(
                                                    //       "Sản phẩm đã có trong giỏ hàng");
                                                    // }
                                                    // else {
                                                    //   _showAlertDialog(
                                                    //       "Thêm sản phẩm thất bại");
                                                    // }
                                                  },
                                                )
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ))),
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
                                                  return const Center(
                                                      child: SizedBox(
                                                        height: 7,
                                                        child: LinearProgressIndicator(),
                                                      )
                                                  );
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
                                                  return const Center(
                                                      child: SizedBox(
                                                        height: 7,
                                                        child: LinearProgressIndicator(),
                                                      )
                                                  );
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
                                            height: 250,
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
                                                  return const Center(
                                                      child: SizedBox(
                                                        height: 7,
                                                        child: LinearProgressIndicator(),
                                                      )
                                                  );
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
                                                  return const Center(
                                                      child: SizedBox(
                                                        height: 7,
                                                        child: LinearProgressIndicator(),
                                                      )
                                                  );
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
              )]),
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: SizedBox(
          width: 56.0,
          height: 56.0,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
            backgroundColor: customBlue,
            elevation: 10,
            child: Image.asset(
              "assets/icons/bag_ic.png",
              width: 20.0,
              height: 20.0,
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 80,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bottomnav_bg.png"),
                fit: BoxFit.fitWidth)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    navigationIndex = 0;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  child: Image.asset("assets/icons/home_ic.png",
                      width: 25,
                      height: 25,
                      color: navigationIndex == 0 ? customBlue : customGrey),
                ),
                InkWell(
                  onTap: () {
                    navigationIndex = 1;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FavouriteScreen()),
                    );
                  },
                  child: Image.asset("assets/icons/favourite_ic.png",
                      width: 25,
                      height: 25,
                      color: navigationIndex == 1 ? customBlue : customGrey),
                ),
                const SizedBox(
                  width: 60.0,
                ),
                InkWell(
                  onTap: () {
                    navigationIndex = 2;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NotificationsScreen()),
                    );
                  },
                  child: Image.asset("assets/icons/notify_ic.png",
                      width: 25,
                      height: 25,
                      color: navigationIndex == 2 ? customBlue : customGrey),
                ),
                InkWell(
                  onTap: () {
                    navigationIndex = 3;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileScreen()),
                    );
                  },
                  child: Image.asset("assets/icons/user_ic.png",
                      width: 25,
                      height: 25,
                      color: navigationIndex == 3 ? customBlue : customGrey),
                ),
              ],
            ),
          ],
        ),
      ),);
  }
}
