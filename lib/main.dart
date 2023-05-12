import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ltddnc_nhom04_k19/SignUp.dart';
import 'package:ltddnc_nhom04_k19/controller/AddressController.dart';
import 'package:ltddnc_nhom04_k19/controller/UserController.dart';
import 'package:ltddnc_nhom04_k19/seller/seller.dart';
import 'package:ltddnc_nhom04_k19/user/user.dart';
import 'package:dio/dio.dart';
import 'controller/LaptopController.dart';
import 'controller/OrderController.dart';
import 'model/User.dart';

// final HOST_URL = "10.0.2.2";
final HOST_URL = "localhost";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userController = Get.put(UserController(), tag: "userController");
  final orderController = Get.put(OrderController(), tag: "orderController");
  final laptopController = Get.put(LaptopController(), tag: "laptopController");
  final addressController = Get.put(AddressController(), tag: "addressController");

  User getCurrentLogin() {
    return userController.currentUser.value;
  }

  void setCurrentLogin(User user) {
    userController.currentUser.value = user;
  }

  Future<User> login(String email, String password) async {
    try {
      final dio = Dio();
      final response = await dio.post(
        "http://$HOST_URL:8000/auth/login",
        data: '{ "email": "$email", "password": "$password" }',
      );
      return User.fromJson(response.data);
    } on Exception catch (e) {
      print(e);
      return User(
          accountId: -1,
          name: "name",
          accessToken: "accessToken",
          refreshToken: "refreshToken",
          isSeller: false);
    }
  }

  void _showAlertDialog(String message) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
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
    String email = "";
    String password = "";
    return Scaffold(
      resizeToAvoidBottomInset: false, //new line
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/laptopbrand.png',
              width: 450.0,
              height: 200.0,
              fit: BoxFit.fill,
            ),
            const Text(
              'Hệ thống bán lẻ laptop, máy tính',
              textAlign: TextAlign.center,
              selectionColor: Colors.lightBlue,
              textScaleFactor: 2.5,
            ),
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
                    hintText: "Enter username",
                    icon: Icon(
                      Icons.account_box,
                      color: Colors.lightGreenAccent,
                    ),
                    labelText: 'Username',
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    floatingLabelStyle: TextStyle(
                      color: Colors.amber,
                      fontSize: 16,
                    ),
                  ),
                  onChanged: (value) {
                    email = value;
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
                  obscureText: true, // ẩn pass word
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter password",
                    icon: Icon(
                      Icons.lock,
                      color: Colors.lightGreenAccent,
                    ),
                    labelText: 'Password',
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    floatingLabelStyle: TextStyle(
                      color: Colors.amber,
                      fontSize: 16,
                    ),
                  ),
                  onChanged: (value) {
                    password = value;
                  },
                )),
            const Text(''),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              buttonPadding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              children: [
                ElevatedButton(
                  child: Row(
                    children: const [
                      Icon(Icons.login),
                      Text("Login"),
                    ],
                  ),
                  onPressed: () async {
                    User user = await login(email, password);
                    if (user.accountId == -1) {
                      _showAlertDialog(
                          "Cannot find this account, Please check your username and password");
                    } else {
                      setCurrentLogin(user);
                      if (user.isSeller == true) {
                        await laptopController.fetchLaptopOfSeller();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SellerMain()),
                        );
                      } else {
                        await orderController.fetchUserOrders();
                        await userController.fetchCartProductId();
                        await addressController.fetchAddressList();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UserApp()),
                        );
                      }
                    }
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Does not have account?'),
                TextButton(
                  child: const Text(
                    'Sign up',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()),
                    );
                  },
                )
              ],
            )
            // Text(
            //   textDemo,
            //   style: Theme.of(context).textTheme.headlineMedium,
            // )
          ],
        ),
      ),
    );
  }
}
