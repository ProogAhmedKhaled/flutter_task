import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_task/view/layout/bottom_nav_bar_container.dart';
import 'package:flutter_task/view/shared/styles/colors.dart';

class SplachScreen extends StatefulWidget {
  @override
  _SplachScreen createState() => _SplachScreen();
}

class _SplachScreen extends State<SplachScreen> {
  void initState() {
    super.initState();
    startTimer();
  }
  startTimer() async {
    var duration = Duration(seconds: 6);
    return Timer(duration, route);
  }
  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => NavBarContainer()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        width: double.infinity,
        decoration:
        BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: [
                bgPrimary,
                Colors.white,
                bgSecondary.withOpacity(0.6),
              ],
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
            ),
            Text(
              'GOOLAZO',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: bgPrimary,
                letterSpacing: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// Container(
// decoration:
// BoxDecoration(
// gradient: LinearGradient(
// begin: Alignment.topLeft,
// end: Alignment.bottomLeft,
// colors: [
// green.withOpacity(0.6),
// Colors.white,
// blue.withOpacity(0.6),
// ],
// )),
// child: Center(
// child: Image.asset(
// 'assets/images/logo.png',
// width: MediaQuery.of(context).size.width,
// height: MediaQuery.of(context).size.height * 0.18,
// ),
// ),
// ),
