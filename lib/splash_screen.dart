// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cudo_ride_app/auth/onboarding.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    nextPage();
  }

  Future<void> nextPage() async {
    Future.delayed(Duration(seconds: 10), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Onboarding(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 380,
            ),
            Center(child: Image(image: AssetImage('assets/logo.png')))
          ],
        ),
      ),
    );
  }
}
