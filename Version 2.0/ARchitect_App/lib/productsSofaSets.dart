import 'package:architect_app/TopBar/app_bar.dart';
import 'package:architect_app/TopBar/side_drawer.dart';
import 'package:architect_app/customizePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Customize("assets/images/sofa1Img.jpg"),
                            ),
                          );
                        },
                        child: buildImageStack(
                            context,
                            sizedBoxHeight,
                            'https://github.com/Sarith-W/ARchitect-3D-Objects/blob/main/images/sofa1Img.jpg?raw=true',
                            'Sofa 1'),
                      ),
                      const SizedBox(height: 15.0),
                      GestureDetector(
                        onTap: () {Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Customize("assets/images/sofa2Img.jpg"),
                          ),
                        );},
                        child: buildImageStack(
                            context,
                            sizedBoxHeight,
                            'https://github.com/Sarith-W/ARchitect-3D-Objects/blob/main/images/sofa2Img.jpg?raw=true',
                            'Sofa 2'),
                      ),
                      const SizedBox(height: 15.0),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Customize("assets/images/sofa3Img.jpg"),
                            ),
                          );
                        },
                        child: buildImageStack(
                            context,
                            sizedBoxHeight,
                            'https://github.com/Sarith-W/ARchitect-3D-Objects/blob/main/images/sofa3Img.jpg?raw=true',
                            'Sofa 3'),
                      ),
                      const SizedBox(height: 15.0),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Customize("assets/images/sofa4Img.jpg"),
                            ),
                          );
                        },
                        child: buildImageStack(
                            context,
                            sizedBoxHeight,
                            'https://github.com/Sarith-W/ARchitect-3D-Objects/blob/main/images/sofa4Img.jpg?raw=true',
                            'Sofa 4'),
                      ),
                      const SizedBox(height: 15.0),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Customize("assets/images/sofa5Img.jpg"),
                            ),
                          );
                        },
                        child: buildImageStack(
                            context,
                            sizedBoxHeight,
                            'https://github.com/Sarith-W/ARchitect-3D-Objects/blob/main/images/sofa5Img.jpg?raw=true',
                            'Sofa 5'),
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
