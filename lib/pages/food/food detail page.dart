

import 'package:flutter/material.dart';
import 'package:flutter_food/model/food_item.dart';
import 'package:flutter_food/pages/food/food_menu.dart';
import 'package:google_fonts/google_fonts.dart';

class foodDetailPage extends StatefulWidget {
  static const routeName = '/foodetail';
  const foodDetailPage({Key? key}) : super(key: key);

  @override
  _foodDetailPageState createState() => _foodDetailPageState();
}

class _foodDetailPageState extends State<foodDetailPage> {
  @override
  Widget build(BuildContext context) {
    var items = ModalRoute.of(context)!.settings.arguments as FoodItem;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Food Detail',
          style: GoogleFonts.roboto(),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/images/${items.image}',
                fit: BoxFit.fill
            ),
            Text('ชื่อเมนู: ${items.name}',style: GoogleFonts.kanit(fontSize: 20.0)),
            Text('ราคา: ${items.price} บาท',style: GoogleFonts.kanit(fontSize: 20.0)),

          ],
        ),
      ),
    );
  }
}
