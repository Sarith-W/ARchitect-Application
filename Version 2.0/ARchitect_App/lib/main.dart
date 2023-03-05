import 'package:architect_app/home.dart';
import 'package:architect_app/signInPage.dart';
import 'package:architect_app/signUpPage.dart';
import 'package:architect_app/welcomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future main() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    runApp(
        MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WelcomePage()
        )
    );
}



