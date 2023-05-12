import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ltddnc_nhom04_k19/View/price.dart';
import 'package:ltddnc_nhom04_k19/View/product_view.dart';

import '../Styles/color.dart';
import '../Styles/font_styles.dart';
import '../controller/LaptopController.dart';
import '../controller/SearchController.dart';
import '../controller/UserController.dart';
import 'brands.dart';
import 'home_page.dart';
import 'package:like_button/like_button.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final laptopController = Get.find<LaptopController>(tag: "laptopController");
  final searchController = Get.find<SearchController>(tag: "searchController");
  final userController = Get.find<UserController>(tag: "userController");
  String keyword = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF8F9FA),
        body: Column(children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
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
                const Text(
                  'Product',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                InkWell(
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
                  child: Column(children: [
                SizedBox(
                    width: double.infinity,
                    height: 50.0,
                    child: TextFormField(
                      cursorColor: customBlue,
                      cursorWidth: 2.5,
                      style: textStyle1,
                      onChanged: (value) {
                        keyword = value;
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: EdgeInsets.zero,
                        hintText: "Tìm kiếm",
                        prefixIcon: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                                // background
                                foregroundColor: Colors.grey, // foreground
                              ),
                              child: Icon(Icons.search),
                              onPressed: () async {
                                await laptopController.fetchLaptopByFilter(
                                    keyword, "", "", "");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SearchScreen()),
                                );
                              },
                            )),
                        hintStyle: textStyle1,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.blue,
                          ),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 20.0,
                ),
                const SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: Brands(),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: Price(),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  buttonPadding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 10),
                  children: [
                    ElevatedButton(
                      child: Row(
                        children: [
                          Icon(Icons.filter_alt),
                          Text("Lọc sản phẩm"),
                        ],
                      ),
                      onPressed: () async {
                        await laptopController.fetchLaptopByFilter(
                            keyword,
                            searchController.brandName.value,
                            searchController.minPrice.value,
                            searchController.maxPrice.value);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SearchScreen()),
                        );
                      },
                    )
                  ],
                ),
                Container(
                  color: Colors.amberAccent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.newspaper,
                        color: Colors.black,
                      ),
                      Text(
                        "Sản phẩm",
                        style: textStyle4,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "",
                            style: textStyle5,
                          ))
                    ],
                  ),
                ),
                Obx(() => Column(
                      children: laptopController.productList.value
                          .map((laptop) => Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProductView(
                                                    productId:
                                                        laptop.productId)));
                                  },
                                  child: Container(
                                      width: double.infinity,
                                      height: 160,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          color: Colors.white),
                                      child: Row(children: [
                                        Expanded(
                                            child: Padding(
                                          padding:
                                              const EdgeInsets.all(15.0),
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
                                                  laptop.name,
                                                  style: textStyle4,
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "${laptop.price} VNĐ",
                                                  style: textStyle4,
                                                ),
                                                Text(''),
                                                Obx(() => LikeButton(
                                                      size: 16,
                                                      circleColor: CircleColor(
                                                          start: Color(
                                                              0xff00ddff),
                                                          end: Color(
                                                              0xff0099cc)),
                                                      bubblesColor:
                                                          BubblesColor(
                                                        dotPrimaryColor:
                                                            Color(
                                                                0xff33b5e5),
                                                        dotSecondaryColor:
                                                            Color(
                                                                0xff0099cc),
                                                      ),
                                                      likeBuilder:
                                                          (bool isLiked) {
                                                        return Icon(
                                                          Icons.favorite,
                                                          color: isLiked
                                                              ? Colors
                                                                  .deepOrange
                                                              : Colors.grey,
                                                          size: 16,
                                                        );
                                                      },
                                                      isLiked: userController
                                                          .currentFavorite
                                                          .value
                                                          .contains(laptop
                                                              .productId),
                                                      onTap: (bool
                                                          isLiked) async {
                                                        if (isLiked) {
                                                          await userController
                                                              .deleteFromFavorite(
                                                                  laptop
                                                                      .productId);
                                                          await userController
                                                              .fetchFavoriteList();
                                                        } else {
                                                          await userController
                                                              .addToFavorite(
                                                                  laptop
                                                                      .productId);
                                                          await userController
                                                              .fetchFavoriteList();
                                                        }
                                                      },
                                                    )),
                                              ]),
                                        )),
                                        Expanded(
                                            child: SizedBox(
                                                width: double.infinity,
                                                height: double.infinity,
                                                child: Image.network(
                                                    laptop.image))),
                                      ])))))
                          .toList(),
                    ))
              ])))
        ]));
  }
}
