
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = '/profile';

  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
            child: Container(
              width: 100.0,
              height: 100.0,
              child: Image.asset('assets/images/profile.jpg'),
            )
        ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Supakarn Yoojongdee',style: GoogleFonts.roboto(fontSize: 20.0),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Yoojongdee_s@silpakorn.edu',style: GoogleFonts.roboto(fontSize: 15.0),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
