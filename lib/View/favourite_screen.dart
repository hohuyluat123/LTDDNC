import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:ltddnc_nhom04_k19/View/home_page.dart';
import 'package:ltddnc_nhom04_k19/View/profile.dart';
import '../Styles/color.dart';
import '../Styles/font_styles.dart';
import 'card_screen.dart';
import 'home_page.dart';
import 'notifications_screen.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  int navigationIndex = 0;

  setBottomBarIndex(index) {
    setState(() {
      navigationIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF8F9FA),
        body: Column(children: [
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => HomePage()));
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
                  'Favourite',
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
                  padding: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                  child: SingleChildScrollView(
                      child: Column(
                          children: [
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
                                      child:
                                      Image.asset("assets/icons/search_ic.png"),
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
                            Container(
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.favorite, color: Colors.deepOrange,),
                                  Text(
                                    "SẢN PHẨM YÊU THÍCH",
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
                            const SizedBox(
                              height: 20.0,
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
                                        height: 150,
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
                                                      Text(''),
                                                      LikeButton(
                                                        size: 16,
                                                        circleColor:
                                                        CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
                                                        bubblesColor: BubblesColor(
                                                          dotPrimaryColor: Color(0xff33b5e5),
                                                          dotSecondaryColor: Color(0xff0099cc),
                                                        ),
                                                        likeBuilder: (bool isLiked) {
                                                          return Icon(
                                                            Icons.favorite,
                                                            color: isLiked ? Colors.deepOrange : Colors.grey,
                                                            size: 16,
                                                          );
                                                        },
                                                        likeCount: 0,
                                                        countBuilder: ( count, bool isLiked, String text) {
                                                          var color = isLiked ? Colors.deepOrange : Colors.grey;
                                                          Widget result;
                                                          if (count == 0) {
                                                            result = Text(
                                                              "love",
                                                              style: textStyle4,
                                                            );
                                                          } else
                                                            result = Text(
                                                              text,
                                                              style: textStyle5,
                                                            );
                                                          return result;
                                                        },
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
                            )]))))
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
      ),);
  }
}
