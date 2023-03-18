import 'package:architect_app/TopBar/app_bar.dart';
import 'package:architect_app/TopBar/side_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsTables extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  ProductsTables({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizedBoxHeight = (MediaQuery.of(context).size.height - 200) / 3.1;

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: const AppBarWidget(),
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
        drawer: const SideDrawerWidget(),
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
