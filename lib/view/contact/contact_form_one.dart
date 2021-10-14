import 'package:flutter/material.dart';
import 'package:flutter_task/model/beans/contact_bean/contact_bean.dart';
import 'package:flutter_task/model/cach_helper/cach_helper.dart';
import 'package:flutter_task/view/contact/contact_form_two.dart';
import 'package:flutter_task/view/shared/styles/colors.dart';
import 'package:get/get.dart';

import '../shared/component.dart';

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
  final RegExp phoneRegExp = RegExp('(05)[0-9]{10}');
  final RegExp emailRegExp = RegExp("^[a-zA-Z0-9.a-zA-Z0-9.!#\$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  // for egyption must start with 01 and third number may be 0 or 1 or 2 or 5 and 8 number last

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: CachHelper.get(key: 'lang') =='ar' ? TextDirection.rtl : TextDirection.ltr,
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
                  "contactus".tr,
                  style: TextStyle(fontSize: 22, color: bgPrimary),
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      defaultTextField(
                          controller: firstName,
                          hint: "firstName",
                          validate: (value) {
                            if (value!.isEmpty) {
                              return "fNameError".tr;
                            }
                            if (value.length < 3) {
                              return "messageError".tr;
                            }
                          }),
                      defaultTextField(
                          controller: secondName,
                          hint: "secondName",
                          validate: (value) {
                            if (value!.isEmpty) {
                              return "sNameError".tr;
                            }
                            if (value.length < 3) {
                              return "messageError".tr;
                            }
                          }),
                      defaultTextField(
                          controller: email,
                          hint: "email",
                          inputType: TextInputType.emailAddress,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return "emailError".tr;
                            }
                            if (!emailRegExp.hasMatch(value)) {
                              return "emailValidError".tr;
                            }
                          }),
                      defaultTextField(
                          controller: phone,
                          hint: "phone",
                          inputType: TextInputType.phone,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return "phoneError".tr;
                            }
                            if (!phoneRegExp.hasMatch(value)) {
                              return "phoneValidError".tr;
                            }
                          }),
                      SizedBox(
                        height: 30,
                      ),
                      defaultButton(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            ContactBean contactBean = ContactBean();
                            contactBean.firstName = firstName.text;
                            contactBean.lastName = secondName.text;
                            contactBean.email = email.text;
                            contactBean.mobile = phone.text;
                            Get.to(ContactFormTwo(
                              contactBean: contactBean,
                            ));
                          }
                        },
                        text: "next",
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
