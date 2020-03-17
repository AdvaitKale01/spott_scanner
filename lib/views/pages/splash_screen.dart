import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime(int seconds) async {
    var _duration = new Duration(seconds: seconds);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/HomeCameraView');
  }

  @override
  void initState() {
    startTime(2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//		backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'images/spott_grad_1.png',
          height: 100,
          width: 200,
        ),
      ),
    );
  }
}
