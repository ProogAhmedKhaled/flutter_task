import 'package:flutter/material.dart';
import 'package:flutter_task/view/contact/contact_form_one.dart';
import 'package:flutter_task/view/contact/success_send_screen.dart';
import 'package:flutter_task/view/shared/styles/colors.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              itemTile(title: "دليل النوادي"),
              itemTile(title: "دليل الملاعب"),
              itemTile(title: "من نحن"),
              itemTile(title: "الأنظمة واللوائح"),
              itemTile(title: "اللجان"),
              itemTile(
                  title: "اتصل بنا",
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ContactFormOne(),
                    ));
                  }),
              itemTile(title: "شارك التطبيق"),
              itemTile(title: "الاشتراك بالنشرة الاخبارية"),
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
          title,
          style: TextStyle(fontSize: 20, color: bgBlend),
        ),
      ),
    );
