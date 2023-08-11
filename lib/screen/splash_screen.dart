import 'dart:async';
import 'package:book_app_api/data/source/local/book_pref.dart';
import 'package:book_app_api/screen/home_screen.dart';
import 'package:book_app_api/screen/intro_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final prefs = BookPRef();

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () async {
      var isFirst = await prefs.getBool();
      if (isFirst) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const OnBoard()));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 220,
              height: 220,
              child: Image.asset("assets/images/splash2.png"),
            ),
            const Text(
              "INFINITY",
              style: TextStyle(
                  color: Color(0xff223263),
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
