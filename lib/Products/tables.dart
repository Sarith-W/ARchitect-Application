import 'package:architect_app/TopBar/app_bar.dart';
import 'package:architect_app/TopBar/side_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'customize_page.dart';
import '../Home/home_button.dart';

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
        body: Stack(
          children: [
            ListView(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25.0,
                    ),
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
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Customize(
                                    "assets/images/table1Img.png"),
                              ),
                            );
                          },
                          child: Stack(
                            children: [
                              buildImageStack(
                                  context, sizedBoxHeight, 'assets/images/table1Img.png', 'Woodie'),
                              Positioned(
                                top: 10,
                                right: 10,
                                child: Image.asset(
                                  'assets/images/360.png',
                                  width: 50,
                                  height: 370,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Customize(
                                    "assets/images/table2Img.png"),
                              ),
                            );
                          },
                          child: Stack(
                            children: [
                              buildImageStack(
                                  context, sizedBoxHeight, 'assets/images/table2Img.png', 'Classic'),
                              Positioned(
                                top: 10,
                                right: 10,
                                child: Image.asset(
                                  'assets/images/360.png',
                                  width: 50,
                                  height: 370,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Customize(
                                    "assets/images/table3Img.png"),
                              ),
                            );
                          },
                          child: Stack(
                            children: [
                              buildImageStack(
                                  context, sizedBoxHeight, 'assets/images/table3Img.png', 'Iron'),
                              Positioned(
                                top: 10,
                                right: 10,
                                child: Image.asset(
                                  'assets/images/360.png',
                                  width: 50,
                                  height: 370,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Customize(
                                    "assets/images/table4Img.png"),
                              ),
                            );
                          },
                          child: Stack(
                            children: [
                              buildImageStack(
                                  context, sizedBoxHeight, 'assets/images/table4Img.png', 'Marble'),
                              Positioned(
                                top: 10,
                                right: 10,
                                child: Image.asset(
                                  'assets/images/360.png',
                                  width: 50,
                                  height: 370,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Customize(
                                    "assets/images/table5Img.png"),
                              ),
                            );
                          },
                          child: Stack(
                            children: [
                              buildImageStack(
                                  context, sizedBoxHeight, 'assets/images/table5Img.png', 'Coffee'),
                              Positioned(
                                top: 10,
                                right: 10,
                                child: Image.asset(
                                  'assets/images/360.png',
                                  width: 50,
                                  height: 370,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const DraggableButton(),
          ],
        ),
        drawer: const SideDrawerWidget(),
      ),
    );
  }

  Widget buildImageStack(BuildContext context, double sizedBoxHeight,
      String imagePath, String text) {
    return Stack(
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          height: sizedBoxHeight,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return const Center(child: Text('Image Not Found'));
                  },
                ),
              ),
            ],
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
