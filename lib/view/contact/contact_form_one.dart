import 'package:flutter/material.dart';
import 'package:flutter_task/view/contact/contact_form_two.dart';
import 'package:flutter_task/view/shared/styles/colors.dart';
import 'package:get/get.dart';

import 'component.dart';

class ContactFormOne extends StatefulWidget {
  const ContactFormOne({Key? key}) : super(key: key);

  @override
  _ContactFormOneState createState() => _ContactFormOneState();
}

class _ContactFormOneState extends State<ContactFormOne> {
  TextEditingController firstName = TextEditingController();
  TextEditingController secondName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  final RegExp phoneRegExp = RegExp('(01)[0125][0-9]{8}');

  // for egyption must start with 01 and third number may be 0 or 1 or 2 or 5 and 8 number last

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(80.0), // here the desired height
            child: defaultAppBar()),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "تواصل معنا",
                  style: TextStyle(fontSize: 22, color: bgPrimary),
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      defaultTextField(
                          controller: firstName,
                          hint: "الاسم الأول",
                          validate: (value) {
                            if (value!.isEmpty) {
                              return "من فضلك ادخل الاسم الأول";
                            }
                          }),
                      defaultTextField(
                          controller: secondName,
                          hint: "الاسم الثاني",
                          validate: (value) {
                            if (value!.isEmpty) {
                              return "من فضلك ادخل الاسم الثاني";
                            }
                          }),
                      defaultTextField(
                          controller: email,
                          hint: "البريد الالكتروني",
                          inputType: TextInputType.emailAddress,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return "من فضلك ادخل البريد الالكتروني";
                            }
                          }),
                      defaultTextField(
                          controller: phone,
                          hint: "رقم الجوال",
                          inputType: TextInputType.phone,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return "من فضلك ادخل رقم الجوال";
                            }
                            if (!phoneRegExp.hasMatch(value)) {
                              return "من فضلك ادخل رقم جوال صحيح";
                            }
                          }),
                      SizedBox(
                        height: 30,
                      ),
                      defaultButton(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            Get.to(ContactFormTwo());
                          }
                        },
                        text: "التالي",
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
