import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ltddnc_nhom04_k19/View/price.dart';
import 'package:ltddnc_nhom04_k19/View/profile.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import '../Styles/color.dart';
import '../Styles/font_styles.dart';
import '../controller/LaptopController.dart';
import '../controller/SearchController.dart';
import '../controller/UserController.dart';
import 'brands.dart';
import 'card_screen.dart';
import 'favourite_screen.dart';
import 'home_page.dart';
import 'notifications_screen.dart';
import 'package:like_button/like_button.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int navigationIndex = 0;
  double _startValue = 5;
  double _endValue = 10;
  final laptopController = Get.find<LaptopController>(tag: "laptopController");
  final userController = Get.find<UserController>(tag: "userController");
  final searchController = Get.put(SearchController(), tag: "searchController");
  bool visibility = false;
  String keyword = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FA),
      body: Column(children: [
        const SizedBox(
          height: 10,
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
            child: Padding(
                padding:
                    const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
                child: SingleChildScrollView(
                    child: Column(children: [
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
                            )
                          ],
                        ),
                      ),
                  // RangeSlider(
                  //   min: 0.0,
                  //   max: 100.0,
                  //   divisions: 10,
                  //   labels: RangeLabels(
                  //     _startValue.round().toString() + 'Triệu',
                  //     _endValue.round().toString() + 'Triệu',
                  //   ),
                  //   values: RangeValues(_startValue , _endValue ),
                  //   onChanged: (values) {
                  //     setState(() {
                  //       _startValue = values.start ;
                  //       _endValue = values.end ;
                  //     });
                  //   },
                  // ),
                  Container(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                  Column(
                    children: [
                      for (int i = 0; i < 5; i++)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              width: double.infinity,
                              height: 135,
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
                                          height: 10,
                                        ),
                                        Text(
                                          "15.990.000 VNĐ",
                                          style: textStyle4,
                                        ),
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
                                                  isLiked: true,
                                                  onTap: (bool isLiked) async {
                                                    if (isLiked){
                                                      await userController.deleteFromFavorite(1);
                                                      await userController.fetchFavoriteList();
                                                    }
                                                    else{
                                                      await userController.addToFavorite(1);
                                                      await userController.fetchFavoriteList();
                                                    }
                                                  },
                                                ),],)

                                          ),
                                        ),
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
                  )
                ]))))
      ]),
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
