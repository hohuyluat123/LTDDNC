import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ltddnc_nhom04_k19/appBar.dart';
import 'package:ltddnc_nhom04_k19/controller/LaptopController.dart';
import 'package:ltddnc_nhom04_k19/seller/Statistic.dart';
import '../Styles/color.dart';
import '../controller/UserController.dart';
import '../main.dart';
import '../model/Laptop.dart';
import 'Order.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

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
  final laptopController = Get.find<LaptopController>(tag: "laptopController");
  int navigationIndex = 0;
  int productId = -1;
  String brand = "";
  String diskType = "";
  String capacity = "";
  String color = "";
  String cpu = "";
  String gpu = "";
  String ram = "";
  String name = "";
  int price = 0;
  String description = "";

  Future<void> _showAddDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Thêm sản phẩm mới'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                SizedBox(
                  // <-- SEE HERE
                    width: 300,
                    child: TextField(
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Tên sản phẩm",
                        labelText: 'tên sản phẩm',
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                        floatingLabelStyle: TextStyle(
                          color: Colors.amber,
                          fontSize: 16,
                        ),
                      ),
                      onChanged: (value) {
                        name = value;
                      },
                    )),
                const Text(''),
                SizedBox(
                  // <-- SEE HERE
                    width: 300,
                    child: TextField(
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Hãng",
                        labelText: 'Hãng',
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                        floatingLabelStyle: TextStyle(
                          color: Colors.amber,
                          fontSize: 16,
                        ),
                      ),
                      onChanged: (value) {
                        brand = value;
                      },
                    )),
                const Text(''),
                SizedBox(
                  // <-- SEE HERE
                    width: 300,
                    child: TextField(
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Màu sắc",
                        labelText: 'màu sắc',
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                        floatingLabelStyle: TextStyle(
                          color: Colors.amber,
                          fontSize: 16,
                        ),
                      ),
                      onChanged: (value) {
                        color = value;
                      },
                    )),
                const Text(''),
                SizedBox(
                  // <-- SEE HERE
                    width: 300,
                    child: TextField(
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Loại ổ cứng",
                        labelText: 'loại ổ cứng',
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                        floatingLabelStyle: TextStyle(
                          color: Colors.amber,
                          fontSize: 16,
                        ),
                      ),
                      onChanged: (value) {
                        diskType = value;
                      },
                    )),
                const Text(''),
                SizedBox(
                  // <-- SEE HERE
                    width: 300,
                    child: TextField(
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Dung lượng",
                        labelText: 'dung lượng',
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                        floatingLabelStyle: TextStyle(
                          color: Colors.amber,
                          fontSize: 16,
                        ),
                      ),
                      onChanged: (value) {
                        capacity = value;
                      },
                    )),
                const Text(''),
                SizedBox(
                  // <-- SEE HERE
                    width: 300,
                    child: TextField(
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "CPU",
                        labelText: 'CPU',
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                        floatingLabelStyle: TextStyle(
                          color: Colors.amber,
                          fontSize: 16,
                        ),
                      ),
                      onChanged: (value) {
                        cpu = value;
                      },)),
                const Text(''),
                SizedBox(
                  // <-- SEE HERE
                    width: 300,
                    child: TextField(
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "RAM",
                        labelText: 'RAM',
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                        floatingLabelStyle: TextStyle(
                          color: Colors.amber,
                          fontSize: 16,
                        ),
                      ),
                      onChanged: (value) {
                        ram = value;
                      },)),
                const Text(''),
                SizedBox(
                  // <-- SEE HERE
                    width: 300,
                    child: TextField(
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "GPU",
                        labelText: 'GPU',
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                        floatingLabelStyle: TextStyle(
                          color: Colors.amber,
                          fontSize: 16,
                        ),
                      ),
                      onChanged: (value) {
                        gpu = value;
                      },)),
                const Text(''),
                SizedBox(
                  // <-- SEE HERE
                    width: 300,
                    child: TextField(
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Giá",
                        labelText: 'giá',
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                        floatingLabelStyle: TextStyle(
                          color: Colors.amber,
                          fontSize: 16,
                        ),
                      ),
                      onChanged: (value) {
                        price = int.parse(value);
                      },)),
                const Text(''),
                SizedBox(
                  // <-- SEE HERE
                    width: 300,
                    child: TextField(
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Mô tả",
                        labelText: 'mô tả',
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                        floatingLabelStyle: TextStyle(
                          color: Colors.amber,
                          fontSize: 16,
                        ),
                      ),
                      onChanged: (value) {
                        description = value;
                      },)),
                const Text(''),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Đóng', style: TextStyle(color: Colors.amber)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Lưu', style: TextStyle(color: Colors.blue)),
              onPressed: () async {
                Laptop laptop = Laptop
                  (productId: productId,
                    brand: brand,
                    capacity: capacity,
                    color: color,
                    isDelete: false,
                    name: name,
                    price: price,
                    cpu: cpu,
                    gpu: gpu,
                    ram: ram,
                    diskType: diskType,
                    seller: -1,
                    sellNumber: 0,
                    dateAdded: "",
                    image: "image",
                    description: description);
                await laptopController.addNewLaptop(laptop);
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  void _showAlertDialog(String message) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Thêm sản phẩm'),
          content: Text(message),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    XFile? image;

    final ImagePicker picker = ImagePicker();

    //we can upload image from camera or from gallery based on parameter
    Future getImage(ImageSource media) async {
      var img = await picker.pickImage(source: media);

      setState(() {
        image = img;
      });
    }

    //show popup dialog
    void myAlert() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              title: Text('Vui lòng chọn ảnh cho sản phẩm'),
              content: Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 6,
                child: Column(
                  children: [
                    ElevatedButton(
                      //if user click this button, user can upload image from gallery
                      onPressed: () {
                        Navigator.pop(context);
                        getImage(ImageSource.gallery);
                      },
                      child: Row(
                        children: [
                          Icon(Icons.image),
                          Text('Từ thư viện'),
                        ],
                      ),
                    ),
                    Text(''),
                    ElevatedButton(
                      //if user click this button. user can upload image from camera
                      onPressed: () {
                        Navigator.pop(context);
                        getImage(ImageSource.camera);
                      },
                      child: Row(
                        children: [
                          Icon(Icons.camera),
                          Text('Từ máy ảnh'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
    }

    Future<void> _showMyUpdateDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Cập nhật sản phẩm'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  SizedBox(
                    // <-- SEE HERE
                      width: 300,
                      child: TextField(
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Tên sản phẩm",
                            labelText: 'tên sản phẩm',
                            floatingLabelAlignment:
                            FloatingLabelAlignment.start,
                            floatingLabelStyle: TextStyle(
                              color: Colors.amber,
                              fontSize: 16,
                            ),
                          ))),
                  const Text(''),
                  SizedBox(
                    // <-- SEE HERE
                      width: 300,
                      child: TextField(
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Hãng",
                            labelText: 'Hãng',
                            floatingLabelAlignment:
                            FloatingLabelAlignment.start,
                            floatingLabelStyle: TextStyle(
                              color: Colors.amber,
                              fontSize: 16,
                            ),
                          ))),
                  const Text(''),
                  SizedBox(
                    // <-- SEE HERE
                      width: 300,
                      child: TextField(
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Màu sắc",
                            labelText: 'màu sắc',
                            floatingLabelAlignment:
                            FloatingLabelAlignment.start,
                            floatingLabelStyle: TextStyle(
                              color: Colors.amber,
                              fontSize: 16,
                            ),
                          ))),
                  const Text(''),
                  SizedBox(
                    // <-- SEE HERE
                      width: 300,
                      child: TextField(
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Loại đĩa",
                            labelText: 'loại đĩa',
                            floatingLabelAlignment:
                            FloatingLabelAlignment.start,
                            floatingLabelStyle: TextStyle(
                              color: Colors.amber,
                              fontSize: 16,
                            ),
                          ))),
                  const Text(''),
                  SizedBox(
                    // <-- SEE HERE
                      width: 300,
                      child: TextField(
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Dung lượng",
                            labelText: 'dung lượng',
                            floatingLabelAlignment:
                            FloatingLabelAlignment.start,
                            floatingLabelStyle: TextStyle(
                              color: Colors.amber,
                              fontSize: 16,
                            ),
                          ))),
                  const Text(''),
                  SizedBox(
                    // <-- SEE HERE
                      width: 300,
                      child: TextField(
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "CPU",
                            labelText: 'CPU',
                            floatingLabelAlignment:
                            FloatingLabelAlignment.start,
                            floatingLabelStyle: TextStyle(
                              color: Colors.amber,
                              fontSize: 16,
                            ),
                          ))),
                  const Text(''),
                  SizedBox(
                    // <-- SEE HERE
                      width: 300,
                      child: TextField(
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "RAM",
                            labelText: 'RAM',
                            floatingLabelAlignment:
                            FloatingLabelAlignment.start,
                            floatingLabelStyle: TextStyle(
                              color: Colors.amber,
                              fontSize: 16,
                            ),
                          ))),
                  const Text(''),
                  SizedBox(
                    // <-- SEE HERE
                      width: 300,
                      child: TextField(
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "GPU",
                            labelText: 'GPU',
                            floatingLabelAlignment:
                            FloatingLabelAlignment.start,
                            floatingLabelStyle: TextStyle(
                              color: Colors.amber,
                              fontSize: 16,
                            ),
                          ))),
                  const Text(''),
                  SizedBox(
                    // <-- SEE HERE
                      width: 300,
                      child: TextField(
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Giá",
                            labelText: 'giá',
                            floatingLabelAlignment:
                            FloatingLabelAlignment.start,
                            floatingLabelStyle: TextStyle(
                              color: Colors.amber,
                              fontSize: 16,
                            ),
                          ))),
                  const Text(''),
                  SizedBox(
                    // <-- SEE HERE
                      width: 300,
                      child: TextField(
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Mô tả",
                            labelText: 'mô tả',
                            floatingLabelAlignment:
                            FloatingLabelAlignment.start,
                            floatingLabelStyle: TextStyle(
                              color: Colors.amber,
                              fontSize: 16,
                            ),
                          ))),
                  const Text(''),
                  SizedBox(
                    // <-- SEE HERE
                      width: 300,
                      child: TextField(
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Số lượng",
                            labelText: 'Số lượng',
                            floatingLabelAlignment:
                            FloatingLabelAlignment.start,
                            floatingLabelStyle: TextStyle(
                              color: Colors.amber,
                              fontSize: 16,
                            ),
                          ))),
                  const Text(''),
                  ElevatedButton(
                    onPressed: () {
                      myAlert();
                    },
                    child: Text('Upload Photo'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //if image not null show the image
                  //if image null show text
                  image != null
                      ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        //to show image, you type like this.
                        File(image!.path),
                      ),
                    ),
                  )
                      : Text(
                    "No Image",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child:
                const Text('Đóng', style: TextStyle(color: Colors.amber)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Lưu', style: TextStyle(color: Colors.blue)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: Header(
          id: userController.currentUser.value.accountId,
          username: userController.currentUser.value.name),
      body: ListView(
        children: <Widget>[
          Container(
            child: const Text(
              'List of Product',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
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
                onPressed: () => _showAddDialog(),
              ),
            ),
          ),
          Container(
            child: Obx(
                  () =>
                  DataTable(
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
                      rows: laptopController.sellerList.value
                          ?.map(
                            (laptop) =>
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Expanded(
                                    child: Text(laptop.productId.toString()))),
                                DataCell(Expanded(child: Text(laptop.name))),
                                DataCell(Expanded(child: Text(laptop.brand))),
                                DataCell(Image.network(
                                  laptop.image,
                                  width: 50,
                                )),
                                DataCell(Expanded(
                                    child: Text(laptop.price.toString()))),
                                DataCell(
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              5, 5, 0, 0),
                                          child: TextButton(
                                            style: TextButton.styleFrom(
                                              backgroundColor:
                                              Colors.lightBlueAccent,
                                              // background
                                              foregroundColor:
                                              Colors.white, // foreground
                                            ),
                                            child: Icon(Icons.edit),
                                            onPressed: () =>
                                                _showMyUpdateDialog(),
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              5, 5, 0, 0),
                                          child: TextButton(
                                            style: TextButton.styleFrom(
                                              backgroundColor: Colors.red,
                                              // background
                                              foregroundColor:
                                              Colors.white, // foreground
                                            ),
                                            child: Icon(Icons.delete),
                                            onPressed: () async {
                                              await laptopController
                                                  .deleteLaptop(
                                                  laptop.productId);
                                              _showAlertDialog(
                                                  "Xóa sản phẩm thành công");
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
          )
        ],
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 70.0),
        child: SizedBox(
          width: 56.0,
          height: 56.0,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const OrderScreen()),
              );
            },
            backgroundColor: customBlue,
            elevation: 10,
            child: Image.asset(
              "assets/icons/bag_ic.png",
              width: 20.0,
              height: 20.0,
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 100,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bottomnav_bg.png"),
                fit: BoxFit.fitWidth)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    navigationIndex = 0;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SellerMain()),
                    );
                  },
                  child: Image.asset("assets/icons/home_ic.png",
                      width: 25,
                      height: 25,
                      color: navigationIndex == 0 ? customBlue : customGrey),
                ),
                InkWell(
                  onTap: () {
                    navigationIndex = 2;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StatisticScreen()),
                    );
                  },
                  child: Image.asset("assets/icons/statistics_ic.png",
                      width: 25,
                      height: 25,
                      color: navigationIndex == 2 ? customBlue : customGrey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
