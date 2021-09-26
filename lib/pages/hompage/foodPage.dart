
import 'package:flutter/material.dart';
import 'package:flutter_food/pages/hompage/food_menu.dart';
import 'package:flutter_food/pages/hompage/your_order.dart';
import 'package:google_fonts/google_fonts.dart';

class foodPage extends StatefulWidget {
  const foodPage({Key? key}) : super(key: key);

  @override
  _foodPageState createState() => _foodPageState();
}

class _foodPageState extends State<foodPage> {
  var _selectdButtomNavIndex  = 0 ;

  Widget _buildSubPage() {
    switch (_selectdButtomNavIndex) {
      case 0:
        return FoodListPage();

      case 1:
        return  OrderPage();


      default:
        return Center(
          child: Text(
            'THIS IS A HOMEPAGE',
            style: GoogleFonts.roboto(fontSize: 35.0),
            textAlign: TextAlign.center,
          ),
        );
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book,color: Colors.teal,),
            label : 'Menu',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart,color: Colors.teal,),
            label : 'Your Order',
          )
        ],
        currentIndex: _selectdButtomNavIndex,
        onTap: (index) {
          setState(() {
            _selectdButtomNavIndex = index;

          });
        },

      )  ,
      body: Container(
        child: Center(
          child:  _buildSubPage(),
        ),
      ),
    );


  }
}
