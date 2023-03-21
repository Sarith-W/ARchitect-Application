import 'dart:async';
import 'package:architect_app/welcome_page.dart';
import 'package:flutter/material.dart';

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
      const Duration(seconds: 2),
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
            children: const [
              CircularProgressIndicator(),
              Text('Signing Out...')
            ],
          ),
        ),
      ),
    );
  }
}
