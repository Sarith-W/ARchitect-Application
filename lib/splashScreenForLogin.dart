import 'dart:async';
import 'package:flutter/material.dart';
import 'home.dart';

class SplashLogin extends StatefulWidget {
  const SplashLogin({super.key});

  @override
  State<SplashLogin> createState() => _SplashLoginState();
}

class _SplashLoginState extends State<SplashLogin> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 2),
          () => Navigator.pushReplacement(
        context,
            MaterialPageRoute(builder: (context) => Home(key: const Key('home'))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        return false;
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [CircularProgressIndicator(), Text('Welcome to ARchitect')],
          ),
        ),
      ),
    );
  }
}
