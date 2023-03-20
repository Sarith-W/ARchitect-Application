import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'TopBar/app_bar.dart';
import 'TopBar/side_drawer.dart';

class Home extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Home({Key? key}) : super(key: key);

  Widget buildWelcomeCard() {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Hello.',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 25.0,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Expanded(
                      child: Marquee(
                        text:
                            "Welcome to ARchitect! Our app is designed to help you with your renovation problems, and our user-friendly interface and helpful resources are here to support you every step of the way. Explore all the features and let us know how we can make your experience even better. Thanks for choosing our app, and happy renovating!",
                        style: const TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 13.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                        scrollAxis: Axis.vertical,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        blankSpace: 20.0,
                        velocity: 20.0,
                        pauseAfterRound: const Duration(seconds: 1),
                        startPadding: 10.0,
                        accelerationDuration: const Duration(seconds: 1),
                        accelerationCurve: Curves.linear,
                        decelerationDuration: const Duration(milliseconds: 500),
                        decelerationCurve: Curves.easeOut,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/textWidgetImg.gif'),
                  fit: BoxFit.fitWidth,
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
                border: null,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCarouselItem(String title, String assetName) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          image: DecorationImage(
            image: AssetImage('assets/images/$assetName'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 50.0,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: _scaffoldKey,
          appBar: const AppBarWidget(),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  buildWelcomeCard(),
                  const SizedBox(height: 20.0),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 300,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.2,
                      viewportFraction: 0.8,
                      aspectRatio: 16 / 9,
                    ),
                    items: [
                      buildCarouselItem('TABLES', 'carouselOption1.jpg'),
                      buildCarouselItem('SOFAS', 'carouselOption2.webp'),
                      buildCarouselItem('AR', 'carouselOption3.PNG'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          drawer: const SideDrawerWidget(),
        ),
      );
}
