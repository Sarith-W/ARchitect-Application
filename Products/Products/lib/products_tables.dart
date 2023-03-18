import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:products/products_sofa_sets.dart';

class Products_Tables extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Products_Tables({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizedBoxHeight = (MediaQuery.of(context).size.height - 200) / 3.1;
    return Scaffold(
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
            tooltip: 'Cart',
            onPressed: () {

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
                      "Tables",
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
                          'http://cdn.shopify.com/s/files/1/0590/7431/4421/products/8720286974025_m_en_hd_1_9f38296b-4d0b-4435-81ad-0ed615bad3ac.jpg?v=1673842086',
                          'Table 1'),
                    ),
                    const SizedBox(height: 15.0),
                    GestureDetector(
                      onTap: () {},
                      child: buildImageStack(
                          context,
                          sizedBoxHeight,
                          'http://cdn.shopify.com/s/files/1/0590/7431/4421/products/8720286974025_m_en_hd_1_9f38296b-4d0b-4435-81ad-0ed615bad3ac.jpg?v=1673842086',
                          'Table 2'),
                    ),
                    const SizedBox(height: 15.0),
                    GestureDetector(
                      onTap: () {},
                      child: buildImageStack(
                          context,
                          sizedBoxHeight,
                          'http://cdn.shopify.com/s/files/1/0590/7431/4421/products/8720286974025_m_en_hd_1_9f38296b-4d0b-4435-81ad-0ed615bad3ac.jpg?v=1673842086',
                          'Table 3'),
                    ),
                    const SizedBox(height: 15.0),
                    GestureDetector(
                      onTap: () {},
                      child: buildImageStack(
                          context,
                          sizedBoxHeight,
                          'http://cdn.shopify.com/s/files/1/0590/7431/4421/products/8720286974025_m_en_hd_1_9f38296b-4d0b-4435-81ad-0ed615bad3ac.jpg?v=1673842086',
                          'Table 4'),
                    ),
                    const SizedBox(height: 15.0),
                    GestureDetector(
                      onTap: () {},
                      child: buildImageStack(
                          context,
                          sizedBoxHeight,
                          'http://cdn.shopify.com/s/files/1/0590/7431/4421/products/8720286974025_m_en_hd_1_9f38296b-4d0b-4435-81ad-0ed615bad3ac.jpg?v=1673842086',
                          'Table 5'),
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
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 30),
              child: Image.asset(
                'assets/images/logoBlack.png',
                height: 80,
                width: 80,
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
              // child: ListTile(
              //   title: Text(
              //     username!,
              //     textAlign: TextAlign.center,
              //     style: const TextStyle(
              //         fontWeight: FontWeight.bold,
              //         fontStyle: FontStyle.italic,
              //         fontSize: 15),
              //   ),
              // ),
            ),
            ListTile(
              //leading: Icon(Icons.new_page),
              title: const Text('View In AR'),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => const ARViewWidget()),
                // );
              },
            ),
            ListTile(
              //leading: Icon(Icons.new_page),
              title: const Text('Products: Sofa Sets'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Products_Sofa_Sets(),
                    ));
              },
            ),
            ListTile(
              //leading: Icon(Icons.new_page),
              title: const Text('Products: Tables'),
              onTap: () {},
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
                // FirebaseAuth.instance.signOut();
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) =>
                //       const SplashSignOut(key: Key('splash'))),
                // );
              },
            ),
          ],
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