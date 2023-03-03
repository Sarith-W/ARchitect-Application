import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  SignInState createState() => SignInState();
}

class SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
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
                      color: Colors.black,
                    ),
                    height: 220,
                    width: double.infinity,
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 110),
                      height: 210,
                      width: 210,
                      child: Image.asset(
                        'assets/images/logo.png',
                        height: 100,
                        width: 100,
                      ))
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 40),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      )
                    ]),
                height: 450,
                width: 370,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      height: 30,
                      width: 300,
                      child: Align(
                        child: Text(
                          "Welcome Back",
                          style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w900,
                              fontSize: 25,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 30, left: 30, right: 30),
                      height: 50,
                      width: 300,
                      child: TextField(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          hintText: "abc@gmail.com",
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
                            color: Color.fromARGB(255, 101, 101, 101),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 30, left: 30, right: 30),
                      height: 50,
                      width: 300,
                      child: TextField(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          hintText: "xxxxxxx",
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black87, width: 2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          border: OutlineInputBorder(
                              // borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(15)),
                          labelText: "Enter the password",
                          labelStyle: const TextStyle(
                            color: Color.fromARGB(255, 101, 101, 101),
                          ),
                        ),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 150),
                        height: 35,
                        width: 300,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.black87,
                          ),
                          onPressed: () {},
                          child: const Text("Forgot Password?"),
                        )),
                    Container(
                        margin: const EdgeInsets.only(top: 15),
                        height: 50,
                        width: 300,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.black87,
                            foregroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            textStyle: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                          onPressed: () {},
                          child: const Text("Sign In"),
                        )),
                    Container(
                        margin: const EdgeInsets.only(top: 20),
                        height: 50,
                        width: 300,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.black12,
                            foregroundColor: Colors.black,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            textStyle: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                          onPressed: () {},
                          child: const Text("Continue as Guest"),
                        )),
                    Container(
                        margin: const EdgeInsets.only(top: 20),
                        height: 35,
                        width: 300,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.black87,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Don't have an account? Register"),
                        )),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
