import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ltddnc_nhom04_k19/main.dart';

import 'controller/UserController.dart';
import 'model/User.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  String username;
  int id;
  final userController = Get.find<UserController>(tag: "userController");

  Header({Key? key, required this.id, required this.username})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);
  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueAccent,
      title: Text('Welcome $username'),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.logout),
          tooltip: 'Logout',
          onPressed: () {
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
      ],
    );
  }
}
