import 'package:flutter/material.dart';
import 'package:ltddnc_nhom04_k19/SignUp.dart';
import 'package:ltddnc_nhom04_k19/user/user.dart';
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
      resizeToAvoidBottomInset: false,   //new line
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            new Image.asset(
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
            SizedBox( // <-- SEE HERE
                width: 300, child: TextField(
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,

              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter username",
                icon: Icon(Icons.account_box,color: Colors.lightGreenAccent,),
                labelText: 'Username',
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
              obscureText: true, // ẩn pass word
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter password",
                icon: Icon(Icons.lock,color: Colors.lightGreenAccent,),
                labelText: 'Password',
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
              buttonPadding:EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 10
              ),
              children: [
                ElevatedButton(  child: Row (
                  children: [
                    Icon(Icons.login),
                    Text("Login"),

                  ],
                ) ,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const UserApp()),
                    );
                  },)],
            ),
            Row(
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
              mainAxisAlignment: MainAxisAlignment.center,
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
