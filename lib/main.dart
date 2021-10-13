import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_task/view/layout/bottom_nav_bar_container.dart';
import 'package:flutter_task/view/shared/styles/colors.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Jannat",
        primarySwatch: Colors.blue,
      ),

      home:Directionality(
        textDirection: TextDirection.rtl,
        child:  AnnotatedRegion(
            value: SystemUiOverlayStyle(
              statusBarColor: bgPrimary
            ),

            child: NavBarContainer()),
      ),
    );
  }
}
