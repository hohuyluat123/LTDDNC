import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../main.dart';
import '../model/Laptop.dart';
import 'UserController.dart';

class LaptopController extends GetxController {
  final userController = Get.find<UserController>(tag: "userController");
  var sellerList = <Laptop>[].obs;
  var productList = <Laptop>[].obs;

  Future<void> fetchLaptopOfSeller() async {
    try {
      final dio = Dio();
      dio.options.headers["Authorization"] = "Bearer ${userController.currentUser.value.accessToken}";
      final response = await dio.post("http://$HOST_URL:8000/product/laptop/seller/");
      sellerList.value = Laptop.parseLaptops(response.data);
    } on Exception catch (e) {
      print(e);
    }
  }
  Future<List<Laptop>> fetchLaptopByOrder(String sortType) async {
    try {
      final dio = Dio();
      final response = await dio.post(
          "http://$HOST_URL:8000/product/laptop/sort/",
          data: '{ "$sortType": -1 }');
      return Laptop.parseLaptops(response.data);
    } on Exception catch (e) {
      print(e);
      return [];
    }
  }
  Future<Laptop> fetchLaptopByProductId(int productId) async {
      final dio = Dio();
      final response = await dio.get(
          "http://$HOST_URL:8000/product/laptop/$productId");
      return Laptop.fromJson(response.data);
  }
  Future<Laptop> addNewLaptop(Laptop laptop) async {
    final dio = Dio();
    dio.options.headers["Authorization"] = "Bearer ${userController.currentUser.value.accessToken}";
    final response = await dio.post(
        "http://$HOST_URL:8000/product/laptop/",
    data: laptop.toJson());
    await fetchLaptopOfSeller();
    return Laptop.fromJson(response.data);
  }
  Future<Laptop> updateLaptop(Laptop laptop) async {
    final dio = Dio();
    dio.options.headers["Authorization"] = "Bearer ${userController.currentUser.value.accessToken}";
    final response = await dio.put(
        "http://$HOST_URL:8000/product/laptop/",
        data: '{ "productId": "", "quantity": "" }');
    await fetchLaptopOfSeller();
    return Laptop.fromJson(response.data);
  }
  Future<Laptop> deleteLaptop(int productId) async {
    final dio = Dio();
    dio.options.headers["Authorization"] = "Bearer ${userController.currentUser.value.accessToken}";
    final response = await dio.delete(
        "http://$HOST_URL:8000/product/laptop/$productId");
    await fetchLaptopOfSeller();
    return Laptop.fromJson(response.data);
  }
}