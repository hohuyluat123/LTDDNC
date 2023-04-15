import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../main.dart';
import '../model/Laptop.dart';

class LaptopController extends GetxController {


  static Future<List<Laptop>> fetchLaptopByOrder(String sortType) async {
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
  static Future<Laptop> fetchLaptopByProductId(int productId) async {
      final dio = Dio();
      final response = await dio.get(
          "http://$HOST_URL:8000/product/laptop/$productId");
      return Laptop.fromJson(response.data);
  }
}