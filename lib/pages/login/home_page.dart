
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FLUTTER FOOD',style: GoogleFonts.roboto(),),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        color: Colors.teal.shade200,
        child: Center(
          child: Text('THIS IS A HOMEPAGE', style: GoogleFonts.roboto(fontSize: 50.0),textAlign: TextAlign.center,),
        )
      ),
    );
  }
}
