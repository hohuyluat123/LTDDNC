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
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        SizedBox(
          // <-- SEE HERE
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
          width: MediaQuery.of(context).size.width,
          child: RangeSlider(
            min: 0.0,
            max: 50.0,
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
        const SizedBox(
          width: double.infinity,
        ),
        ElevatedButton(
          child: Row (
          children: [
            Icon(Icons.filter_alt_sharp),
            Text("Lọc sản phẩm"),
          ],
        ) ,
          onPressed: () {
          //TODO: Call search Screen with filter value
          },)
      ],
    );
  }
}
