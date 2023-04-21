import 'dart:convert';
import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ltddnc_nhom04_k19/controller/UserController.dart';
import '../Styles/color.dart';
import '../Styles/font_styles.dart';
import 'package:flutter_bounce/flutter_bounce.dart';

import '../View/buy-item.dart';
import '../controller/LaptopController.dart';
import '../controller/OrderController.dart';
import '../model/Laptop.dart';

class StatisticScreen extends StatefulWidget {
  const StatisticScreen({Key? key}) : super(key: key);

  @override
  State<StatisticScreen> createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen> {

  String dropdownValue = 'Dell';
  final List<FlSpot> dummyData1 = List.generate(8, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

  // This will be used to draw the orange line
  final List<FlSpot> dummyData2 = List.generate(8, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

  // This will be used to draw the blue line
  final List<FlSpot> dummyData3 = List.generate(8, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

  @override
  Widget build(BuildContext context) {
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
                  'Thống kê',
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
              width: 300, child: TextField(
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,

            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Từ năm",
              labelText: 'từ năm',
              floatingLabelAlignment: FloatingLabelAlignment.start,
              floatingLabelStyle: TextStyle(
                color: Colors.amber,
                fontSize: 16,
              ),

            ),
          )),
          const Text(''),
          SizedBox( // <-- SEE HERE
              width: 300, child: TextField(
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,

            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Đến năm",
              labelText: 'Đến năm',
              floatingLabelAlignment: FloatingLabelAlignment.start,
              floatingLabelStyle: TextStyle(
                color: Colors.amber,
                fontSize: 16,
              ),

            ),
          )),
          const Text(''),
          DropdownButton<String>(
            // Step 3.
            value: dropdownValue,
            // Step 4.
            items: <String>['Dell', 'Asus', 'Acer', 'HP','Mac']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(fontSize: 30),
                ),
              );
            }).toList(),
            // Step 5.
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
          ),
          const Text(''),
        ButtonBar(
          alignment: MainAxisAlignment.center,
          buttonPadding:EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 10
          ),
          children: [
            ElevatedButton(  child: Row (
              children: [
                Icon(Icons.logo_dev_sharp),
                Text("Thống kê"),

              ],
            ) ,
              onPressed: () {
              },)],
        ),
          const Text(''),
        PieChart(PieChartData(
            centerSpaceRadius: 5,
            borderData: FlBorderData(show: false),
            sectionsSpace: 2,
            sections: [
              PieChartSectionData(value: 35, color: Colors.purple, radius: 100),
              PieChartSectionData(value: 40, color: Colors.amber, radius: 100),
              PieChartSectionData(value: 55, color: Colors.green, radius: 100),
              PieChartSectionData(value: 70, color: Colors.orange, radius: 100),
            ]))
          // Expanded(
          //     child: Padding(
          //         padding:
          //         const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
          //         child: DefaultTabController(
          //           length: 2,
          //           child: Scaffold(
          //             appBar: AppBar(
          //               bottom: TabBar(
          //                 tabs: [
          //                   Tab(
          //                     icon: Icon(Icons.card_travel),
          //                     text: 'Hãng',
          //                   ),
          //                   Tab(
          //                     icon: Icon(Icons.access_alarm),
          //                     text: 'Khoảng giá',
          //                   )
          //                 ],
          //               ),
          //               title: Text('Thống kê'),
          //             ),
          //             body: TabBarView(
          //               children: [
          //                 Expanded(
          //                     child: SingleChildScrollView(
          //                         child: Column(children: [
          //                           Padding(
          //                               padding: const EdgeInsets.all(30),
          //                               child: PieChart(PieChartData(
          //                                   centerSpaceRadius: 5,
          //                                   borderData: FlBorderData(show: false),
          //                                   sectionsSpace: 2,
          //                                   sections: [
          //                                     PieChartSectionData(value: 35, color: Colors.purple, radius: 100),
          //                                     PieChartSectionData(value: 40, color: Colors.amber, radius: 100),
          //                                     PieChartSectionData(value: 55, color: Colors.green, radius: 100),
          //                                     PieChartSectionData(value: 70, color: Colors.orange, radius: 100),
          //                                   ])
          //                               )
          //                           )
          //                         ]))),
          //                 Expanded(
          //                     child: SingleChildScrollView(
          //                         child: Column(children: [
          //                           SafeArea(
          //                             child: Container(
          //                               padding: const EdgeInsets.all(20),
          //                               width: double.infinity,
          //                               child: LineChart(
          //                                 LineChartData(
          //                                   borderData: FlBorderData(show: false),
          //                                   lineBarsData: [
          //                                     // The red line
          //                                     LineChartBarData(
          //                                       spots: dummyData1,
          //                                       isCurved: true,
          //                                       barWidth: 3,
          //                                       color: Colors.indigo,
          //                                     ),
          //                                     // The orange line
          //                                     LineChartBarData(
          //                                       spots: dummyData2,
          //                                       isCurved: true,
          //                                       barWidth: 3,
          //                                       color: Colors.red,
          //                                     ),
          //                                     // The blue line
          //                                     LineChartBarData(
          //                                       spots: dummyData3,
          //                                       isCurved: false,
          //                                       barWidth: 3,
          //                                       color: Colors.blue,
          //                                     )
          //                                   ],
          //                                 ),
          //                               ),
          //                             ),
          //                           )
          //                         ]))),
          //               ],
          //             ),
          //           ),
          //         )))
        ]));
  }
}
