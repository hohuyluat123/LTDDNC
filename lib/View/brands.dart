// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Styles/color.dart';
import '../Styles/font_styles.dart';
import '../controller/SearchController.dart';

class Brands extends StatefulWidget {
  const Brands({Key? key}) : super(key: key);

  @override
  State<Brands> createState() => BrandsState();
}

class BrandsState extends State<Brands> {
  final searchController = Get.find<SearchController>(tag: "searchController");
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Stack(
          children: [
            Visibility(
              visible: searchController.brandIndex.value == 0,
              child: AnimatedContainer(
                height: 44.0,
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                    color: customBlue,
                    borderRadius: BorderRadius.circular(100.0)),
                duration: const Duration(milliseconds: 1000),
                child: Padding(
                  padding: const EdgeInsets.only(left: 45, right: 10),
                  child: Text(
                    "All",
                    style: textStyle3,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Bounce(
                onPressed: () {
                  searchController.brandIndex.value = 0;
                  setState(() {
                    searchController.brandName.value = "";
                  });
                },
                duration: const Duration(milliseconds: 200),
                child:
                CircleAvatar(
                  radius: 17,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    "logos/all.png",
                    width: searchController.brandIndex.value == 0 ? 24.0 : 24.0,
                    height: searchController.brandIndex.value == 0 ? 24.0 : 34.0,
                  ),
                ),
              ),
            ),
          ],
        ),
        Stack(
          children: [
            Visibility(
              visible: searchController.brandIndex.value == 1,
              child: AnimatedContainer(
                height: 44.0,
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                    color: customBlue,
                    borderRadius: BorderRadius.circular(100.0)),
                duration: const Duration(milliseconds: 1000),
                child: Padding(
                  padding: const EdgeInsets.only(left: 45, right: 10),
                  child: Text(
                    "DELL",
                    style: textStyle3,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Bounce(
                onPressed: () {
                  searchController.brandIndex.value = 1;
                  setState(() {
                      searchController.brandName.value = "Dell";
                  });
                },
                duration: const Duration(milliseconds: 200),
                child:
                CircleAvatar(
                  radius: 17,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    "assets/logos/dell.png",
                    width: searchController.brandIndex.value == 0 ? 24.0 : 24.0,
                    height: searchController.brandIndex.value == 0 ? 24.0 : 34.0,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 5.0,
        ),
        Stack(
          children: [
            Visibility(
              visible: searchController.brandIndex.value == 2,
              child: Container(
                height: 44.0,
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                    color: customBlue,
                    borderRadius: BorderRadius.circular(100.0)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 45, right: 10),
                  child: Text(
                    "Asus",
                    style: textStyle3,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Bounce(
                onPressed: () {
                  searchController.brandIndex.value = 2;
                  setState(() {
                    searchController.brandName.value = "Asus";
                  });
                },
                duration: const Duration(milliseconds: 200),
                child:
                CircleAvatar(
                  radius: 17,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    "assets/logos/asus.png",
                    width: searchController.brandIndex.value == 1 ? 24.0 : 24.0,
                    height: searchController.brandIndex.value == 1 ? 24.0 : 34.0,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 5.0,
        ),
        Stack(
          children: [
            Visibility(
              visible: searchController.brandIndex.value == 3,
              child: Container(
                height: 44.0,
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                    color: customBlue,
                    borderRadius: BorderRadius.circular(100.0)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 45, right: 10),
                  child: Text(
                    "Acer",
                    style: textStyle3,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Bounce(
                onPressed: () {
                  searchController.brandIndex.value = 3;
                  setState(() {
                    searchController.brandName.value = "Acer";
                  });
                },
                duration: const Duration(milliseconds: 200),
                child:
                CircleAvatar(
                  radius: 17,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    "assets/logos/acer.png",
                    width: searchController.brandIndex.value == 2 ? 24.0 : 24.0,
                    height: searchController.brandIndex.value == 2 ? 24.0 : 34.0,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 5.0,
        ),
        Stack(
          children: [
            Visibility(
              visible: searchController.brandIndex.value == 4,
              child: Container(
                height: 44.0,
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                    color: customBlue,
                    borderRadius: BorderRadius.circular(100.0)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 45, right: 10),
                  child: Text(
                    "HP",
                    style: textStyle3,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Bounce(
                onPressed: () {
                  searchController.brandIndex.value = 4;
                  setState(() {
                    searchController.brandName.value = "HP";
                  });
                },
                duration: const Duration(milliseconds: 200),
                child:
                CircleAvatar(
                  radius: 17,
                  backgroundColor: Colors.black,
                  child: Image.asset(
                    "assets/logos/HP.png",
                    width: searchController.brandIndex.value == 3 ? 24.0 : 24.0,
                    height: searchController.brandIndex.value == 3 ? 24.0 : 24.0,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 5.0,
        ),
        Stack(
          children: [
            Visibility(
              visible: searchController.brandIndex.value == 5,
              child: Container(
                height: 44.0,
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                    color: customBlue,
                    borderRadius: BorderRadius.circular(100.0)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 45, right: 10),
                  child: Text(
                    "Macbook",
                    style: textStyle3,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Bounce(
                onPressed: () {
                  searchController.brandIndex.value = 5;
                  setState(() {
                    searchController.brandName.value = "Macbook";
                  });
                },
                duration: const Duration(milliseconds: 200),
                child:
                CircleAvatar(
                  radius: 17,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    "assets/logos/mac.png",
                    width: searchController.brandIndex.value == 4 ? 24.0 : 24.0,
                    height: searchController.brandIndex.value == 4 ? 24.0 : 34.0,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20.0,
        )
      ],
    );
  }
}
