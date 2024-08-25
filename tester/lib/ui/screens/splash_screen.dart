import 'package:flutter/material.dart';
import 'dart:async';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFDDE6FF), Color(0xFFEFE7F6)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Spacer(flex: 3),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 400,
                height: 300,
                child: Image.asset('assets/bcoder_software.png'),
              ),
            ),
            Spacer(flex: 3),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  SizedBox(height: 5),
                  SizedBox(
                    width: 180,
                    height: 160,
                    child: Image.asset('assets/bcoder_logo.png'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
