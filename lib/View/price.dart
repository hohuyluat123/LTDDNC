// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Styles/color.dart';
import '../Styles/font_styles.dart';
import '../controller/SearchController.dart';

class Price extends StatefulWidget {
  const Price({Key? key}) : super(key: key);

  @override
  State<Price> createState() => PriceState();
}

class PriceState extends State<Price> {
  int currentIndex = 0;
  double startValue = 5;
  double endValue = 25;
  final searchController = Get.find<SearchController>(tag: "searchController");

  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  ListView(
      scrollDirection: Axis.horizontal,
      children: [
        SizedBox(
          // <-- SEE HERE
            width: 150,
            height: 20,
            child: TextFormField(
                readOnly: true,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),

                controller: _controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Khoảng giá",
                  labelText: 'Khoảng giá',
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  floatingLabelStyle: TextStyle(
                    color: Colors.amber,
                    fontSize: 8,
                  ),
                )
            )),
        Container(
          width: 200,
          child: RangeSlider(
            min: 0.0,
            max: 30.0,
            divisions: 5,
            labels: RangeLabels(
              startValue.round().toString() + ' Triệu',
              endValue.round().toString() + ' Triệu',
            ),
            values: RangeValues(startValue , endValue ),
            onChanged: (values) {
              setState(() {
                startValue = values.start ;
                endValue = values.end ;
                _controller.text = ' $startValue - $endValue Triệu';
              });
              searchController.minPrice.value = "${values.start}000000";
              searchController.maxPrice.value = "${values.end}000000";
            },
          ),
        ),
      ],
    );
  }
}
