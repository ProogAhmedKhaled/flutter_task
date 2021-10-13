import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/main.dart';
import 'package:flutter_task/view/shared/styles/colors.dart';
import 'package:get/get.dart';

class SucessMessage extends StatelessWidget {
  const SucessMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(80.0), // here the desired height
            child: AppBar(
              title: Image.asset(
                "assets/images/logo.png",
              ),
              leading: IconButton(
                onPressed: () {
                  Get.offAll(MyApp());
                }, icon:Icon(Icons.close), iconSize: 30,),
              centerTitle: true,
              backgroundColor: bgPrimary,
              elevation: 0,
            )),
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              defaultText(title: "تم ارسال الطلب بنجاح", size: 22),
              SizedBox(
                height: 17,
              ),
              defaultText(title: "رقم الطلب : 12345", size: 17, color: bgDark),
              SizedBox(
                height: 23,
              ),
              Image.asset("assets/icons/done.png")
            ],
          ),
        ),
      ),
    );
  }
}

Widget defaultText(
    {required String title, double size = 16, Color color = bgPrimary}) =>
    Text(
      title,
      style: TextStyle(fontSize: size, color: color),
    );
