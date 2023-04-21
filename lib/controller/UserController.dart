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
  Future<int?> addToCart(int productId, int quantity) async {
    final dio = Dio();
    dio.options.headers["Authorization"] = "Bearer ${currentUser.value.accessToken}";
    final response = await dio.post(
        "http://$HOST_URL:8000/account/cart/add",
      data: '{ "productId": "$productId", "quantity": "$quantity" }',
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),);
    currentCart.value = List.castFrom<dynamic, String>(response.data['cart']);
    return response.statusCode;
  }
  Future<int?> updateCart(int productId, int quantity) async {
    final dio = Dio();
    dio.options.headers["Authorization"] = "Bearer ${currentUser.value.accessToken}";
    final response = await dio.put(
        "http://$HOST_URL:8000/account/cart/update",
      data: '{ "productId": "$productId", "quantity": "$quantity" }',);
    currentCart.value = List.castFrom<dynamic, String>(response.data['cart']);
    return response.statusCode;
  }
  Future<int?> deleteFromCart(int productId) async {
    final dio = Dio();
    dio.options.headers["Authorization"] = "Bearer ${currentUser.value.accessToken}";
    final response = await dio.delete(
        "http://$HOST_URL:8000/account/cart/delete",
      data: '{ "productId": "$productId" }',);
    currentCart.value = List.castFrom<dynamic, String>(response.data['cart']);
    return response.statusCode;
  }
}
