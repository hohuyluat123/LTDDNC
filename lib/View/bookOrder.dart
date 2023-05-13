import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ltddnc_nhom04_k19/View/profile.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import '../Styles/color.dart';
import '../Styles/font_styles.dart';
import '../controller/LaptopController.dart';
import '../controller/UserController.dart';
import '../model/Laptop.dart';
import 'buy-item.dart';
import 'card_screen.dart';
import 'favourite_screen.dart';
import 'home_page.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({Key? key}) : super(key: key);

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {

  final userController = Get.find<UserController>(tag: "userController");
  int navigationIndex = 0;
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controllerPay = TextEditingController();
  setBottomBarIndex(index) {
    setState(() {
      navigationIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {

    String dropdownvalue = "Giao hàng nhanh";
    _controller.text = dropdownvalue;
    // List of items in our dropdown menu
    var items = [
      'Giao hàng nhanh',
      'Express',
    ];

    String dropdownvaluePay = "Thanh toán khi nhận hàng";
    _controllerPay.text = dropdownvaluePay;
    // List of items in our dropdown menu
    var itemsPay = [
      'Thanh toán khi nhận hàng',
      'Thanh toán momo',
    ];
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FA),
      body: SingleChildScrollView(
          child: Column(children: [
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: InkWell(
            onTap: () {},
            child: Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Colors.white),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Địa chỉ",
                          style: textStyle6,
                        ),const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Hồ Huy Luật",
                          style: textStyle4,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "0123456789",
                          style: textStyle4,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "12/A , Phạm Ngũ Lão, phường 6, quận 5, TP.HCM",
                          style: textStyle4,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Nhập yêu cầu KH',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
            const SizedBox(
              height: 10,
            ),
        Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: InkWell(
            onTap: () {},
            child: Container(
              width: double.infinity,
              height: 90,
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
                            Expanded(
                              child:   DropdownButtonFormField(
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue, width: 2),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  filled: true,
                                  fillColor: Colors.blueAccent,
                                ),
                                validator: (value) => value == null ? "Chọn phương thức vẫn chuyển" : null,
                                dropdownColor: Colors.blueAccent,
                                // Initial Value
                                value: dropdownvalue,

                                // Down Arrow Icon
                                icon: const Icon(Icons.keyboard_arrow_down),

                                // Array list of items
                                items: items.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                // After selecting the desired option,it will
                                // change button value to selected value
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownvalue = newValue!;
                                    _controller.text= newValue;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      )),
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                                readOnly: true,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),

                                controller: _controller,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Phương thức vận chuyển',
                                  floatingLabelAlignment: FloatingLabelAlignment.start,
                                  floatingLabelStyle: TextStyle(
                                    color: Colors.amber,
                                    fontSize: 8,
                                  ),
                                )
                            )
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  height: 90,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: Colors.white),
                  child: Row(
                    children: [
                            Expanded(
                              child:   DropdownButtonFormField(
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue, width: 2),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  filled: true,
                                  fillColor: Colors.blueAccent,
                                ),
                                validator: (value) => value == null ? "Chọn phương thức thanh toán" : null,
                                dropdownColor: Colors.blueAccent,
                                // Initial Value
                                value: dropdownvaluePay,

                                // Down Arrow Icon
                                icon: const Icon(Icons.keyboard_arrow_down),

                                // Array list of items
                                items: itemsPay.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                // After selecting the desired option,it will
                                // change button value to selected value
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownvaluePay = newValue!;
                                    _controllerPay.text= newValue;
                                  });
                                },
                              ),
                            ),
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                    readOnly: true,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),

                                    controller: _controllerPay,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Phương thức thanh toán',
                                      floatingLabelAlignment: FloatingLabelAlignment.start,
                                      floatingLabelStyle: TextStyle(
                                        color: Colors.amber,
                                        fontSize: 8,
                                      ),
                                    )
                                )
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
        Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: InkWell(
            onTap: () {},
            child: Container(
              width: double.infinity,
              height: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Colors.white),
              child: Row(
                children: [
                  Expanded(
                      child:  SizedBox(
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
                                              future: LaptopController
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
                                  ])))),),

                ],
              ),
            ),
          ),
        ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  height: 110,
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
                                  "Tổng tiền",
                                  style: textStyle1,
                                ),
                                Text(''),
                                Text(
                                  "Phí vận chuyển",
                                  style: textStyle12,
                                ),
                                Text(''),
                                Text(
                                  "Tổng thanh toán",
                                  style: textStyle6,
                                )
                              ],
                            ),
                          )),
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "10.000.000VNĐ",
                                  style: textStyle1,
                                ),Text(''),
                                Text(
                                  "20.000VNĐ",
                                  style: textStyle12,
                                ), Text(''),
                                Text(
                                  "20.000VNĐ",
                                  style: textStyle6
                                )
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),

        // Text(''),
        // Container(
        //   width: double.infinity,
        //   height: 50,
        //   child: Row(
        //     children: [
        //       Expanded(
        //         child:  DropdownButton(
        //
        //           // Initial Value
        //           value: dropdownvaluePay,
        //
        //           // Down Arrow Icon
        //           icon: const Icon(Icons.keyboard_arrow_down),
        //
        //           // Array list of items
        //           items: itemsPay.map((String items) {
        //             return DropdownMenuItem(
        //               value: items,
        //               child: Text(items),
        //             );
        //           }).toList(),
        //           // After selecting the desired option,it will
        //           // change button value to selected value
        //           onChanged: (String? newValue) {
        //             setState(() {
        //               dropdownvaluePay = newValue!;
        //               _controllerPay.text= newValue;
        //             });
        //           },
        //         ),
        //       ),
        //       TextFormField(
        //           readOnly: true,
        //           style: const TextStyle(
        //             color: Colors.black,
        //             fontWeight: FontWeight.bold,
        //           ),
        //
        //           controller: _controllerPay,
        //           decoration: const InputDecoration(
        //             border: OutlineInputBorder(),
        //             labelText: 'Phương thức thanh toán',
        //             floatingLabelAlignment: FloatingLabelAlignment.start,
        //             floatingLabelStyle: TextStyle(
        //               color: Colors.amber,
        //               fontSize: 8,
        //             ),
        //           )
        //       )
        //     ],
        //   ),
        // )
      ])),
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
                    "Thanh toán",
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
      ),);
  }
}
