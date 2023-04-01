import 'dart:async';
import 'package:architect_app/Home/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashSignOut extends StatefulWidget {
  const SplashSignOut({super.key});

  @override
  State<SplashSignOut> createState() => _SplashSignOutState();
}

class _SplashSignOutState extends State<SplashSignOut> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 4),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomePage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.network('https://assets7.lottiefiles.com/packages/lf20_vmlm0zew.json'),
              const Text('Signing Out...')
            ],
          ),
        ),
      ),
    );
  }
}
