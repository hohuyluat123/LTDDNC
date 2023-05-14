import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ltddnc_nhom04_k19/View/address.dart';
import 'package:ltddnc_nhom04_k19/user/districts.dart';
import 'package:ltddnc_nhom04_k19/user/nameAddress.dart';

import '../Styles/font_styles.dart';
import '../controller/AddressController.dart';


class EditAddressScreen extends StatefulWidget {
  const EditAddressScreen({Key? key}) : super(key: key);

  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}



class _EditAddressScreenState extends State<EditAddressScreen> {
  final addressController = Get.find<AddressController>(tag: "addressController");
  bool isChecked = false;
  int proviceCode = -1;
  int districtCode = -1;
  String houseNumber = "";
  var selectedProvice =  "Chọn tỉnh thành".obs;
  var  selectedDistrict = "Chọn quận huyện".obs;
  var  selectedWard = "Chọn phường xã".obs;

  void _showDialog(String tittle, String message, BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(tittle),
          content: Text(message),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Scaffold(
        backgroundColor: const Color(0xffF8F9FA),
        body: Column(children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
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
                const Text(
                  'Cập nhật Địa chỉ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                InkWell(
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox( // <-- SEE HERE
              width: 450, child: TextField(
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            onChanged: (value) {
              houseNumber = value;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Nhập số nhà",
              labelText: 'Số nhà',
              floatingLabelAlignment: FloatingLabelAlignment.start,
              floatingLabelStyle: TextStyle(
                color: Colors.amber,
                fontSize: 16,
              ),

            ),
          )),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: InkWell(
              onTap: () {},
              child: Container(
                width: double.infinity,
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Tỉnh /Thành phố: ",
                                style: textStyle4,
                              ),

                            ],
                          ),
                        )),
                    Expanded(
                      child: Obx(() => ( DropdownButtonFormField<AddressName>(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white54, width: 2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white54, width: 2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          fillColor: Colors.white54,
                        ),
                        validator: (value) => value == null ? "Chọn phương thức vẫn chuyển" : null,
                        hint: Text(selectedProvice.value),
                        value: null,
                        onChanged: (AddressName? value) {
                          selectedProvice.value = value!.name;
                          setState(() async {
                            proviceCode = value!.code;
                            await addressController.fetchDistrictsAddress(proviceCode);
                          });
                        },
                        icon: const Icon(Icons.keyboard_arrow_down),
                        // Array list of items
                        items: addressController.provinceList.value.map((items) {
                          return DropdownMenuItem<AddressName>(
                            value: items,
                            child: Text(items.name),
                          );
                        }).toList(),
                      )),
                    ))
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: InkWell(
              onTap: () {},
              child: Container(
                width: double.infinity,
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Quận /huyện: ",
                                style: textStyle4,
                              ),

                            ],
                          ),
                        )),
                    Expanded(
                      child:  Obx(() => ( DropdownButtonFormField<AddressName>(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white54, width: 2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white54, width: 2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          fillColor: Colors.white54,
                        ),
                        validator: (value) => value == null ? "Chọn quận/ huyện" : null,
                        hint: Text(selectedDistrict.value),
                        value: null,
                        onChanged: (AddressName? value) {
                          selectedDistrict.value = value!.name;
                          setState(() async {
                            districtCode = value!.code;
                            await addressController.fetchWardAddress(districtCode);
                          });
                        },
                        icon: const Icon(Icons.keyboard_arrow_down),
                        // Array list of items
                        items: addressController.districtList.value.map((items) {
                          return DropdownMenuItem<AddressName>(
                            value: items,
                            child: Text(items.name),
                          );
                        }).toList(),
                      ))
                      )),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: InkWell(
              onTap: () {},
              child: Container(
                width: double.infinity,
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Phường /xã: ",
                                style: textStyle4,
                              ),
                            ],
                          ),
                        )
                    ),
                    Expanded(
                      child: Obx(() => ( DropdownButtonFormField<AddressName>(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white54, width: 2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white54, width: 2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          fillColor: Colors.white54,
                        ),
                        validator: (value) => value == null ? "Chọn xã/ phường" : null,
                        hint: Text(selectedWard.value),
                        value: null,
                        onChanged: (AddressName? value) {
                          selectedWard.value = value!.name;
                        },
                        icon: const Icon(Icons.keyboard_arrow_down),
                        // Array list of items
                        items: addressController.wardList.value.map((items) {
                          return DropdownMenuItem<AddressName>(
                            value: items,
                            child: Text(items.name),
                          );
                        }).toList(),
                      )),
                    ))
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: InkWell(
              onTap: () {},
              child: Container(
                width: double.infinity,
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                      child:  ListTile(
                        selectedTileColor: Colors.black26,
                        minLeadingWidth: 25,
                        leading: Checkbox(
                          checkColor: Colors.white,
                          fillColor: MaterialStateProperty.resolveWith(getColor),
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        title:Text('Mặc định'),

                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            buttonPadding:EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 10
            ),
            children: [
              ElevatedButton(  child: Row (
                children: [
                  Icon(Icons.system_security_update_good_outlined),
                  SizedBox(width: 20, height: 30,),
                  Text("Cập nhật"),

                ],
              ) ,
                onPressed: () async{
                    await addressController.addNewAddress("$houseNumber, $selectedWard, $selectedDistrict, $selectedProvice");
                    await addressController.fetchAddressList();
                    _showDialog("Success", "Đã thêm địa chỉ mới", context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddressScreen()),
                    );
                },),

            ])
             ],
          ),
        );
  }
}
