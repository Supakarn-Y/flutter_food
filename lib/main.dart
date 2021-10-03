import 'package:flutter/material.dart';
import 'package:flutter_food/pages/hompage/food%20detail%20page.dart';
import 'package:flutter_food/pages/hompage/home_page.dart';
import 'package:flutter_food/pages/hompage/profile.dart';
import 'package:flutter_food/pages/login/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold,color: Colors.black),
            headline2: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold,color: Colors.black),
            bodyText2: TextStyle(fontSize: 14.0),

          )),
      //home: LoginPage(),
      routes: {
        LoginPage.routeName: (context) => const LoginPage(),
        HomePage.routeName: (context) => const HomePage(),
        ProfilePage.routeName: (context) => const ProfilePage(),
        foodDetailPage.routeName: (context) => const foodDetailPage(),
      },
      initialRoute: LoginPage.routeName,
    );
  }
}

