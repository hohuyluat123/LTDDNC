import 'dart:convert';
import 'dart:js_util';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ltddnc_nhom04_k19/appBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';

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
      debugShowCheckedModeBanner: false,
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
  User currentLogin = User(
      accountId: -1,
      name: "name",
      accessToken: "accessToken",
      refreshToken: "refreshToken");

  @override
  void initState() {
    super.initState();
    getCurrentLogin();
  }

  Future<void> getCurrentLogin() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      currentLogin =
          User.fromJson(jsonDecode(prefs.getString("currentUser").toString()));
      print(currentLogin.accessToken);
    });
  }

  List<Laptop> parseLaptops(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Laptop>((json) => Laptop.fromJson(json)).toList();
  }

  Future<List<Laptop>> fetchLaptop(http.Client client) async {
    try {
      final response = await client
          .get(Uri.parse("https://localhost:8000/product/electronics/phone"));
      return compute(parseLaptops, response.body);
    } catch (e) {
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
            return Scaffold(
              appBar: Header(id: currentLogin.accountId, username: currentLogin.name),
              body: ListView(
                children: <Widget>[
                  Container(
                    child: const Text(
                      'List of Product',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 70, 0),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.green, // background
                          foregroundColor: Colors.white, // foreground
                        ),
                        child: Icon(Icons.add),
                        onPressed: () {
                          //TODO: Call Add Product API
                        },
                      ),
                    ),
                  ),
                  Container(
                    child: DataTable(
                        dataRowHeight: 75,
                        showCheckboxColumn: false,
                        columns: const <DataColumn>[
                          DataColumn(
                            label: Center(
                              child: Expanded(
                                child: Text(
                                  'Product ID',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Center(
                              child: Expanded(
                                child: Text(
                                  'Name',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Center(
                              child: Expanded(
                                child: Text(
                                  'Brand',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Center(
                              child: Expanded(
                                child: Text(
                                  'Image',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Center(
                              child: Expanded(
                                child: Text(
                                  'Price',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Center(
                              child: Expanded(
                                child: Text(
                                  'Action',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                            ),
                          ),
                        ],
                        rows: snapshot.data
                                ?.map(
                                  (laptop) => DataRow(
                                    cells: <DataCell>[
                                      DataCell(Expanded(
                                          child:
                                              Text(laptop.phoneId.toString()))),
                                      DataCell(
                                          Expanded(child: Text(laptop.name))),
                                      DataCell(
                                          Expanded(child: Text(laptop.brand))),
                                      DataCell(Image.network(
                                        laptop.image,
                                        width: 50,
                                      )),
                                      DataCell(Expanded(
                                          child:
                                              Text(laptop.price.toString()))),
                                      DataCell(
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        5, 5, 0, 0),
                                                child: TextButton(
                                                  style: TextButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.lightBlueAccent,
                                                    // background
                                                    foregroundColor: Colors
                                                        .white, // foreground
                                                  ),
                                                  child: Icon(Icons.edit),
                                                  onPressed: () {
                                                    //TODO: Call Edit Product API
                                                  },
                                                ),
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        5, 5, 0, 0),
                                                child: TextButton(
                                                  style: TextButton.styleFrom(
                                                    backgroundColor: Colors.red,
                                                    // background
                                                    foregroundColor: Colors
                                                        .white, // foreground
                                                  ),
                                                  child: Icon(Icons.delete),
                                                  onPressed: () {
                                                    //TODO: Call Delete Product API
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                                .toList() ??
                            []),
                  ),
                ],
              ),
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
