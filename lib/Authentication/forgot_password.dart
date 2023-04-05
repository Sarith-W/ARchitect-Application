// ignore_for_file: use_build_context_synchronously

import 'package:architect_app/Authentication/sign_in.dart';
import 'package:architect_app/Home/welcome_page.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);

  final logger = Logger(
    filter: null,
    printer: PrettyPrinter(),
    output: null,
  );

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  void dispose() {
    emailController.dispose();
  }

  Future resetPassword(BuildContext context) async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const SignInPage(key: Key('signInPage'))),
      );

      AlertDialog alert = AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        title: const Center(
          child: Text(
            "Note",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        content: const Text("Password Reset Email Sent"),
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WelcomePage()),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(top: 60, left: 115),
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 200,
                  width: 200,
                ),
              )),
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
                              borderSide: const BorderSide(
                                  color: Colors.black87, width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            border: OutlineInputBorder(
                                // borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(20)),
                            labelText: "Enter your email",
                            labelStyle: const TextStyle(
                              color: Color(0xFF4E342E),
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (email) =>
                              email != null && !EmailValidator.validate(email)
                                  ? 'Enter a valid email'
                                  : null,
                        ),
                      )),
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
              ))
        ],
      ),
    );
  }
}
