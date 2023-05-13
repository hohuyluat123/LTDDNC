import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ltddnc_nhom04_k19/View/EditAddress.dart';
import 'package:ltddnc_nhom04_k19/controller/AddressController.dart';

import '../Styles/font_styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AddressScreen(),
    );
  }
}

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final addressController =
      Get.find<AddressController>(tag: "addressController");
  bool isChecked = false;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF8F9FA),
        body: Column(
          children: [
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
                    'Địa chỉ',
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
            Obx(() => Column(
                children: List<Widget>.from(addressController.addressList.value
                    .map((address) => [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                width: double.infinity,
                                height: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0),
                                    color: Colors.white),
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
                                            "Địa chỉ",
                                            style: textStyle6,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            address,
                                            style: textStyle4,
                                          ),
                                        ],
                                      ),
                                    )),
                                    Expanded(
                                      child: ListTile(
                                        selectedTileColor: Colors.black26,
                                        minLeadingWidth: 25,
                                        leading: Checkbox(
                                          checkColor: Colors.white,
                                          fillColor:
                                              MaterialStateProperty.resolveWith(
                                                  getColor),
                                          value: false,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              isChecked = value!;
                                            });
                                          },
                                        ),
                                        title: Text('Mặc định'),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ])
                    .expand((i) => i)))),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await addressController.fetchProvicesAddress();
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const EditAddressScreen()),
            );
          },
          tooltip: 'Thêm địa chỉ',
          child: const Icon(Icons.add),
        ));
  }
}
