import 'package:flutter/material.dart';
import 'package:flutter_food/pages/login/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _subPageIndex = 0;
  var _selectdButtomNavIndex  = 0 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FLUTTER FOOD',
          style: GoogleFonts.roboto(),
        ),
        backgroundColor: Colors.teal,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: BoxDecoration(color: Colors.red),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.person,
                      size: 60.0,
                      color: Colors.white,
                    ),
                    Text(
                      'Suapakarn Yoojongdee',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    )
                  ],
                )),
            ListTile(
                title: _buildDreawerItem(Icon(Icons.home), 'HOME'),
                onTap: () => _showSubPage(0)),
            ListTile(
                title: _buildDreawerItem(Icon(Icons.person), 'PAGE 1'),
                onTap: () => _showSubPage(1)
                //Navigator.of(context).pushNamed(LoginPage.routeName);
                ),
            ListTile(
                title: _buildDreawerItem(Icon(Icons.file_copy), 'PAGE 2'),
                onTap: () => _showSubPage(2)),
            ListTile(
                title: _buildDreawerItem(Icon(Icons.settings), 'Setting'),
                onTap: () => _showSubPage(3)),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label : 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label : 'Setting',
          )
        ],
        currentIndex: _selectdButtomNavIndex,
        onTap: (index) {
          setState(() {
            _selectdButtomNavIndex = index;
          });
        },
      ),
      body: Container(color: Colors.teal.shade200, child: _buildSubPage()),
    );
  }

  _showSubPage(int index) {
    setState(() {
      _subPageIndex = index;
    });

    Navigator.of(context).pop();
  }

  Widget _buildSubPage() {
    switch (_subPageIndex) {
      case 0:
        return Center(
          child: Text(
            'THIS IS A HOMEPAGE',
            style: GoogleFonts.roboto(fontSize: 35.0),
            textAlign: TextAlign.center,
          ),
        );

      case 1:
        return Center(
          child: Text(
            'PAGE 1',
            style: GoogleFonts.roboto(fontSize: 35.0),
            textAlign: TextAlign.center,
          ),
        );

      case 2:
        return Center(
          child: Text(
            'PAGE 2',
            style: GoogleFonts.roboto(fontSize: 35.0),
            textAlign: TextAlign.center,
          ),
        );

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

  Row _buildDreawerItem(Widget icon, String title) {
    return Row(
      children: [
        icon,
        SizedBox(
          width: 8.0,
        ),
        Text('$title'),
      ],
    );
  }
}
