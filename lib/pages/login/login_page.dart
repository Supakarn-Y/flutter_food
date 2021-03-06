import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_food/pages/hompage/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  static const routeName = '/login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var input = '';

  Future<void> _login() async {
    var url = Uri.parse("https://cpsu-test-api.herokuapp.com/login");
    var response = await http.post(url,body: {'pin' : input}); //asynchronous
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonBody = json.decode(response.body);
      String status = jsonBody['status'];
      String? message = jsonBody['message'];
      bool data = jsonBody['data'];

      if (data == true) {
        Navigator.pushReplacementNamed(context, HomePage.routeName);
      } else {
        _showMaterialDialog();
        input = '';
      }
    }
  }


  void _showMaterialDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("ERROR", style: GoogleFonts.roboto()),
          content: Text("Invalid PIN, Please try again.", style: GoogleFonts.roboto()),
          actions: [
            // ปุ่ม OK ใน dialog
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                // ปิด dialog
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
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            // ไล่เฉดจากมุมบนซ้ายไปมุมล่างขวาของ Container
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            // ไล่เฉดจากสีแดงไปสีน้ำเงิน
            colors: [
              Colors.yellow.shade300,
              Colors.green.shade300,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.lock_outline,
                        size: 100.0,
                        color: Colors.black,
                      ),
                      Text("LOGIN",
                          style: Theme.of(context).textTheme.headline1),
                      Text('Enter PIN to Login',
                          style: GoogleFonts.roboto(fontSize: 15.0)),
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child:  Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  for (var i = 1; i <= input.length; i++)
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Icon(Icons.circle,color: Colors.green,),
                                    ),
                                  for (var i = 1; i <= 6 - input.length; i++)
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Icon(Icons.circle_outlined),
                                    ),
                                ],
                              ),
                      )
                    ],
                  ),
                ),
              ),
               Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    [1, 2, 3],
                    [4, 5, 6],
                    [7, 8, 9],
                    [-2, 0, -1],
                  ].map((row) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: row.map((item) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: LoginButton(
                            number: item,
                            onClick: _handleClickButton,
                          ),
                        );
                      }).toList(),
                    );
                  }).toList(),
                ),

            ],
          ),
        ),
      ),
    );
  }

  void _handleClickButton(int num) {

    setState(() {
      if (num == -1) {
        if (input.length > 0) input = input.substring(0, input.length - 1);
      } else {
        input = '$input$num';
      }
      if (input.length == 6) {

        _login();
      }
    });
  }
}

class LoginButton extends StatelessWidget {
  final int number;
  final Function(int) onClick;

  const LoginButton({
    required this.number,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: CircleBorder(),
      onTap: () {
        number == -2 ? null : onClick(number);
      },
      child: Container(
        width: 80.0,
        height: 80.0,
        decoration: number == -2
            ? null
            : BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 3.0, color: Colors.black),
              ),
        child: Center(
            child: number >= 0
                ? Text(
                    '$number',
                    style: Theme.of(context).textTheme.headline2,
                  )
                : (number == -1
                    ? Icon(
                        Icons.backspace_outlined,
                        size: 28.0,
                        color: Colors.black,
                      )
                    : SizedBox.shrink())),
      ),
    );
  }
}
