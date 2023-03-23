import 'package:architect_app/TopBar/app_bar.dart';
import 'package:architect_app/TopBar/side_drawer.dart';
import 'package:architect_app/customize_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_button.dart';

class ProductsSofaSets extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  ProductsSofaSets({Key? key}) : super(key: key);

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
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Customize(
                                    "assets/images/sofa1Img.jpg"),
                              ),
                            );
                          },
                          child: buildImageStack(context, sizedBoxHeight,
                              'assets/images/sofa1Img.jpg', 'Sofa 1'),
                        ),
                        const SizedBox(height: 15.0),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Customize(
                                    "assets/images/sofa2Img.jpg"),
                              ),
                            );
                          },
                          child: buildImageStack(context, sizedBoxHeight,
                              'assets/images/sofa2Img.jpg', 'Sofa 2'),
                        ),
                        const SizedBox(height: 15.0),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Customize(
                                    "assets/images/sofa3Img.jpg"),
                              ),
                            );
                          },
                          child: buildImageStack(context, sizedBoxHeight,
                              'assets/images/sofa3Img.jpg', 'Sofa 3'),
                        ),
                        const SizedBox(height: 15.0),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Customize(
                                    "assets/images/sofa4Img.jpg"),
                              ),
                            );
                          },
                          child: buildImageStack(context, sizedBoxHeight,
                              'assets/images/sofa4Img.jpg', 'Sofa 4'),
                        ),
                        const SizedBox(height: 15.0),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Customize(
                                    "assets/images/sofa5Img.jpg"),
                              ),
                            );
                          },
                          child: buildImageStack(context, sizedBoxHeight,
                              'assets/images/sofa5Img.jpg', 'Sofa 5'),
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
          child: Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                imagePath,
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
