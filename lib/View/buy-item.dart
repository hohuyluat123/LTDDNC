// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';

import 'package:flutter_bounce/flutter_bounce.dart';

import '../Styles/color.dart';
import '../Styles/font_styles.dart';


class BuyItem extends StatefulWidget {
  const BuyItem({Key? key}) : super(key: key);

  @override
  State<BuyItem> createState() => _BuyItemState();
}

class _BuyItemState extends State<BuyItem> {
  int selectShows = 0;
  int countryIndext = 0;
  int sizeIndex = 0;

  @override
  Widget build(BuildContext context) {
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
                    Bounce(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        duration: const Duration(milliseconds: 500),
                        child: Image.asset(
                          "assets/icons/back_ic.png",
                          width: 44.0,
                          height: 44.0,
                        )),
                    const Spacer(),
                    Text(
                      "ĐẶT HÀNG",
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
                    Image.asset(
                      "assets/shows/laptopDetail.png",
                      width: double.infinity,
                      height: 200,
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
                          "Laptop Dell Vostro Core i7",
                          style: textStyle4,
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          " 20.000.000 VNĐ",
                          style: textStyle4,
                        ),


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
                    "20.000.000 VNĐ",
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
                  child: const Text(
                    "Mua",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontFamily: "airbnb"),
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
