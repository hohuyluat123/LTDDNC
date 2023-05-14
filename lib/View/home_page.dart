// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ltddnc_nhom04_k19/View/price.dart';
import 'package:ltddnc_nhom04_k19/View/product_view.dart';
import 'package:ltddnc_nhom04_k19/View/profile.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ltddnc_nhom04_k19/controller/LaptopController.dart';

import 'package:ltddnc_nhom04_k19/View/search_sreen.dart';

import '../Styles/color.dart';
import '../Styles/font_styles.dart';
import '../controller/SearchController.dart';
import '../controller/UserController.dart';
import '../model/Laptop.dart';
import 'brands.dart';
import 'card_screen.dart';
import 'favourite_screen.dart';
import 'item_view.dart';
import 'notifications_screen.dart';
import 'package:like_button/like_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int navigationIndex = 0;
  final laptopController = Get.find<LaptopController>(tag: "laptopController");
  final userController = Get.find<UserController>(tag: "userController");
  final searchController = Get.put(SearchController(), tag: "searchController");
  String keyword = "";
  bool visibility = false;
  setBottomBarIndex(index) {
    setState(() {
      navigationIndex = index;
    });
  }

  // Icons _icon = Icons as Icons;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: bgWhite,
        child: Padding(

          padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Hệ thống bán lẻ Laptop",
                          style: textStyle1,
                          selectionColor: Colors.cyan,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Bounce(
                      onPressed: () {},
                      duration: const Duration(milliseconds: 500),
                      child: Stack(
                        children: [
                          Image.asset(
                            "assets/icons/cart_ic.png",
                            width: 44.0,
                            height: 44.0,
                          ),
                          Positioned(
                            right: 0,
                            top: 5,
                            child: Container(
                              width: 10.0,
                              height: 10.0,
                              decoration: BoxDecoration(
                                  color: Colors.deepOrange,
                                  borderRadius: BorderRadius.circular(100.0)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                  width: double.infinity,
                  height: 100.0,
                  child: Column(
                      children:[ TextFormField(
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
                              backgroundColor: Colors.white, // background
                              foregroundColor: Colors.grey, // foreground
                            ),
                            child: Icon(Icons.search),
                            onPressed: () async {
                              await laptopController.fetchLaptopByFilter(
                                  keyword, "", "", "");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SearchScreen()),
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
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("Lọc Sản phẩm", style: TextStyle(color: Colors.lightBlueAccent, fontSize: 16), textAlign: TextAlign.justify,),
                      Switch(
                      value: visibility,

                      onChanged: (value) {
                        visibility = !visibility;
                        setState(() {

                        });
                      },
                    )])], )),
              Visibility(
                maintainSize: visibility,
                maintainAnimation: visibility,
                maintainState: visibility,
                visible: visibility,
                child: Column(
                  children: [
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
                      buttonPadding:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CarouselSlider(
                        items: [
                          Container(
                            margin: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                image: NetworkImage(
                                    ("https://phuochungcomputer.com/wp-content/uploads/2021/06/banner-dell-m4800-phuochung.png")
                                        .replaceAll('"', '')),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                image: NetworkImage(
                                    ("https://phuochungcomputer.com/wp-content/uploads/2023/02/mtqn.png")
                                        .replaceAll('"', '')),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                image: NetworkImage(
                                    ("https://hacom.vn/media/news/2409_0924-BannerConsumer_HNC_800x450.jpg")
                                        .replaceAll('"', '')),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                        options: CarouselOptions(
                          height: 160.0,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          aspectRatio: 10 / 4,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          viewportFraction: 1,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "TOP SELLER",
                              style: textStyle4,
                            ),
                            TextButton(
                                onPressed: () {
                                  searchController.brandName.value = "";
                                  searchController.minPrice.value = "";
                                  searchController.maxPrice.value = "";
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SearchScreen()),
                                  );
                                },
                                child: Text(
                                  "Xem tất cả",
                                  style: textStyle5,
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 200.0,
                        child: FutureBuilder<List<Laptop>>(
                          future:
                              laptopController.fetchLaptopByOrder("dateAdded"),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Center(
                                child: Text("${snapshot.error}"),
                              );
                            } else if (snapshot.hasData) {
                              return ListView.builder(
                                  itemCount: 5,
                                  scrollDirection: Axis.horizontal,
                                  padding: EdgeInsets.zero,
                                  itemBuilder: (context, index) {
                                    final item = snapshot.data![index];
                                    return ItemView(
                                      currentIndex: index,
                                      laptop: item,
                                    );
                                  });
                            } else {
                              return const Center(
                                  child: SizedBox(
                                height: 7,
                                child: LinearProgressIndicator(),
                              ));
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Text(
                              "SẢN PHẨM MỚI",
                              style: textStyle4,
                            ),
                            TextButton(
                                onPressed: () {
                                  searchController.brandName.value = "";
                                  searchController.minPrice.value = "";
                                  searchController.maxPrice.value = "";
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SearchScreen()),
                                  );
                                },
                                child: Text(
                                  "Xem tất cả",
                                  style: textStyle5,
                                ))
                          ],
                        ),
                      ),
                      FutureBuilder<List<Laptop>>(
                        future:
                            laptopController.fetchLaptopByOrder("dateAdded"),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Center(
                              child: Text("${snapshot.error}"),
                            );
                          } else if (snapshot.hasData) {
                            return Column(
                                children: snapshot.data
                                        ?.map<Widget>((laptop) => Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 5.0),
                                            child: InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ProductView(
                                                                  productId: laptop
                                                                      .productId)));
                                                },
                                                child: Container(
                                                    width: double.infinity,
                                                    height: 165,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                        color: Colors.white),
                                                    child: Row(children: [
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
                                                                style:
                                                                    textStyle6,
                                                              ),
                                                              const SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(
                                                                laptop.name,
                                                                style:
                                                                    textStyle4,
                                                              ),
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                              Text(
                                                                "${laptop.price} VNĐ",
                                                                style:
                                                                    textStyle4,
                                                              ),
                                                              Text(''),
                                                              Positioned(
                                                                bottom: 0,
                                                                right: 0,
                                                                child: Bounce(
                                                                    onPressed: () {},
                                                                    duration: const Duration(milliseconds: 500),
                                                                    child: Row(children: [
                                                                      Container(
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

                                                                            },
                                                                          )
                                                                      ), SizedBox(width: 70,),
                                                                      Obx(() =>
                                                                          LikeButton(
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
                                                                                (bool
                                                                            isLiked) {
                                                                              return Icon(
                                                                                Icons
                                                                                    .favorite,
                                                                                color: isLiked
                                                                                    ? Colors.deepOrange
                                                                                    : Colors.grey,
                                                                                size:
                                                                                16,
                                                                              );
                                                                            },
                                                                            isLiked: userController
                                                                                .currentFavorite
                                                                                .value
                                                                                .contains(
                                                                                laptop.productId),
                                                                            onTap: (bool
                                                                            isLiked) async {
                                                                              if (isLiked) {
                                                                                await userController
                                                                                    .deleteFromFavorite(laptop.productId);
                                                                                await userController
                                                                                    .fetchFavoriteList();
                                                                              } else {
                                                                                await userController
                                                                                    .addToFavorite(laptop.productId);
                                                                                await userController
                                                                                    .fetchFavoriteList();
                                                                              }
                                                                            },
                                                                          )),],)

                                                                    ),
                                                              )
                                                            ]),
                                                      )),
                                                      Expanded(
                                                          child: SizedBox(
                                                              width: double
                                                                  .infinity,
                                                              height: double
                                                                  .infinity,
                                                              child: Image
                                                                  .network(laptop
                                                                      .image))),
                                                    ])))))
                                        .toList() ??
                                    []);
                          } else {
                            return const Center(
                                child: SizedBox(
                              height: 7,
                              child: LinearProgressIndicator(),
                            ));
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 70.0),
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
        height: 100,
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
      ),
    );
  }
}
