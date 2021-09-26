
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodListPage extends StatelessWidget {
  const FoodListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('FOOD MENU',style: GoogleFonts.roboto(fontSize: 50.0),),
        ),
      ),
    );;
  }
}
