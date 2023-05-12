import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ltddnc_nhom04_k19/main.dart';

import 'controller/UserController.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final userController = Get.find<UserController>(tag: "userController");
  final _formKey = GlobalKey<FormState>();

  void _showDialog(String tittle, String message, BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(tittle),
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
    String name = "";
    String phoneNumber = "";
    String email = "";
    String password = "";
    String repassword = "";
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Sign up'),
        ),
        backgroundColor: Colors.white,
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: <
                    Widget>[
          const Text(
            'Đăng ký tài khoản mới',
            textAlign: TextAlign.center,
            selectionColor: Colors.lightBlue,
            textScaleFactor: 2.5,
          ),
          const Text(''),
          Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                    // <-- SEE HERE
                    width: 300,
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      onChanged: (value) {
                        name = value;
                      },
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter your name",
                        icon: Icon(
                          Icons.account_box,
                          color: Colors.lightGreenAccent,
                        ),
                        labelText: 'Name',
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                        floatingLabelStyle: TextStyle(
                          color: Colors.amber,
                          fontSize: 16,
                        ),
                      ),
                    )),
                const Text(''),
                SizedBox(
                    // <-- SEE HERE
                    width: 300,
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      onChanged: (value) {
                        email = value;
                      },
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter your email",
                        icon: Icon(
                          Icons.email,
                          color: Colors.lightGreenAccent,
                        ),
                        labelText: 'Email',
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                        floatingLabelStyle: TextStyle(
                          color: Colors.amber,
                          fontSize: 16,
                        ),
                      ),
                    )),
                const Text(''),
                SizedBox(
                    // <-- SEE HERE
                    width: 300,
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      onChanged: (value) {
                        password = value;
                      },
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      obscureText: true,
                      // ẩn pass word
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
                    )),
                const Text(''),
                SizedBox(
                    // <-- SEE HERE
                    width: 300,
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      onChanged: (value) {
                        repassword = value;
                      },
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter your re password';
                        }
                        return null;
                      },
                      obscureText: true,
                      // ẩn pass word
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter repassword",
                        icon: Icon(
                          Icons.lock,
                          color: Colors.lightGreenAccent,
                        ),
                        labelText: 'RePassword',
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                        floatingLabelStyle: TextStyle(
                          color: Colors.amber,
                          fontSize: 16,
                        ),
                      ),
                    )),
                const Text(''),
                SizedBox(
                    // <-- SEE HERE
                    width: 300,
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      onChanged: (value) {
                        phoneNumber = value;
                      },
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter phone number",
                        icon: Icon(
                          Icons.phone_android,
                          color: Colors.lightGreenAccent,
                        ),
                        labelText: 'Phone Number',
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                        floatingLabelStyle: TextStyle(
                          color: Colors.amber,
                          fontSize: 16,
                        ),
                      ),
                    )),
                const Text(''),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  buttonPadding:
                      EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  children: [
                    ElevatedButton(
                      child: Row(
                        children: [
                          Icon(Icons.add),
                          Text("Sign up"),
                        ],
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          if (password == repassword) {
                            int? statusCode = await userController.register(
                                name, phoneNumber, email, password);
                            switch (statusCode) {
                              case 201:
                                {
                                  _showDialog(
                                      "Success",
                                      "Đã tạo tài khoản thành công, mời quay về trang đăng nhập",
                                      context);
                                  break;
                                }
                              case 400:
                                {
                                  _showDialog("Error",
                                      "Địa chỉ email không hợp lệ", context);
                                  break;
                                }
                              case 409:
                                {
                                  _showDialog(
                                      "Error",
                                      "Tài khoản sử dụng email này đã tồn tại",
                                      context);
                                  break;
                                }
                            }
                          } else {
                            _showDialog(
                                "Error", "2 mật khẩu không khớp", context);
                          }
                        }
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ])));
  }
}
