import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../main.dart';
import '../model/User.dart';

class UserController extends GetxController {
  var currentUser = User(
          accountId: -1,
          name: "name",
          accessToken: "accessToken",
          refreshToken: "refreshToken",
          isSeller: false).obs;
  var currentCart = <String>[].obs;

  Future<void> fetchCartProductId() async {
    final dio = Dio();
    dio.options.headers["Authorization"] = "Bearer ${currentUser.value.accessToken}";
    final response = await dio.get(
        "http://$HOST_URL:8000/account/${currentUser.value.accountId}");
    currentCart.value = List.castFrom<dynamic, String>(response.data['cart']);
  }
}
