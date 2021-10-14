import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/model/cach_helper/cach_helper.dart';
import 'package:flutter_task/view/shared/component.dart';
import 'package:flutter_task/view/shared/styles/colors.dart';
import 'package:flutter_task/view_model/news_cubit/news_cubit_logic.dart';
import 'package:flutter_task/view_model/news_cubit/news_state.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: CachHelper.get(key: 'lang') == 'ar'
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: Scaffold(
          appBar: defaultAppBar(),
          body: Container(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildItemHeader(headline: "lastNews"),
                  SizedBox(
                    height: 10,
                  ),
                  buildImageContainer(
                      height: MediaQuery.of(context).size.width * .45,
                      width: double.infinity,
                      imgUrl: "assets/images/img@2x.png"),
                  SizedBox(
                    height: 10,
                  ),
                  customText(title: "sports_league", fontColor: bgSecondary),
                  customText(
                      title: "من الملاعب السعودية إلى منصة التتويج بكأس العالم",
                      fontColor: bgPrimary,
                      fontSize: 14,
                      weight: FontWeight.bold,
                      maxLines: 2),
                  SizedBox(
                    height: 16,
                  ),
                  _buildItemHeader(headline: "nextMatch"),
                  SizedBox(
                    height: 10,
                  ),
                  _buildCalenderMatchItem(),
                  Divider(
                    color: bgSecondary,
                  ),
                  _buildCalenderMatchItem(),
                  Divider(
                    color: bgSecondary,
                  ),
                  _buildCalenderMatchItem(),
                  SizedBox(
                    height: 16,
                  ),
                  _buildItemHeader(headline: "lastTweet"),
                  SizedBox(
                    height: 10,
                  ),
               _buildTweetItem(),
               SizedBox(height: 10,),
               _buildTweetItem(),
                ],
              ),
            ),
          ),
        ));
  }
}

Widget _buildItemHeader({required String headline}) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        customText(title: headline, fontSize: 16, fontColor: bgPrimary),
        customText(title: "more", fontColor: Colors.blue),
      ],
    );

Widget _buildCalenderMatchItem() => Container(
      // padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          Container(
            // color: Colors.blue,
            child: Row(
              children: [
                Image(image: AssetImage("assets/images/club.png")),
                SizedBox(
                  width: 5,
                ),
                customText(title: "الأهلي")
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                children: [
                  customText(title: "22:00"),
                  customText(title: "الخميس 15 يوليو"),
                ],
              ),
            ),
          ),
          Container(
            // color: Colors.blue,
            child: Row(
              children: [
                customText(title: "الأهلي"),
                SizedBox(
                  width: 5,
                ),
                Image(image: AssetImage("assets/images/club.png")),
              ],
            ),
          )
        ],
      ),
    );

Widget _buildTweetItem() => Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: bgBlend.withOpacity(.5),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(
                image: AssetImage("assets/images/logo.png"),
              ),
              SizedBox(
                width: 5,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                customText(
                    title: "sports_league",
                    fontColor: bgPrimary,
                    weight: FontWeight.bold,
                    fontSize: 14),
                customText(title: "account@"),
              ]),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          customText(
              maxLines: 5,
              title:
                  "عندما يريد العالم أن ‪يتكلّم ‬ ، فهو يتحدّث بلغة يونيكود. تسجّل الآن لحضور المؤتمر الدولي العاشر ليونيكود (Unicode Conference)، الذي سيعقد في 10-12 آذار 1997 بمدينة مَايِنْتْس، ألمانيا. ")
        ],
      ),
    );
