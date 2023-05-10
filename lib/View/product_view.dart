// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';

import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ltddnc_nhom04_k19/controller/LaptopController.dart';

import '../Styles/color.dart';
import '../Styles/font_styles.dart';
import '../controller/UserController.dart';
import '../model/Laptop.dart';
import 'home_page.dart';

class ProductView extends StatefulWidget {
  int productId;

  ProductView({
    super.key,
    required this.productId,
  });

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  int selectShows = 0;
  int countryIndext = 0;
  int sizeIndex = 0;
  late Laptop laptop;

  final userController = Get.find<UserController>(tag: "userController");

  void _showAlertDialog(String message) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Thêm sản phẩm'),
          content: Text(message),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Laptop>(
      future: LaptopController.fetchLaptopByProductId(widget.productId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("${snapshot.error}"),
          );
        } else if (snapshot.hasData) {
          return Scaffold(
            backgroundColor: bgWhite,
            body: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50.0,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()),
                              );
                            },
                            child: Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30.0),
                                image: const DecorationImage(
                                  image: AssetImage("assets/icons/back_ic.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "Hệ thống bán lẻ laptop",
                            style: textStyle4,
                          ),
                          const Spacer(),
                          Bounce(
                              onPressed: () {},
                              duration: const Duration(milliseconds: 500),
                              child: Image.asset(
                                "assets/icons/cart_ic.png",
                                width: 44.0,
                                height: 44.0,
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          const SizedBox(
                            width: double.infinity,
                            height: 150.0,
                          ),
                          Positioned(
                            bottom: 20,
                            child: Image.asset(
                              "assets/images/rotate.png",
                              height: 50.0,
                              width: 300,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Image.network(
                            snapshot.data!.image,
                            width: double.infinity,
                            height: 100,
                          ),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24.0),
                                topRight: Radius.circular(24.0))),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "BEST SELLER",
                                style: textStyle5,
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                snapshot.data!.name,
                                style: textStyle4,
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                " ${snapshot.data!.price} VNĐ",
                                style: textStyle4,
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                snapshot.data!.description,
                                style: textStyle7,
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              Text(
                                "Cửa hàng",
                                style: textStyle4,
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Bounce(
                                      onPressed: () {
                                        selectShows = 0;
                                        setState(() {});
                                      },
                                      duration:
                                          const Duration(milliseconds: 500),
                                      child: Container(
                                        width: 56.0,
                                        height: 56.0,
                                        decoration: BoxDecoration(
                                            color: selectShows == 0
                                                ? customBlue
                                                : bgWhite,
                                            borderRadius:
                                                BorderRadius.circular(16.0)),
                                        child: Image.network(snapshot.data!.image),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15.0,
                                    ),
                                    Bounce(
                                      onPressed: () {
                                        selectShows = 1;
                                        setState(() {});
                                      },
                                      duration:
                                          const Duration(milliseconds: 500),
                                      child: Container(
                                        width: 56.0,
                                        height: 56.0,
                                        decoration: BoxDecoration(
                                            color: selectShows == 1
                                                ? customBlue
                                                : bgWhite,
                                            borderRadius:
                                                BorderRadius.circular(16.0)),
                                        child: Image.network(snapshot.data!.image),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15.0,
                                    ),
                                    Bounce(
                                      onPressed: () {
                                        selectShows = 2;
                                        setState(() {});
                                      },
                                      duration:
                                          const Duration(milliseconds: 500),
                                      child: Container(
                                        width: 56.0,
                                        height: 56.0,
                                        decoration: BoxDecoration(
                                            color: selectShows == 2
                                                ? customBlue
                                                : bgWhite,
                                            borderRadius:
                                                BorderRadius.circular(16.0)),
                                        child: Image.network(snapshot.data!.image),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Màu",
                                    style: textStyle4,
                                  ),
                                  // const Spacer(),
                                  // Bounce(
                                  //     onPressed: () {
                                  //       countryIndext = 0;
                                  //       setState(() {});
                                  //     },
                                  //     duration: const Duration(milliseconds: 200),
                                  //     child: Text(
                                  //       "EU",
                                  //       style: countryIndext == 0
                                  //           ? textStyle4
                                  //           : textStyle5,
                                  //     )),
                                  // const SizedBox(
                                  //   width: 5.0,
                                  // ),
                                  // Bounce(
                                  //     onPressed: () {
                                  //       countryIndext = 1;
                                  //       setState(() {});
                                  //     },
                                  //     duration: const Duration(milliseconds: 200),
                                  //     child: Text(
                                  //       "US",
                                  //       style: countryIndext == 1
                                  //           ? textStyle4
                                  //           : textStyle5,
                                  //     )),
                                  // const SizedBox(
                                  //   width: 5.0,
                                  // ),
                                  // Bounce(
                                  //     onPressed: () {
                                  //       countryIndext = 2;
                                  //       setState(() {});
                                  //     },
                                  //     duration: const Duration(milliseconds: 200),
                                  //     child: Text("UK",
                                  //         style: countryIndext == 2
                                  //             ? textStyle4
                                  //             : textStyle5))
                                ],
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Bounce(
                                    onPressed: () {
                                      sizeIndex = 0;
                                      setState(() {});
                                    },
                                    duration: const Duration(milliseconds: 200),
                                    child: CircleAvatar(
                                      radius: 18,
                                      backgroundColor: Colors.lightGreenAccent,
                                      child: Text(
                                        "Xanh",
                                        style: sizeIndex == 0
                                            ? textStyle8
                                            : textStyle1,
                                      ),
                                    ),
                                  ),
                                  Bounce(
                                    onPressed: () {
                                      sizeIndex = 1;
                                      setState(() {});
                                    },
                                    duration: const Duration(milliseconds: 200),
                                    child: CircleAvatar(
                                      radius: 18,
                                      backgroundColor: Colors.grey,
                                      child: Text(
                                        "Xám",
                                        style: sizeIndex == 1
                                            ? textStyle8
                                            : textStyle1,
                                      ),
                                    ),
                                  ),
                                  Bounce(
                                    onPressed: () {
                                      sizeIndex = 2;
                                      setState(() {});
                                    },
                                    duration: const Duration(milliseconds: 200),
                                    child: CircleAvatar(
                                      radius: 18,
                                      backgroundColor: Colors.black,
                                      child: Text(
                                        "Đen",
                                        style: sizeIndex == 2
                                            ? textStyle8
                                            : textStyle1,
                                      ),
                                    ),
                                  ),
                                  // Bounce(
                                  //   onPressed: () {
                                  //     sizeIndex = 3;
                                  //     setState(() {});
                                  //   },
                                  //   duration: const Duration(milliseconds: 200),
                                  //   child: CircleAvatar(
                                  //     radius: 18,
                                  //     backgroundColor:
                                  //         sizeIndex == 3 ? customBlue : bgWhite,
                                  //     child: Text(
                                  //       "41",
                                  //       style:
                                  //           sizeIndex == 3 ? textStyle8 : textStyle1,
                                  //     ),
                                  //   ),
                                  // ),
                                  // Bounce(
                                  //   onPressed: () {
                                  //     sizeIndex = 4;
                                  //     setState(() {});
                                  //   },
                                  //   duration: const Duration(milliseconds: 200),
                                  //   child: CircleAvatar(
                                  //     radius: 18,
                                  //     backgroundColor:
                                  //         sizeIndex == 4 ? customBlue : bgWhite,
                                  //     child: Text(
                                  //       "41",
                                  //       style:
                                  //           sizeIndex == 4 ? textStyle8 : textStyle1,
                                  //     ),
                                  //   ),
                                  // ),
                                  // Bounce(
                                  //   onPressed: () {
                                  //     sizeIndex = 5;
                                  //     setState(() {});
                                  //   },
                                  //   duration: const Duration(milliseconds: 200),
                                  //   child: CircleAvatar(
                                  //     radius: 18,
                                  //     backgroundColor:
                                  //         sizeIndex == 5 ? customBlue : bgWhite,
                                  //     child: Text(
                                  //       "41",
                                  //       style:
                                  //           sizeIndex == 5 ? textStyle8 : textStyle1,
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
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
                          "${snapshot.data!.price} VNĐ",
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
                              "Thêm vào giỏ hàng",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontFamily: "airbnb"),
                            ),
                            onPressed: () async {
                              int? statusCode = await userController.addToCart(laptop.productId, 1);
                              if (statusCode == 200) {
                                _showAlertDialog(
                                    "Thêm sản phẩm thành công");
                              }
                              else if (statusCode == 409) {
                                _showAlertDialog(
                                    "Sản phẩm đã có trong giỏ hàng");
                              }
                              else {
                                _showAlertDialog(
                                    "Thêm sản phẩm thất bại");
                              }
                            },
                          )
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
