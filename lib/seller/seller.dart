import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ltddnc_nhom04_k19/appBar.dart';
import '../controller/UserController.dart';
import '../main.dart';
import '../model/Laptop.dart';

void main() {
  runApp(const SellerMain());
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
  final userController = Get.find<UserController>(tag: "userController");


  Future<List<Laptop>> fetchLaptop() async {
    try {
      final dio = Dio();
      dio.options.headers["Authorization"] = "Bearer ${userController.currentUser.value.accessToken}";
      final response = await dio.post("http://$HOST_URL:8000/product/laptop/seller/");
      return Laptop.parseLaptops(response.data);
    } on Exception catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Laptop>>(
        future: fetchLaptop(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            return Scaffold(
              appBar: Header(id: userController.currentUser.value.accountId, username: userController.currentUser.value.name),
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
                                              Text(laptop.productId.toString()))),
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
