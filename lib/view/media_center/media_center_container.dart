import 'package:flutter/material.dart';
import 'package:flutter_task/view/media_center/images.dart';
import 'package:flutter_task/view/media_center/news.dart';
import 'package:flutter_task/view/media_center/videos.dart';
import 'package:flutter_task/view/shared/styles/colors.dart';
import 'package:get/get.dart';
class MediaCenter extends StatefulWidget {
  const MediaCenter({Key? key}) : super(key: key);

  @override
  _MediaCenterState createState() => _MediaCenterState();
}

class _MediaCenterState extends State<MediaCenter> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(116.0),
            // here the desired height
            child: AppBar(
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/background.png"),
                        fit: BoxFit.fill)),
              ),
              title: Image.asset(
                "assets/images/logo.png",
              ),
              centerTitle: true,
              backgroundColor: bgPrimary,
              elevation: 0,
              bottom: TabBar(
              indicatorPadding: EdgeInsets.only(bottom: .3),

                indicatorColor: bgWhite,
                tabs: [
                Tab(text: "news".tr,),
                Tab(text: "images".tr,),
                Tab(text: "videos".tr,),
              ],),
            )),
        body: TabBarView(

          children: [
         NewsContainer(),
         ImageContainer(),
         VideoContainer()
        ],),
      ),
    );
  }

}
