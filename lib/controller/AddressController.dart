import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../user/nameAddress.dart';

class AddressController extends GetxController {
  var provinceList = <AddressName>[].obs;
  var districtList = <AddressName>[].obs;
  var wardList = <AddressName>[].obs;


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
}
