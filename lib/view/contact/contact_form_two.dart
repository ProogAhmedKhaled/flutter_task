import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/view/contact/success_send_screen.dart';
import 'package:flutter_task/view/shared/styles/colors.dart';
import 'package:flutter_task/view_model/setting_cubit/setting_cubit_logic.dart';
import 'package:flutter_task/view_model/setting_cubit/setting_state.dart';
import 'package:get/get.dart';

import 'component.dart';

class ContactFormTwo extends StatefulWidget {
  const ContactFormTwo({Key? key}) : super(key: key);

  @override
  _ContactFormTwoState createState() => _ContactFormTwoState();
}

class _ContactFormTwoState extends State<ContactFormTwo> {
  TextEditingController messageTitle = TextEditingController();
  TextEditingController messageContent = TextEditingController();

  var formKey = GlobalKey<FormState>();

  String hintText = "نوع الرسالة";
  String messageType = "";
  List<String> options = [" الاول", "الثاني", "الثالث", "الرابع"];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingCubit(),
      child: BlocConsumer<SettingCubit, SettingState>(
        listener: (context, state) {},
        builder: (context, state) {
          SettingCubit cubit = SettingCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: PreferredSize(
                  preferredSize: Size.fromHeight(80.0),
                  // here the desired height
                  child: defaultAppBar()),
              body: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
                width: double.infinity,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
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
                                controller: messageTitle,
                                hint: "عنوان الرسالة",
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return "من فضلك ادخل عنوان الرسالة";
                                  }
                                }),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 15),
                              decoration: BoxDecoration(
                                  border: Border.all(color: bgPrimary),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: DropdownButtonFormField<String>(
                                decoration: InputDecoration.collapsed(
                                    hintText: hintText),
                                isExpanded: true,
                                icon: Icon(
                                  Icons.keyboard_arrow_down_sharp,
                                  color: bgPrimary,
                                ),
                                iconSize: 25,
                                isDense: false,
                                items: options.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: new Text(value),
                                  );
                                }).toList(),
                                onChanged: (selected) {
                                  setState(() {
                                    messageType = selected!;
                                  });
                                },
                              ),
                            ),
                            defaultTextField(
                                controller: messageContent,
                                hint: "محتوي الرسالة",
                                lines: 5,
                                inputType: TextInputType.emailAddress,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return "من فضلك ادخل محتوي الرسالة";
                                  }
                                  if (value.length < 20) {
                                    return "من فضل ادخل عدد أحرف لا يقل عن 20 حرف";
                                  }
                                }),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(color: bgPrimary),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  state is! SettingImageSuccessLoadState
                                      ? Text(
                                          "ارفق صورة (اختياري)",
                                          style: TextStyle(
                                              color: bgBlend2, fontSize: 16),
                                        )
                                      : Text(
                                          "تم اختيار الصورة بنجاح",
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 16),
                                        ),
                                  IconButton(
                                      onPressed: () {
                                        cubit.uploadImage();
                                      },
                                      icon: Icon(
                                        Icons.camera_alt_outlined,
                                        color: bgPrimary,
                                      ))
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                      defaultButton(
                        onTap: () {
                          //  some business logic

                          if (messageType.isEmpty) {
                            Get.snackbar(
                              "نوع الرسالة",
                              "من فضلك اختار نوع الرسالة",
                              colorText: bgWhite,
                              snackPosition: SnackPosition.TOP,
                              backgroundColor: Colors.red.shade300,
                            );
                          }
                          if (formKey.currentState!.validate()) {
                            Get.offAll(SucessMessage());
                          }
                        },
                        text: "إرسال",
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
