// ignore_for_file: depend_on_referenced_packages, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ltddnc_nhom04_k19/View/product_view.dart';


import '../Styles/color.dart';
import '../Styles/font_styles.dart';
import '../controller/UserController.dart';
import '../model/Laptop.dart';

class ItemView extends StatefulWidget {
  int currentIndex;
  Laptop laptop;
  ItemView({
    super.key,
    required this.currentIndex,
    required this.laptop,
  });

  @override
  State<ItemView> createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
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
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Bounce(
        onPressed: () {
          Navigator.push(context,
              CupertinoPageRoute(builder: (context) =>  ProductView(productId: widget.laptop.productId,)));
        },
        duration: const Duration(milliseconds: 500),
        child: Container(
          width: 160.0,
          height: 200.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            children: [
              Expanded(
                  flex: 3,
                  child: SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child:  Image.network(widget.laptop.image))),
              Expanded(
                  flex: 2,
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "BEST SELLER",
                                style: textStyle6,
                                textAlign: TextAlign.start,
                              ),
                              const SizedBox(
                                height: 2.0,
                              ),
                              Text(
                                widget.laptop.name,
                                style: textStyle4,
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                "${widget.laptop.price} VNĐ",
                                style: textStyle4,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Bounce(
                            onPressed: () {},
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
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.blueAccent, // background
                                  foregroundColor: Colors.white, // foreground
                                ),
                                child: Icon(Icons.add),
                                onPressed: () async {
                                  int? statusCode = await userController.addToCart(widget.laptop.productId, 1);
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
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
