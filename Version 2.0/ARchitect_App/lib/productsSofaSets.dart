import 'package:architect_app/productsTables.dart';
import 'package:architect_app/splashScreenForSignOut.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ar_view.dart';
import 'home.dart';

class ProductsSofaSets extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  ProductsSofaSets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    String? username = '';
    if (user?.email == null) {
      username = "Guest";
    } else {
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
              icon: const Icon(Icons.shopping_cart),
              tooltip: 'Cart',
              onPressed: () {

              },
            ),
            IconButton(
              icon: const Icon(Icons.logout),
              tooltip: 'Logout',
              onPressed: () {
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
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Home()),
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
        ),
        body: ListView(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25.0,
                ),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 25.0),
                      const Text(
                        "Sofa-Sets",
                        style: TextStyle(
                          fontFamily: 'Itim',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      GestureDetector(
                        onTap: () {},
                        child: buildImageStack(
                            context,
                            sizedBoxHeight,
                            'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                            'Sofa 1'),
                      ),
                      const SizedBox(height: 15.0),
                      GestureDetector(
                        onTap: () {},
                        child: buildImageStack(
                            context,
                            sizedBoxHeight,
                            'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                            'Sofa 2'),
                      ),
                      const SizedBox(height: 15.0),
                      GestureDetector(
                        onTap: () {},
                        child: buildImageStack(
                            context,
                            sizedBoxHeight,
                            'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                            'Sofa 3'),
                      ),
                      const SizedBox(height: 15.0),
                      GestureDetector(
                        onTap: () {},
                        child: buildImageStack(
                            context,
                            sizedBoxHeight,
                            'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                            'Sofa 4'),
                      ),
                      const SizedBox(height: 15.0),
                      GestureDetector(
                        onTap: () {},
                        child: buildImageStack(
                            context,
                            sizedBoxHeight,
                            'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                            'Sofa 5'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        drawer: Drawer(
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
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Home()),
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
              Container(
                height: 25,
                child: const ListTile(
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
                //leading: Icon(Icons.new_page),
                title: const Text('View In AR'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ARViewWidget()),
                  );
                },
              ),
              ListTile(
                //leading: Icon(Icons.new_page),
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
                //leading: Icon(Icons.new_page),
                title: const Text('Products: Tables'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductsTables(),
                      ));
                },
              ),
              ListTile(
                //leading: Icon(Icons.new_page),
                title: const Text('My Cart'),
                onTap: () {},
              ),
              ListTile(
                //leading: Icon(Icons.new_page),
                title: const Text('Sign Out'),
                onTap: () {
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
          ),
        ),
      ),
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