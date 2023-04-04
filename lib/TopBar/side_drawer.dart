import 'package:architect_app/AR/ar_view.dart';
import 'package:architect_app/ColorRecommend/color_recom.dart';
import 'package:architect_app/Home/home.dart';
import 'package:architect_app/Products/sofa_sets.dart';
import 'package:architect_app/Products/tables.dart';
import 'package:architect_app/SplashScreens/splash_screen_signout.dart';
import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SideDrawerWidget extends StatelessWidget {
  const SideDrawerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    String? username = '';
    if (user?.email == null) {
      username = "Guest";
    } else {
      username = user?.email;
    }
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 65),
            height: 130,
            child: DrawerHeader(
              child: Text(
                "NAVIGATION",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(top: 10, bottom: 30),
              child: Image.asset(
                'assets/images/logoBlack.png',
                height: 80,
                width: 80,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
            child: ListTile(
              title: Text(
                "User",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: ListTile(
              title: Text(
                username!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 15),
              ),
            ),
          ),
          ListTile(
            title: const Text('View In AR'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ARViewWidget()),
              );
            },
          ),
          ListTile(
            title: const Text('Color Suggestion'),
            onTap: () async {
              await availableCameras().then(
                (value) => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CameraPage(cameras: value),
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Products: Sofa Sets'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductsSofaSets(),
                  ));
            },
          ),
          ListTile(
            title: const Text('Products: Tables'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductsTables(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Help'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductsTables(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Sign Out'),
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SplashSignOut(
                    key: Key('splash'),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
