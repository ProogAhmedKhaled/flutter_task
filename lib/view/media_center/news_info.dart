import 'package:flutter/material.dart';
import 'package:flutter_task/model/beans/news_bean/news_bean.dart';
import 'package:flutter_task/model/cach_helper/cach_helper.dart';
import 'package:flutter_task/view/shared/component.dart';
import 'package:flutter_task/view/shared/styles/colors.dart';
import 'package:get/get.dart';
class NewsInfo extends StatelessWidget {
  const NewsInfo({Key? key, required this.newsBean}) : super(key: key);

  final NewsBean newsBean;

  @override
  Widget build(BuildContext context) {
   ;
    bool isArabic = CachHelper.get(key: 'lang') == 'ar';
    return Directionality(
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(220.0),
            // here the desired height
            child: AppBar(
              actions: [IconButton(onPressed: () {}, icon: Icon(Icons.share))],
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(newsBean.image), fit: BoxFit.fill)),
              ),
              centerTitle: true,
              elevation: 0,
            )),
        body: Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customText(
                    title: isArabic ? newsBean.titleAr : newsBean.titleEn,
                    fontColor: bgPrimary,
                    weight: FontWeight.bold,
                    fontSize: 18,
                    maxLines: 2),
                customText(
                    title: "sports_league".tr,
                    fontColor: bgSecondary,
                    fontSize: 16,
                    maxLines: 2),
                customText(
                    title: newsBean.createdAt,
                    fontColor: bgSecondary,
                    fontSize: 11,
                    maxLines: 2),
                SizedBox(height: 10,),
                Text(isArabic ? newsBean.contentAr : newsBean.contentEn),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
