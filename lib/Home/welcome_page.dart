import 'package:architect_app/Authentication/sign_in.dart';
import 'package:architect_app/Authentication/sign_up.dart';
import 'package:architect_app/SplashScreens/splash_screen_login.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: 950,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/mainPageImage.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 60, left: 115),
              child: Image.asset(
                'assets/images/logo.png',
                height: 200,
                width: 200,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 300, left: 27),
              height: 360,
              width: 370,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white.withOpacity(0.6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    )
                  ]),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    height: 30,
                    width: 300,
                    child: const Align(
                      child: Text(
                        "Welcome to ARchitect",
                        style: TextStyle(
                          fontFamily: 'Itim',
                          fontSize: 25,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 30),
                      height: 60,
                      width: 300,
                      child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.black87,
                            foregroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            textStyle: const TextStyle(
                              fontFamily: 'Itim',
                              fontSize: 17,
                            )),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const SignInPage(key: Key('signInPage'))),
                          );
                        },
                        child: const Text("Sign In"),
                      )),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    height: 60,
                    width: 300,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.black87,
                          foregroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          textStyle: const TextStyle(
                            fontFamily: 'Itim',
                            fontSize: 17,
                          )),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SignUpPage(key: const Key('signUpPage'))),
                        );
                      },
                      child: const Text("Sign Up"),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    height: 60,
                    width: 300,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        textStyle: const TextStyle(
                          fontFamily: 'Itim',
                          fontSize: 17,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SplashLogin(
                              key: Key('splash'),
                            ),
                          ),
                        );
                      },
                      child: const Text("Continue as Guest"),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
