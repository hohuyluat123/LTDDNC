// ignore_for_file: depend_on_referenced_packages

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ltddnc_nhom04_k19/View/profile.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ltddnc_nhom04_k19/controller/LaptopController.dart';

import 'package:ltddnc_nhom04_k19/View/search_sreen.dart';

import '../Styles/color.dart';
import '../Styles/font_styles.dart';
import '../main.dart';
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
                height: 40,
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

                        // Row(
                        //   children: [
                        //     Image.asset(
                        //       "assets/icons/location_ic.png",
                        //       width: 14,
                        //       height: 14.0,
                        //     ),
                        //     const SizedBox(
                        //       width: 5.0,
                        //     ),
                        //     Text("Mondolibug, Sylhet", style: textStyle2),
                        //   ],
                        // )
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
                  height: 50.0,
                  child: TextFormField(
                    cursorColor: customBlue,
                    cursorWidth: 2.5,
                    style: textStyle1,
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
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SearchScreen()),
                            );
                          },
                        )
                        //Image.asset("assets/icons/search_ic.png"),

                      ),
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
                        color: Colors.amberAccent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.black,
                            ),
                            Text(
                              "TOP SELLER",
                              style: textStyle4,
                            ),
                            TextButton(
                                onPressed: () {
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
                              return LinearProgressIndicator();
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
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
                              "Sản phẩm mới",
                              style: textStyle4,
                            ),
                            TextButton(
                                onPressed: () {
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
                                                onTap: () {},
                                                child: Container(
                                                    width: double.infinity,
                                                    height: 160,
                                                    decoration: BoxDecoration(
                                                        borderRadius:BorderRadius.circular(16.0),
                                                        color: Colors.white),
                                                    child: Row(children: [
                                                      Expanded(
                                                          child: Padding(
                                                        padding:const EdgeInsets.all(15.0),
                                                        child: Column(
                                                            crossAxisAlignment:CrossAxisAlignment.start,
                                                            children: [
                                                              Text("BEST CHOISE",
                                                                style:textStyle6,),
                                                              const SizedBox(height: 5,),
                                                              Text(laptop.name,
                                                                style:textStyle4,
                                                              ),
                                                              const SizedBox(height: 10,),
                                                              Text("${laptop.price} VNĐ",
                                                                style:textStyle4,
                                                              ),
                                                              Text(''),
                                                              LikeButton(
                                                                size: 16,
                                                                circleColor: CircleColor(start: Color(0xff00ddff),end: Color(0xff0099cc)),
                                                                bubblesColor:BubblesColor(dotPrimaryColor:Color(0xff33b5e5),dotSecondaryColor:Color(0xff0099cc),
                                                                ),
                                                                likeBuilder: (bool isLiked) {
                                                                  return Icon(
                                                                    Icons.favorite,
                                                                    color: isLiked ? Colors.deepOrange: Colors.grey,
                                                                    size: 16,
                                                                  );
                                                                },
                                                                likeCount: 0,
                                                                countBuilder: (count, bool isLiked, String text) {
                                                                  var color = isLiked ? Colors.deepOrange : Colors.grey;
                                                                  Widget result;
                                                                  if (count == 0) {
                                                                    result = Text("Love",
                                                                      style:textStyle4,);
                                                                  } else
                                                                    result = Text(text,
                                                                      style:textStyle5,
                                                                    );
                                                                  return result;
                                                                },
                                                              ),
                                                            ]),
                                                      )),
                                                      Expanded(
                                                          child: SizedBox(
                                                              width: double.infinity,
                                                              height: double.infinity,
                                                              child: Image.network(laptop.image))),
                                                    ])))))
                                        .toList() ??
                                    []);
                          } else {
                            return LinearProgressIndicator();
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
