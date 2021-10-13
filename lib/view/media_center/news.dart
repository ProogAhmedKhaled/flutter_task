import 'package:flutter/material.dart';
import 'package:flutter_task/view/shared/styles/colors.dart';

class NewsContainer extends StatelessWidget {
  const NewsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Container(
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .4,
                height: MediaQuery.of(context).size.width * .3,
                alignment: Alignment.bottomRight,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage("assets/images/img3@2x.png"),
                        fit: BoxFit.fitWidth)),
                child: Image.asset(
                  "assets/images/stack.png",
                  width: 50,
                ),
              ),
              SizedBox(width: 8,),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customText(title: "الدوري الرياضي", fontColor: bgSecondary),
                    customText(
                        title:
                            "من الملاعب السعودية إلى منصة التتويج بكأس العالم",
                        fontColor: bgPrimary,
                        weight: FontWeight.bold,
                        maxLines: 2),
                    customText(title: "12 يوليو 2018", fontColor: bgSecondary ,fontSize: 11),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Text customText(
        {required String title,
        int maxLines = 1,
        double fontSize = 12,
        FontWeight weight = FontWeight.normal,
        Color fontColor = bgDark}) =>
    Text(
      title,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: weight,
        color: fontColor,
      ),
    );
