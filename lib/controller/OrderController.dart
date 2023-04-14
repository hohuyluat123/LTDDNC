import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../main.dart';
import '../model/Order.dart';
import 'UserController.dart';

class OrderController extends GetxController {
  var waitingConfirm = <Order>[].obs;
  var delivery = <Order>[].obs;
  var received = <Order>[].obs;
  var cancelled = <Order>[].obs;

  Future<void> fetchUserOrders() async {
    final userController = Get.find<UserController>(tag: "userController");
    try {
      final dio = Dio();
      dio.options.headers["Authorization"] = "Bearer ${userController.currentUser.value.accessToken}";
      var response = await dio.post(
          "http://$HOST_URL:8000/order/account/",
          data: '{ "orderStatus":  0}');
       waitingConfirm.value = Order.parseOrders(response.data);
      response = await dio.post(
          "http://$HOST_URL:8000/order/account/",
          data: '{ "orderStatus":  1}');
      delivery.value = Order.parseOrders(response.data);
      response = await dio.post(
          "http://$HOST_URL:8000/order/account/",
          data: '{ "orderStatus":  2}');
      received.value = Order.parseOrders(response.data);
      response = await dio.post(
          "http://$HOST_URL:8000/order/account/",
          data: '{ "orderStatus":  -1}');
      cancelled.value = Order.parseOrders(response.data);
    } on Exception catch (e) {
      print(e);
    }
  }
}
