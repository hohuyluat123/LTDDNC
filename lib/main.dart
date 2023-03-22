import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import './seller/seller.dart';
import './user/user.dart';
import 'package:dio/dio.dart';

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

class User {
  //TODO: Add role in Database
  final int accountId;
  final String name;
  final String accessToken;
  final String refreshToken;

  User({
    required this.accountId,
    required this.name,
    required this.accessToken,
    required this.refreshToken,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      accountId: json['currentAccount']['id'] as int,
      name: json['currentAccount']['name'] as String,
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "accessToken": this.accessToken,
      "refreshToken": this.refreshToken,
      "currentAccount": {
        "id": this.accountId,
        "name": this.name
      }
    };
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  Future<User> getCurrentLogin() async {
    final prefs = await SharedPreferences.getInstance();
    return User.fromJson(jsonDecode(prefs.getString("currentUser").toString()));
  }

  Future<void> setCurrentLogin(User user) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("currentUser", jsonEncode(user));
  }

  Future<User> login(String email, String password) async {
    final dio = Dio();
    final response = await dio.post("https://localhost:8000/auth/login",
        data: '{ "email": "$email", "password": "$password" }',);
    return User.fromJson(response.data);
  }

  @override
  Widget build(BuildContext context) {
    String email = "";
    String password = "";
    return Scaffold(
      backgroundColor: Colors.white60,
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child:  TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
                onChanged: (value) {
                  email = value;
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
                onChanged: (value) {
                  password = value;
                },
              ),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: ElevatedButton(
                child: const Text('Login'),
                onPressed: () async {
                  User user = await login(email, password);
                  await setCurrentLogin(user);
                  User savedUser = await getCurrentLogin();
                  //TODO: Route to sutable main page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SellerMain()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
