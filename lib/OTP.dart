
import 'package:flutter/material.dart';
import 'package:ltddnc_nhom04_k19/ResetPassword.dart';
import 'package:ltddnc_nhom04_k19/main.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Authoried OTP'),
      ),
      backgroundColor: Colors.white,

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
            const Text(
              'HỆ THỐNG BÁN LẺ MÁY TÍNH, LAPTOP',
              style: TextStyle(fontSize: 20, color: Colors.lightBlue),
              textAlign: TextAlign.center,
              selectionColor: Colors.lightBlue,
            ),
            const Text(''),
            new Image.asset(
              'assets/images/laptopbrand.png',
              width: 300.0,
              height: 200.0,
              fit: BoxFit.fill,
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
                hintText: "Enter OTP",
                icon: Icon(Icons.account_box,color: Colors.lightBlue,),
                labelText: 'OTP',
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
                    Icon(Icons.logo_dev_sharp),
                    Text("Send to reset password"),

                  ],
                ) ,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ResetPassword()),
                    );
                  },)],
            ),

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

