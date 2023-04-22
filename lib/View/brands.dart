// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';

import '../Styles/color.dart';
import '../Styles/font_styles.dart';

class Brands extends StatefulWidget {
  const Brands({Key? key}) : super(key: key);

  @override
  State<Brands> createState() => _BrandsState();
}

class _BrandsState extends State<Brands> {
  int currentIndex = 0;
  double _startValue =5;
  double _endValue =25;
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Stack(
          children: [
            Visibility(
              visible: currentIndex == 0,
              child: AnimatedContainer(
                height: 44.0,
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                    color: customBlue,
                    borderRadius: BorderRadius.circular(100.0)),
                duration: const Duration(milliseconds: 1000),
                child: Padding(
                  padding: const EdgeInsets.only(left: 45, right: 10),
                  child: Text(
                    "DELL",
                    style: textStyle3,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Bounce(
                onPressed: () {
                  currentIndex = 0;
                  setState(() {});
                },
                duration: const Duration(milliseconds: 200),
                child:
                CircleAvatar(
                  radius: 17,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    "assets/logos/dell.png",
                    width: currentIndex == 0 ? 24.0 : 24.0,
                    height: currentIndex == 0 ? 24.0 : 34.0,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 5.0,
        ),
        Stack(
          children: [
            Visibility(
              visible: currentIndex == 1,
              child: Container(
                height: 44.0,
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                    color: customBlue,
                    borderRadius: BorderRadius.circular(100.0)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 45, right: 10),
                  child: Text(
                    "Asus",
                    style: textStyle3,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Bounce(
                onPressed: () {
                  currentIndex = 1;
                  setState(() {});
                },
                duration: const Duration(milliseconds: 200),
                child:
                CircleAvatar(
                  radius: 17,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    "assets/logos/asus.png",
                    width: currentIndex == 1 ? 24.0 : 24.0,
                    height: currentIndex == 1 ? 24.0 : 34.0,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 5.0,
        ),
        Stack(
          children: [
            Visibility(
              visible: currentIndex == 2,
              child: Container(
                height: 44.0,
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                    color: customBlue,
                    borderRadius: BorderRadius.circular(100.0)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 45, right: 10),
                  child: Text(
                    "Acer",
                    style: textStyle3,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Bounce(
                onPressed: () {
                  currentIndex = 2;
                  setState(() {});
                },
                duration: const Duration(milliseconds: 200),
                child:
                CircleAvatar(
                  radius: 17,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    "assets/logos/acer.png",
                    width: currentIndex == 2 ? 24.0 : 24.0,
                    height: currentIndex == 2 ? 24.0 : 34.0,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 5.0,
        ),
        Stack(
          children: [
            Visibility(
              visible: currentIndex == 3,
              child: Container(
                height: 44.0,
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                    color: customBlue,
                    borderRadius: BorderRadius.circular(100.0)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 45, right: 10),
                  child: Text(
                    "HP",
                    style: textStyle3,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Bounce(
                onPressed: () {
                  currentIndex = 3;
                  setState(() {});
                },
                duration: const Duration(milliseconds: 200),
                child:
                CircleAvatar(
                  radius: 17,
                  backgroundColor: Colors.black,
                  child: Image.asset(
                    "assets/logos/HP.png",
                    width: currentIndex == 3 ? 24.0 : 24.0,
                    height: currentIndex == 3 ? 24.0 : 24.0,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 5.0,
        ),
        Stack(
          children: [
            Visibility(
              visible: currentIndex == 4,
              child: Container(
                height: 44.0,
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                    color: customBlue,
                    borderRadius: BorderRadius.circular(100.0)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 45, right: 10),
                  child: Text(
                    "Macbook",
                    style: textStyle3,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Bounce(
                onPressed: () {
                  currentIndex = 4;
                  setState(() {});
                },
                duration: const Duration(milliseconds: 200),
                child:
                CircleAvatar(
                  radius: 17,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    "assets/logos/mac.png",
                    width: currentIndex == 4 ? 24.0 : 24.0,
                    height: currentIndex == 4 ? 24.0 : 34.0,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          // <-- SEE HERE
            width: 200,
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
          width: 500,
          child: RangeSlider(
            min: 0.0,
            max: 50.0,
            divisions: 5,
            labels: RangeLabels(
              _startValue.round().toString() + 'Triệu',
              _endValue.round().toString() + 'Triệu',
            ),
            values: RangeValues(_startValue , _endValue ),
            onChanged: (values) {
              setState(() {
                _startValue = values.start ;
                _endValue = values.end ;
                _controller.text = ' $_startValue Triệu - $_endValue Triệu';
              });
            },
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),

      ],
    );
  }
}
