import 'package:architect_app/SplashScreens/splash_screen_signout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Home/home.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          icon: const Icon(Icons.login),
          tooltip: 'Logout',
          onPressed: () {
            FirebaseAuth.instance.signOut();
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const SplashSignOut(key: Key('splash'))),
            );
          },
        ),
      ],
      title: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Home()),
          );
        },
        child: Text("ARCHITECT",
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w800,
              fontSize: 20,
            )),
      ),
      centerTitle: true,
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
