import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ltddnc_nhom04_k19/user/districts.dart';

import '../Styles/font_styles.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../user/nameAddress.dart';

class EditAddressScreen extends StatefulWidget {
  const EditAddressScreen({Key? key}) : super(key: key);

  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}
List<AddressName> parseAddress(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  List<AddressName> x = parsed.map<AddressName>((json) => AddressName.fromJson(json)).toList();
  print(x.elementAt(0).codename);
  return parsed.map<AddressName>((json) => AddressName.fromJson(json)).toList();
}

// Districts parseDistrict(String responseBody) {
//   final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
//   Districts x = parsed.map<Districts>((json) => Districts.fromJson(json));
//   print(x.codename);
//   return x;
// }


Future<List<AddressName>> fetchAddress(http.Client client) async {
  final response = await client
      .get(Uri.parse('https://provinces.open-api.vn/api/p/'));
  Future<List<AddressName>> x =  compute(parseAddress, response.body);

  return x;
}



class _EditAddressScreenState extends State<EditAddressScreen> {

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    // List<AddressName> listAddress =  dio.get("https://provinces.open-api.vn/api/p/");
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
    // final response =  dio.post("https://provinces.open-api.vn/api/p/");
    // print(response);
    // List<AddressName> listAddress =[];
    // Future<List<AddressName>> getAddress() async {
    //   try {
    //     final dio = Dio();
    //     final response = await dio.post("https://provinces.open-api.vn/api/p/");
    //     List<AddressName> listAddress = AddressName.parseAddress(response.data);
    //     return listAddress;
    //   } on Exception catch (e) {
    //     print(e);
    //     return [];
    //   }
    //
    // }



    String dropdownvalue = "An Giang";

    // List of items in our dropdown menu
    var items = [
      'An Giang',
      'Bắc Giang',
      'Bến Tre',
      'Cà Mau',
      'Bạc Liêu',
    ];

    String dropdownvalueQ = "Quận 1";

    // List of items in our dropdown menu
    var itemsQ = [
      'Quận 1',
      'Quận 2',
      'Quận 3',
      'Quận 4',
      'Quận 5',
    ];
    String dropdownvalueP = 'Phường 1';

    // List of items in our dropdown menu
    var itemsP = [
      'Phường 1',
      'Phường 2',
      'Phường 3',
      'Phường 4',
      'Phường 5',
    ];

    return Scaffold(
        backgroundColor: const Color(0xffF8F9FA),
        body: Column(children: [
          const SizedBox(
            height: 50,
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
                      child:  DropdownButton(

                        // Initial Value
                        value: dropdownvalue,

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                    )
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
                      child:  DropdownButton(

                        // Initial Value
                        value: dropdownvalueQ,

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: itemsQ.map((String itemsQ) {
                          return DropdownMenuItem(
                            value: itemsQ,
                            child: Text(itemsQ),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                    )
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
                        )),
                    Expanded(
                      child:  DropdownButton(

                        // Initial Value
                        value: dropdownvalueP,

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: itemsP.map((String itemsQ) {
                          return DropdownMenuItem(
                            value: itemsQ,
                            child: Text(itemsQ),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                    )
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
                onPressed: () {

                },),

            ])
             ],
          ),
        );
  }
}
