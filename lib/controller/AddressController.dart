import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../main.dart';
import '../user/nameAddress.dart';
import 'UserController.dart';

class AddressController extends GetxController {
  var provinceList = <AddressName>[].obs;
  var districtList = <AddressName>[].obs;
  var wardList = <AddressName>[].obs;
  var addressList = <String>[].obs;
  final userController = Get.find<UserController>(tag: "userController");


  Future<void> fetchProvicesAddress() async {
    final dio = Dio();
    final response = await dio.get("https://provinces.open-api.vn/api/p/");
    provinceList.value = AddressName.parseAddress(response.data);
  }
  Future<void> fetchDistrictsAddress(int proviceCode) async {
    final dio = Dio();
    final response = await dio.get("https://provinces.open-api.vn/api/p/$proviceCode?depth=2");
    districtList.value = AddressName.parseAddress(response.data['districts']);
  }
  Future<void> fetchWardAddress(int districtCode) async {
    final dio = Dio();
    final response = await dio.get("https://provinces.open-api.vn/api/d/$districtCode?depth=2");
    wardList.value = AddressName.parseAddress(response.data['wards']);
  }
  Future<void> fetchAddressList() async {
    final dio = Dio();
    dio.options.headers["Authorization"] = "Bearer ${userController.currentUser.value.accessToken}";
    final response = await dio.get(
        "http://$HOST_URL:8000/account/${userController.currentUser.value.accountId}");
    addressList.value = List.castFrom<dynamic, String>(response.data['address']);
  }
  Future<int?> addNewAddress(String address) async {
    final dio = Dio();
    dio.options.headers["Authorization"] = "Bearer ${userController.currentUser.value.accessToken}";
    final response = await dio.post(
        "http://$HOST_URL:8000/account/addAddress",
        data: '{ "address": "$address" }',
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ));
    return response.statusCode;
  }
  Future<int?> changeDefaultAddress(int addressId) async {
    final dio = Dio();
    dio.options.headers["Authorization"] = "Bearer ${userController.currentUser.value.accessToken}";
    final response = await dio.put(
        "http://$HOST_URL:8000/account/changeDefaultAddress/$addressId",
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ));
    return response.statusCode;
  }
}
