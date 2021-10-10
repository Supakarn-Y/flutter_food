import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_food/model/food_item.dart';
import 'package:flutter_food/pages/food/food_menu.dart';
import 'package:flutter_food/pages/hompage/your_order.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class foodPage extends StatefulWidget {
  const foodPage({Key? key}) : super(key: key);

  @override
  _foodPageState createState() => _foodPageState();
}

class _foodPageState extends State<foodPage> {
  var _selectdButtomNavIndex = 0;

  Widget _buildSubPage() {
    switch (_selectdButtomNavIndex) {
      case 0:
        return FoodListPage();

      case 1:
        return OrderPage();

      default:
        return Center(
          child: Text(
            'THIS IS A HOMEPAGE',
            style: GoogleFonts.roboto(fontSize: 35.0),
            textAlign: TextAlign.center,
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _test() async {
      var url = Uri.parse("https://cpsu-test-api.herokuapp.com/foods");
      var response = await http.post(url); //asynchronous
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonBody = json.decode(response.body);
        String status = jsonBody['status'];
        String? message = jsonBody['message'];
        List<dynamic> data = jsonBody['data'];
        print('STATUS : $status');
        print('MESSAGE : $message');

        var foodlist = data.map((element) => FoodItem(
            id: element['id'],
            name: element['name'],
            price: element['price'],
            image: element['image'])).toList();
      }
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _test,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: _selectdButtomNavIndex == 0
                ? Icon(
                    Icons.menu_book,
                    color: Colors.teal,
                  )
                : Icon(
                    Icons.menu_book,
                    color: Colors.grey,
                  ),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: _selectdButtomNavIndex == 1
                ? Icon(
                    Icons.shopping_cart,
                    color: Colors.teal,
                  )
                : Icon(
                    Icons.shopping_cart,
                    color: Colors.grey,
                  ),
            label: 'Your Order',
          )
        ],
        currentIndex: _selectdButtomNavIndex,
        onTap: (index) {
          setState(() {
            _selectdButtomNavIndex = index;
          });
        },
      ),
      body: Container(
        child: Center(
          child: _buildSubPage(),
        ),
      ),
    );
  }
}
