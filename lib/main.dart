import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ltddnc_nhom04_k19/SignUp.dart';
import 'package:ltddnc_nhom04_k19/controller/UserController.dart';
import 'package:ltddnc_nhom04_k19/seller/seller.dart';
import 'package:ltddnc_nhom04_k19/user/user.dart';
import 'package:dio/dio.dart';
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

  User getCurrentLogin() {
    return userController.currentUser.value;
  }

  void setCurrentLogin(User user)  {
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
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
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
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  obscureText: true, // ẩn pass word
                  decoration: InputDecoration(
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
              buttonPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
                    setCurrentLogin(user);
                    if (user.isSeller == true) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SellerMain()),
                      );
                    }
                    else if (user.accountId != -1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserApp()),
                      );
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
                      MaterialPageRoute(builder: (context) => const SignUp()),
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
