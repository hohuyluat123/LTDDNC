import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const SellerMain());
}

class Laptop {
  final int phoneId;
  final String brand;
  final String capacity;
  final String color;
  final bool isDelete;
  final String name;
  final int price;
  final int seller;
  final int status;
  final String image;

  Laptop({
    required this.phoneId,
    required this.brand,
    required this.capacity,
    required this.color,
    required this.isDelete,
    required this.name,
    required this.price,
    required this.seller,
    required this.status,
    required this.image,
  });

  factory Laptop.fromJson(Map<String, dynamic> json) {
    return Laptop(
      phoneId: json['phoneId'] as int,
      brand: json['brand'] as String,
      capacity: json['capacity'] as String,
      color: json['color'] as String,
      isDelete: json['isDelete'] as bool,
      name: json['name'] as String,
      price: json['price'] as int,
      seller: json['seller'] as int,
      status: json['status'] as int,
      image: json['image'] as String,
    );
  }
}

class SellerMain extends StatelessWidget {
  const SellerMain({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Laptop> parseLaptops(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Laptop>((json) => Laptop.fromJson(json)).toList();
  }

  Future<List<Laptop>> fetchLaptop(http.Client client) async {
    try {
      final response = await client
          .get(Uri.parse("https://localhost:8000/product/electronics/phone"));
      return compute(parseLaptops, response.body);
    }
    catch (e) {
      print(e);
      return <Laptop>[];
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Laptop>>(
        future: fetchLaptop(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            return ListView(
              children: <Widget>[
                Container(
                  child: const Text(
                    'List of Photo',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
                Container(
                  child: DataTable(
                      showCheckboxColumn: false,
                      columns: const <DataColumn>[
                        DataColumn(
                          label: Expanded(
                            child: Text(
                              'Album ID',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: Text(
                              'ID',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: Text(
                              'Tittle',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: Text(
                              'Thumbnai Url',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                        ),
                      ],
                      rows: snapshot.data
                          ?.map(
                            (laptop) => DataRow(
                          cells: <DataCell>[
                            DataCell(Text(laptop.phoneId.toString())),
                            DataCell(Text(laptop.brand)),
                            DataCell(Text(laptop.color)),
                            DataCell(Image.network(laptop.image)),
                          ],
                        ),
                      ).toList() ?? []),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
