import 'package:architect_app/objectsView.dart';
import 'package:architect_app/signInPage.dart';
import 'package:architect_app/signUpPage.dart';
import 'package:architect_app/splashScreenForLogin.dart';
import 'package:architect_app/welcomePage.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home.dart';
import 'main.dart';

class ForgotPasswordPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ForgotPasswordPage({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
  }

  Future resetPassword(BuildContext context) async{
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
          email: emailController.text.trim()
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignInPage(key: const Key('signInPage'))),
      );
      Widget okButton = TextButton(
        child: const Text("OK"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );
      AlertDialog alert = AlertDialog(
        title: const Text("Note"),
        content: Text("Password Reset Email Sent"),
        actions: [
          okButton,
        ],
      );
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }on FirebaseAuthException catch(e){
      print(e);
      Widget okButton = TextButton(
        child: const Text("OK"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );
      AlertDialog alert = AlertDialog(
        title: const Text("Note"),
        content: Text(e.message!),
        actions: [
          okButton,
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: 950,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/forgotPasswordBgImage.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WelcomePage()),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(top: 60, left: 115),
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 200,
                  width: 200,
                ),
              )
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
                      offset: const Offset(0,3),
                    )
                  ]
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    height: 30,
                    width: 300,
                    child: const Align(
                      child: Text(
                        "Reset the Password",
                        style: TextStyle(
                          fontFamily: 'Itim',
                          fontSize: 25,

                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 40),
                    height: 70,
                    width: 300,
                    child: Form(
                      key: formKey,
                      child: TextFormField(
                        controller: emailController,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          hintText: "Ex: abc@gmail.com",
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black87, width: 2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          border: OutlineInputBorder(
                            // borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          labelText: "Enter your email",
                          labelStyle: const TextStyle(
                            color: Color(0xFF4E342E),
                          ),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (email) =>
                        email != null && !EmailValidator.validate(email)
                            ? 'Enter a valid email' : null,
                      ),
                    )
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    height: 50,
                    width: 300,
                    child: FloatingActionButton.extended(
                      label: const Text('Reset Password'),
                      backgroundColor: Colors.black,
                      icon: const Icon(
                        Icons.email,
                        size: 24.0,
                      ),
                      onPressed: () {
                        resetPassword(context);
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    height: 50,
                    width: 300,
                    child: FloatingActionButton.extended(
                      label: const Text('Go Back'),
                      backgroundColor: Colors.red,
                      icon: const Icon(
                        Icons.turn_left_rounded,
                        size: 24.0,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              )
          )
        ],
      ),
    );
  }
}