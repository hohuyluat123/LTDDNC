// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:ltddnc_nhom04_k19/View/profile.dart';

import '../generated/menu_item.dart';
import 'card_screen.dart';
import 'drawer_main_screen.dart';
import 'favourite_screen.dart';
import 'home_page.dart';
import 'notifications_screen.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MenuItemClass currentItem = MenuItems.home;

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      slideWidth: 240,
      mainScreen: getScreen(),
      menuScreen: Builder(builder: (context) {
        return MenuScreen(
          currentItem: currentItem,
          onSelectedItem: (item) {
            setState(() {
              currentItem = item;
              ZoomDrawer.of(context)!.close();
            });
          },
        );
      }),
    );
  }

  Widget getScreen() {
    switch (currentItem) {
      case MenuItems.home:
        return const HomePage();
      case MenuItems.profile:
        return const ProfileScreen();
      case MenuItems.cart:
        return const CartScreen();
      case MenuItems.favourite:
        return const FavouriteScreen();
      case MenuItems.notification:
        return const NotificationsScreen();
    }
    return Container();
  }
}
