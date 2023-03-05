import 'package:architect_app/objectsView.dart';
import 'package:architect_app/welcomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main.dart';

class Home extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    String? username = '';
    if (user?.email == null){
      username = "Guest";
    }else{
      username = user?.email;
    }
    final sizedBoxHeight = (MediaQuery.of(context).size.height - 200) / 3.1;
    return WillPopScope(
      onWillPop: () async{
        return false;
      },
      child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            actions: [
              IconButton(
                icon: const Icon(Icons.login),
                tooltip: 'Logout',
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WelcomePage()),
                  );
                },
              ),
            ],
            title: Text("ARCHITECT",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                )),
            centerTitle: true,
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
          ),
          body: Center(
            child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    buildImageStack(
                        context,
                        sizedBoxHeight,
                        'https://images.unsplash.com/photo-1550226891-ef816aed4a98?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                        'SCAN'),
                    const SizedBox(height: 15.0),
                    buildImageStack(
                        context,
                        sizedBoxHeight,
                        'https://images.unsplash.com/photo-1550581190-9c1c48d21d6c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1109&q=80',
                        'CREATE'),
                    const SizedBox(height: 15.0),
                    buildImageStack(
                        context,
                        sizedBoxHeight,
                        'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                        'EDIT'),
                    const SizedBox(height: 15.0),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shadowColor: const Color.fromARGB(255, 120, 112, 112),
                          elevation: 2,
                          disabledForegroundColor: Colors.black.withOpacity(0.38),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          ),
                        ),
                        child: Text(
                          "Initiate Scan",
                          style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Text("NAVIGATION",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                      )),
                ),
                ListTile(
                  title: Text(
                      "User: ${username!}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  //leading: Icon(Icons.new_page),
                  title: const Text('View In AR'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ObjectsView()),
                    );
                  },
                ),
              ],
            ),
          )),
    );
  }

  Widget buildImageStack(BuildContext context, double sizedBoxHeight,
      String imageUrl, String text) {
    return Stack(
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          height: sizedBoxHeight,
          child: Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return const Center(child: Text('Image Not Found'));
                },
              ),
            ),
          ),
        ),
        Container(
          height: sizedBoxHeight,
          alignment: Alignment.center,
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w800,
                fontSize: 50,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
