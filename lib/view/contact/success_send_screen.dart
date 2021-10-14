import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/model/cach_helper/cach_helper.dart';
import 'package:flutter_task/view/layout/bottom_nav_bar_container.dart';
import 'package:flutter_task/view/shared/component.dart';
import 'package:flutter_task/view/shared/styles/colors.dart';
import 'package:get/get.dart';

class SuccessMessage extends StatelessWidget {
  const SuccessMessage({Key? key, required this.responseId}) : super(key: key);

  final responseId;

  @override
  Widget build(BuildContext context) {
    print(responseId.toString());
    return Directionality(
      textDirection: CachHelper.get(key: 'lang') == 'ar'
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(80.0), // here the desired height
            child: AppBar(
              title: Image.asset(
                "assets/images/logo.png",
              ),
              leading: IconButton(
                onPressed: () {
                  Get.offAll(NavBarContainer());
                },
                icon: Icon(Icons.close),
                iconSize: 30,
              ),
              centerTitle: true,
              backgroundColor: bgPrimary,
              elevation: 0,
            )),
        body: Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              customText(title: "sendMessage", fontSize: 22),
              SizedBox(
                height: 17,
              ),
              customText(
                  title: "orderNumber", fontSize: 17, fontColor: bgPrimary),
              customText(
                  title: "e01857d3-c738-4a39-8825-34548ca96323",
                  fontSize: 17,
                  fontColor: bgDark,
                  maxLines: 2,
                  textAlign: TextAlign.center),
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
