// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';

import '../Styles/color.dart';
import '../Styles/font_styles.dart';

class Price extends StatefulWidget {
  const Price({Key? key}) : super(key: key);

  @override
  State<Price> createState() => _PriceState();
}

class _PriceState extends State<Price> {
  int currentIndex = 0;
  double _startValue =5;
  double _endValue =25;
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
              _startValue.round().toString() + ' Triệu',
              _endValue.round().toString() + ' Triệu',
            ),
            values: RangeValues(_startValue , _endValue ),
            onChanged: (values) {
              setState(() {
                _startValue = values.start ;
                _endValue = values.end ;
                _controller.text = ' $_startValue - $_endValue Triệu';
              });
            },
          ),
        ),
      ],
    );
  }
}
