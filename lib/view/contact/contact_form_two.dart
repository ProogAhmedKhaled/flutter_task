import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/model/beans/contact_bean/contact_bean.dart';
import 'package:flutter_task/model/cach_helper/cach_helper.dart';
import 'package:flutter_task/view/contact/success_send_screen.dart';
import 'package:flutter_task/view/shared/styles/colors.dart';
import 'package:flutter_task/view_model/setting_cubit/contact_cubit_logic.dart';
import 'package:flutter_task/view_model/setting_cubit/contact_state.dart';
import 'package:get/get.dart';

import '../shared/component.dart';

class ContactFormTwo extends StatefulWidget {
  final ContactBean contactBean;

  const ContactFormTwo({Key? key, required this.contactBean}) : super(key: key);

  @override
  _ContactFormTwoState createState() => _ContactFormTwoState();
}

class _ContactFormTwoState extends State<ContactFormTwo> {
  TextEditingController messageTitle = TextEditingController();
  TextEditingController messageContent = TextEditingController();

  var formKey = GlobalKey<FormState>();

  String hintText = "messageType";
  String messageType = "";
  List<String> options = [" الاول", "الثاني", "الثالث", "الرابع"];

  @override
  Widget build(BuildContext context) {
    ContactBean contactBean = widget.contactBean;
    return BlocProvider(
      create: (context) => ContactCubit(),
      child: BlocConsumer<ContactCubit, ContactState>(
        listener: (context, state) {},
        builder: (context, state) {
          ContactCubit cubit = ContactCubit.get(context);
          return Directionality(
            textDirection: CachHelper.get(key: 'lang') == 'ar'
                ? TextDirection.rtl
                : TextDirection.ltr,
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
                        "contactus".tr,
                        style: TextStyle(fontSize: 22, color: bgPrimary),
                      ),
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            defaultTextField(
                                controller: messageTitle,
                                hint: "messageTitle",
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return "messageTitleError".tr;
                                  }
                                  if (value.length < 3) {
                                    return "messageError".tr;
                                  }
                                }),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(color: bgPrimary),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: DropdownButtonFormField<String>(
                                validator: (value) {
                                  if (value!.isEmpty) return "messageType".tr;
                                },
                                decoration: InputDecoration.collapsed(
                                    hintText: hintText.tr),
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
                                hint: "messageContent",
                                lines: 5,
                                inputType: TextInputType.emailAddress,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return "messageContentError".tr;
                                  }
                                  if (value.length < 10) {
                                    return "messageContentValidationError".tr;
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
                                          "attachment".tr,
                                          style: TextStyle(
                                              color: bgBlend2, fontSize: 16),
                                        )
                                      : Text(
                                          "attachmentDone".tr,
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 16),
                                        ),
                                  IconButton(
                                      onPressed: () {
                                        cubit.uploadImage().then((value) {
                                          cubit.convertImageToBase64();
                                        });
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
                            contactBean.messageTitle = messageTitle.text;
                            contactBean.messageType = messageType;
                            contactBean.messageDesc = messageContent.text;
                             contactBean.attachment = cubit.imageBase64;
                            print(contactBean.toJson());
                            cubit.postMessage(contactBean).then((value) {
                              print("done sending" + value.toString());
                              Get.offAll(SuccessMessage(responseId: value,));
                            });
                          }
                        },
                        text: "send",
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
