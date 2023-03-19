import 'package:architect_app/TopBar/app_bar.dart';
import 'package:architect_app/TopBar/side_drawer.dart';
import 'package:architect_app/productsSofaSets.dart';
import 'package:architect_app/productsTables.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'ar_view.dart';

class Home extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Home({Key? key}) : super(key: key);

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
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25.0,
              ),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CarouselSlider(
                      items: [
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: NetworkImage("https://www.apple.com/v/augmented-reality/c/images/meta/og__cjuf93da35zm_large.png?202302021323"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: NetworkImage("https://devabit.com/uploads/ar-furniture-apps-by-devabit.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: NetworkImage("https://www.cnet.com/a/img/resize/72bb2d5d82dfecb7e89e38c4a7982f6fa6f615df/hub/2020/08/25/2cc71f28-dd02-41f4-ab0e-59a54efa2f1d/amazon-rooom-decorator-hi-res.jpg?auto=webp&fit=crop&height=675&width=1200"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: NetworkImage("https://www.furnituretoday.com/wp-content/uploads/2021/02/856x475_featured.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                      options: CarouselOptions(
                        height: 180.0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 0.8,
                      ),
                    ),
                    // Container(
                    //   height: 150,
                    //   child: buildImageStack(
                    //       context,
                    //       sizedBoxHeight,
                    //       'https://i.pinimg.com/originals/0d/17/af/0d17af5da1ccbe2b01bdf146f6b2c3b1.gif',
                    //       ''),
                    // ),
                    const SizedBox(height: 10.0),
                    const Text(
                      "Our Products",
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
                              builder: (context) => ProductsSofaSets(),
                            ));
                      },
                      child: buildImageStack(
                          context,
                          sizedBoxHeight,
                          'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                          'Sofa'),
                    ),
                    const SizedBox(height: 15.0),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductsTables(),
                            ));
                      },
                      child: buildImageStack(
                          context,
                          sizedBoxHeight,
                          'http://cdn.shopify.com/s/files/1/0590/7431/4421/products/8720286974025_m_en_hd_1_9f38296b-4d0b-4435-81ad-0ed615bad3ac.jpg?v=1673842086',
                          'Table'),
                    ),
                    const SizedBox(height: 15.0),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ARViewWidget()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shadowColor: const Color.fromARGB(255, 120, 112, 112),
                          elevation: 2,
                          disabledForegroundColor:
                              Colors.black.withOpacity(0.38),
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                          ),
                        ),
                        child: Text(
                          "View in AR",
                          style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          drawer: const SideDrawerWidget()),
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
