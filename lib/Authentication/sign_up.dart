// ignore_for_file: use_build_context_synchronously

import 'package:architect_app/Authentication/sign_in.dart';
import 'package:architect_app/Authentication/verify_email.dart';
import 'package:architect_app/SplashScreens/splash_screen_login.dart';
import 'package:architect_app/Home/welcome_page.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final logger = Logger(
    filter: null,
    printer: PrettyPrinter(),
    output: null,
  );

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  Future signUp(BuildContext context) async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => VerifyEmailPage()
        ),
      );
    } on FirebaseAuthException catch (e) {
      logger.e(e.toString());
      AlertDialog alert = AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        title: const Center(
          child: Text(
            "Oops...",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        content: Text(e.message!),
        actions: [
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                elevation: 2,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
              child: const Text(
                "OK",
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      );
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
  }

  Future signUpWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser =
          await GoogleSignIn(scopes: <String>["email"]).signIn();

      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      FirebaseAuth.instance.signInWithCredential(credential);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const SplashLogin(key: Key('splash'))),
      );
    } on FirebaseAuthException catch (e) {
      logger.e(e.toString());
      AlertDialog alert = AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        title: const Center(
          child: Text(
            "Oops...",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        content: Text(e.message!),
        actions: [
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                elevation: 2,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
              child: const Text(
                "OK",
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      );
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF4E342E),
          toolbarHeight: 10,
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(250),
                          bottomRight: Radius.circular(250),
                        ),
                        color: Color(0xFF4E342E),
                      ),
                      height: 220,
                      width: double.infinity,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const WelcomePage()),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 105),
                          child: Image.asset(
                            'assets/images/logo.png',
                            height: 200,
                            width: 200,
                          ),
                        ))
                  ],
                ),
                Container(
                    margin: const EdgeInsets.only(top: 40),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white70,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          )
                        ]),
                    height: 475,
                    width: 370,
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 15),
                            height: 30,
                            width: 300,
                            child: const Align(
                              child: Text(
                                "Let's get started",
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
                            margin: const EdgeInsets.only(
                                top: 40, left: 30, right: 30),
                            height: 75,
                            width: 300,
                            child: TextFormField(
                              controller: emailController,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                hintText: "Ex: abc@gmail.com",
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black87, width: 2),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                labelText: "Enter your email",
                                labelStyle: const TextStyle(
                                  color: Color(0xFF4E342E),
                                ),
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (email) => email != null &&
                                      !EmailValidator.validate(email)
                                  ? 'Enter a valid email'
                                  : null,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                top: 20, left: 30, right: 30),
                            height: 75,
                            width: 300,
                            child: TextFormField(
                              controller: passwordController,
                              cursorColor: Colors.black,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: "xxxxxxx",
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black87, width: 2),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                border: OutlineInputBorder(
                                    // borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(20)),
                                labelText: "Enter a new password",
                                labelStyle: const TextStyle(
                                  color: Color(0xFF4E342E),
                                ),
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) =>
                                  value != null && value.length < 6
                                      ? "Enter a minimum of 6 characters"
                                      : null,
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.only(top: 25),
                              height: 45,
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
                                  signUp(context);
                                },
                                child: const Text("Sign Up"),
                              )),
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            height: 45,
                            width: 300,
                            child: SignInButton(
                              Buttons.Google,
                              text: "Sign Up with Google",
                              onPressed: () {
                                signUpWithGoogle(context);
                              },
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.only(top: 20),
                              height: 35,
                              width: 300,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.black87,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const SignInPage(
                                            key: Key('signInPage'))),
                                  );
                                },
                                child: const Text(
                                    "Already have an account? Sign in"),
                              )),
                        ],
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
