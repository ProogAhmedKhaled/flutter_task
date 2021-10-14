import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/model/cach_helper/cach_helper.dart';
import 'package:flutter_task/view/contact/contact_form_one.dart';
import 'package:flutter_task/view/shared/styles/colors.dart';
import 'package:get/get.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String language = CachHelper.get(key: "lang");
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/icons/logo.png",
        ),
        backgroundColor: bgPrimary,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
        color: bgPrimary,
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              itemTile(title: "club_directory"),
              itemTile(title: "stadium_guide"),
              itemTile(title: "about"),
              itemTile(title: "regulation"),
              itemTile(title: "committees"),
              itemTile(
                  title: "contact",
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ContactFormOne(),
                    ));
                  }),
              itemTile(title: "share"),
              itemTile(title: "share_news"),
              Container(
                padding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: ExpandablePanel(
                  header: languageItem(
                      title: language == "ar"
                          ? "arabic"
                          : "english"),
                  collapsed: Text(""),
                  expanded: Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                            onTap: () {
                              //cubit.changeLanguage(Language.ARABIC);
                              CachHelper.save(key: "lang", value: "ar");
                              Get.updateLocale(Locale("ar"));
                            },
                            child: languageItem(title: "arabic")),
                        InkWell(
                            onTap: () {
                              //cubit.changeLanguage(Language.ENGLISH);
                              CachHelper.save(key: "lang", value: "en");
                              Get.updateLocale(Locale("en"));
                            },
                            child: languageItem(title: "english")),
                      ],
                    ),
                  ),
                  theme: ExpandableThemeData(
                    iconColor: bgBlend,
                    expandIcon: Icons.add,
                    collapseIcon: Icons.remove,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget itemTile({required String title, Function()? onTap}) => InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Text(
          title.tr,
          style: TextStyle(fontSize: 20, color: bgBlend),
        ),
      ),
    );
Widget languageItem({required String title}) => Row(
  children: [
    Text(title.tr,style: TextStyle(fontSize: 20, color: bgBlend)),
  ],
);