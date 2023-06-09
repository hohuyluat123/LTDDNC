import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ltddnc_nhom04_k19/View/address.dart';
import 'package:ltddnc_nhom04_k19/View/card_screen.dart';
import 'package:ltddnc_nhom04_k19/View/favourite_screen.dart';
import 'package:ltddnc_nhom04_k19/View/home_page.dart';
import 'package:ltddnc_nhom04_k19/View/notifications_screen.dart';
import 'package:ltddnc_nhom04_k19/main.dart';

import '../Styles/color.dart';

import '../controller/UserController.dart';
import '../main.dart';
import '../model/User.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _counter = 0;
  final userController = Get.find<UserController>(tag: "userController");

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    int navigationIndex = 0;

    setBottomBarIndex(index) {
      setState(() {
        navigationIndex = index;
      });
    }
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
                  Navigator.pop(context);
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
              // const Text(
              //   'Profile',
              //   style: TextStyle(
              //       color: Colors.black,
              //       fontSize: 16,
              //       fontWeight: FontWeight.w500),
              // ),
            ],
          ),
        ),
        Container(
            margin: const EdgeInsets.only(left: 15, bottom: 15),
            height: 120,
            width: 120,
            decoration: const BoxDecoration(),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 15,
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: const Color(0xffDFEFFF),
                        borderRadius: BorderRadius.circular(70)),
                  ),
                ),
                Positioned(
                    top: 5,
                    left: 18,
                    child: SizedBox(
                      height: 57,
                      width: 57,
                      child: Image.asset(
                        'assets/images/profile.png',
                        fit: BoxFit.contain,
                      ),
                    )),
                const Positioned(
                    bottom: 25,
                    left: 5,
                    child: Text(
                      'Xin chào, 👋',
                      style: TextStyle(
                          color: Color(0xff707B81),
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )),
                Positioned(
                    bottom: 0,
                    left: 5,
                    child: Text(
                      userController.currentUser.value.name,
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    )),

              ],
            )),
        ListTile(
            selectedTileColor: Colors.black26,
            minLeadingWidth: 25,
            leading: Icon(Icons.person),
            title:Text('Thông tin cá nhân')
        ),
        ListTile(
          selectedTileColor: Colors.black26,
          minLeadingWidth: 25,
          leading: Icon(Icons.maps_home_work),
          title:Text('Trang chủ'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const HomePage()),
            );
          },
        ),
        ListTile(
          selectedTileColor: Colors.black26,
          minLeadingWidth: 25,
          leading: Icon(Icons.favorite),
          title:Text('Yêu thích'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const FavouriteScreen()),
            );
          },
        ),
        ListTile(
          selectedTileColor: Colors.black26,
          minLeadingWidth: 25,
          leading: Icon(Icons.notification_add),
          title:Text('Thông báo'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const NotificationsScreen()),
            );
          },
        ),
        ListTile(
          selectedTileColor: Colors.black26,
          minLeadingWidth: 25,
          leading: Icon(Icons.card_travel),
          title:Text('Giỏ hàng'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const CartScreen()),
            );
          },
        ),
        ListTile(
          selectedTileColor: Colors.black26,
          minLeadingWidth: 25,
          leading: Icon(Icons.add_road_outlined),
          title:Text('Địa chỉ'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddressScreen()),
            );
          },
        ),
        ListTile(
          selectedTileColor: Colors.black26,
          minLeadingWidth: 25,
          leading: Icon(Icons.lock_open),
          title:Text('Đăng xuất'),
          onTap: () {
            userController.currentUser.value = User(
                accountId: -1,
                name: "name",
                accessToken: "accessToken",
                refreshToken: "refreshToken",
                isSeller: false);
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
        ),

      ],),
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
