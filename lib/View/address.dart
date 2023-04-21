import 'package:flutter/material.dart';
import 'package:ltddnc_nhom04_k19/View/EditAddress.dart';

import '../Styles/font_styles.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  int _counter = 0;
  bool isChecked = false;
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
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
                                "12/A , Phạm Ngũ Lão, phường 6, quận 5, TP.HCM",
                                style: textStyle4,
                              ),
                            ],
                          ),
                        )),
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
                                "Đường số 4 , khu phoos6, phường Linh Trung, TP.Thủ Đức, TP.HCM",
                                style: textStyle4,
                              ),
                            ],
                          ),
                        )),
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
          )
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const EditAddressScreen()),
            );
          } ,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ));
  }
}
