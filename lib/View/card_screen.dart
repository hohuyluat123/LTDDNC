import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:ltddnc_nhom04_k19/View/product_view.dart';
import '../Styles/color.dart';
import '../Styles/font_styles.dart';
import 'package:flutter_bounce/flutter_bounce.dart';

import 'buy-item.dart';
class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF8F9FA),
        body: Column(children: [
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
                  padding: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
                  child: DefaultTabController(
                    length: 5,
                    child: Scaffold(
                      appBar: AppBar(
                        bottom: TabBar(
                          tabs: [
                            Tab(icon: Icon(Icons.card_travel), text: 'Giỏ hàng', ),
                            Tab(icon: Icon(Icons.access_alarm), text: 'Chờ phê duyệt',),
                            Tab(icon: Icon(Icons.local_shipping_outlined), text:'Đang giao'),
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
                                  child: Column(
                                      children: [
                                        Column(
                                          children: [
                                            for (int i = 0; i < 5; i++)
                                              Padding(
                                                padding: const EdgeInsets.only(bottom: 5.0),
                                                child: InkWell(
                                                  onTap: () {},
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 180,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(16.0),
                                                        color: Colors.white),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                            child: Padding(
                                                              padding: const EdgeInsets.all(15.0),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    "BEST CHOISE",
                                                                    style: textStyle6,
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Text(
                                                                    "Asus core i5",
                                                                    style: textStyle4,
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Text(
                                                                    "Số lượng: 1",
                                                                    style: textStyle4,
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Text(
                                                                    "15.990.000 VNĐ",
                                                                    style: textStyle4,
                                                                  ),
                                                                  Text(''),
                                                                  Positioned(
                                                                    bottom: 0,
                                                                    right: 0,
                                                                    child: Bounce(
                                                                      onPressed: () {
                                                                        Navigator.push(
                                                                          context,
                                                                          MaterialPageRoute(builder: (context) => const BuyItem()),
                                                                        );
                                                                      },
                                                                      duration: const Duration(milliseconds: 500),
                                                                      child: Container(
                                                                        width: 34.0,
                                                                        height: 34.0,
                                                                        decoration: BoxDecoration(
                                                                          color: customBlue,
                                                                          borderRadius: const BorderRadius.only(
                                                                              topLeft: Radius.circular(20.0),
                                                                              bottomRight: Radius.circular(16.0)),
                                                                        ),
                                                                        child: const Icon(
                                                                          Icons.add,
                                                                          color: Colors.white,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            )),
                                                        Expanded(
                                                            child: Image.asset(
                                                              "assets/shows/laptopDetail.png",
                                                              width: double.infinity,
                                                              height: double.infinity,
                                                              fit: BoxFit.cover,
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )
                                          ],
                                        )]))),
                          Expanded(
                              child: SingleChildScrollView(
                                  child: Column(
                                      children: [
                                        Column(
                                          children: [
                                            for (int i = 0; i < 5; i++)
                                              Padding(
                                                padding: const EdgeInsets.only(bottom: 5.0),
                                                child: InkWell(
                                                  onTap: () {},
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 180,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(16.0),
                                                        color: Colors.white),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                            child: Padding(
                                                              padding: const EdgeInsets.all(15.0),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    "BEST CHOISE",
                                                                    style: textStyle6,
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Text(
                                                                    "Asus core i5",
                                                                    style: textStyle4,
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Text(
                                                                    "Số lượng: 1",
                                                                    style: textStyle4,
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Text(
                                                                    "15.990.000 VNĐ",
                                                                    style: textStyle4,
                                                                  ),
                                                                  Text(''),
                                                                  Positioned(
                                                                    bottom: 0,
                                                                    right: 0,
                                                                    child: Text('Sản phẩm đang chờ xác nhận', style:textStyle9),
                                                                  )
                                                                ],
                                                              ),
                                                            )),
                                                        Expanded(
                                                            child: Image.asset(
                                                              "assets/shows/laptopDetail.png",
                                                              width: double.infinity,
                                                              height: double.infinity,
                                                              fit: BoxFit.cover,
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )
                                          ],
                                        )]))),
                          Expanded(
                              child: SingleChildScrollView(
                                  child: Column(
                                      children: [
                                        Column(
                                          children: [
                                            for (int i = 0; i < 5; i++)
                                              Padding(
                                                padding: const EdgeInsets.only(bottom: 5.0),
                                                child: InkWell(
                                                  onTap: () {},
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 180,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(16.0),
                                                        color: Colors.white),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                            child: Padding(
                                                              padding: const EdgeInsets.all(15.0),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    "BEST CHOISE",
                                                                    style: textStyle6,
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Text(
                                                                    "Asus core i5",
                                                                    style: textStyle4,
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Text(
                                                                    "Số lượng: 1",
                                                                    style: textStyle4,
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Text(
                                                                    "15.990.000 VNĐ",
                                                                    style: textStyle4,
                                                                  ),
                                                                  Text(''),
                                                                  Positioned(
                                                                    bottom: 0,
                                                                    right: 0,
                                                                    child: Text('Sản phẩm đang được giao', style: textStyle6),
                                                                  )
                                                                ],
                                                              ),
                                                            )),
                                                        Expanded(
                                                            child: Image.asset(
                                                              "assets/shows/laptopDetail.png",
                                                              width: double.infinity,
                                                              height: double.infinity,
                                                              fit: BoxFit.cover,
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )
                                          ],
                                        )]))),
                          Expanded(
                              child: SingleChildScrollView(
                                  child: Column(
                                      children: [
                                        Column(
                                          children: [
                                            for (int i = 0; i < 5; i++)
                                              Padding(
                                                padding: const EdgeInsets.only(bottom: 5.0),
                                                child: InkWell(
                                                  onTap: () {},
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 250,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(16.0),
                                                        color: Colors.white),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                            child: Padding(
                                                              padding: const EdgeInsets.all(15.0),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    "BEST CHOISE",
                                                                    style: textStyle6,
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Text(
                                                                    "Asus core i5",
                                                                    style: textStyle4,
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Text(
                                                                    "Số lượng: 1",
                                                                    style: textStyle4,
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Text(
                                                                    "15.990.000 VNĐ",
                                                                    style: textStyle4,
                                                                  ),
                                                                  Text(''),
                                                                  Positioned(
                                                                      bottom: 0,
                                                                      right: 0,
                                                                      child:  ButtonBar(
                                                                          alignment: MainAxisAlignment.center,

                                                                          buttonPadding:EdgeInsets.symmetric(
                                                                              horizontal: 30,
                                                                              vertical: 10
                                                                          ),
                                                                          children: [
                                                                            ElevatedButton(  child: Row (

                                                                              children: [
                                                                                Text("Đánh giá", style: textStyle11,),

                                                                              ],
                                                                            ) ,
                                                                              onPressed: () {

                                                                              },)])
                                                                  )
                                                                ],
                                                              ),
                                                            )),
                                                        Expanded(
                                                            child: Image.asset(
                                                              "assets/shows/laptopDetail.png",
                                                              width: double.infinity,
                                                              height: double.infinity,
                                                              fit: BoxFit.cover,
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )
                                          ],
                                        )]))),
                          Expanded(
                              child: SingleChildScrollView(
                                  child: Column(
                                      children: [
                                        Column(
                                          children: [
                                            for (int i = 0; i < 5; i++)
                                              Padding(
                                                padding: const EdgeInsets.only(bottom: 5.0),
                                                child: InkWell(
                                                  onTap: () {},
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 250,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(16.0),
                                                        color: Colors.white),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                            child: Padding(
                                                              padding: const EdgeInsets.all(15.0),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    "BEST CHOISE",
                                                                    style: textStyle6,
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Text(
                                                                    "Asus core i5",
                                                                    style: textStyle4,
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Text(
                                                                    "Số lượng: 1",
                                                                    style: textStyle4,
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Text(
                                                                    "15.990.000 VNĐ",
                                                                    style: textStyle4,
                                                                  ),
                                                                  Text(''),
                                                                  Positioned(
                                                                      bottom: 0,
                                                                      right: 0,
                                                                      child:  ButtonBar(
                                                                          alignment: MainAxisAlignment.center,
                                                                          buttonPadding:EdgeInsets.symmetric(
                                                                              horizontal: 30,
                                                                              vertical: 10
                                                                          ),
                                                                          children: [
                                                                            ElevatedButton(  child: Row (
                                                                              children: [
                                                                                Text("Mua lại", style: textStyle12,),

                                                                              ],
                                                                            ) ,
                                                                              onPressed: () {

                                                                              },)])
                                                                  )
                                                                ],
                                                              ),
                                                            )),
                                                        Expanded(
                                                            child: Image.asset(
                                                              "assets/shows/laptopDetail.png",
                                                              width: double.infinity,
                                                              height: double.infinity,
                                                              fit: BoxFit.cover,
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )
                                          ],
                                        )])))
                        ],
                      ),
                    ),
                  )))
        ]));
  }
}