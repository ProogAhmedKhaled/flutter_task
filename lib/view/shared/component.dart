import 'package:flutter/material.dart';
import 'package:flutter_task/view/shared/styles/colors.dart';
import 'package:get/get.dart';

AppBar defaultAppBar() => AppBar(
      title: Image.asset(
        "assets/images/logo.png",
      ),
      centerTitle: true,
      backgroundColor: bgPrimary,
      elevation: 0,
    );

Widget defaultTextField({
  required TextEditingController controller,
  Widget? prefix,
  Widget? suffix,
  String? hint,
  int lines = 1,
  TextInputType? inputType,
  String? Function(String?)? validate,
}) =>
    Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        validator: validate,
        cursorColor: bgSecondary,
        keyboardType: inputType,
        maxLines: lines,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          hintText: hint!.tr,
          hintStyle: TextStyle(color: bgBlend2),
          prefixIcon: prefix,
          suffixIcon: suffix,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: bgPrimary,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: bgSecondary,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.red.shade400,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.red.shade400,
            ),
          ),
        ),
      ),
    );

Widget defaultButton({
  required Function() onTap,
  double height = 55,
  double radTopRight = 10,
  double radBottomRight = 10,
  double radBottomLeft = 10,
  double radTopLeft = 10,
  double? width,
  required String text,
  FontWeight textWeight = FontWeight.normal,
  double textSize = 20,
  Color color = bgPrimary,
  Color textColor = Colors.white,
  Color borderColor = Colors.transparent,
}) =>
    InkWell(
      onTap: onTap,
      child: Container(
          height: height,
          width: width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(radTopRight),
                bottomRight: Radius.circular(radBottomRight),
                topLeft: Radius.circular(radTopLeft),
                bottomLeft: Radius.circular(radBottomLeft)),
          ),
          child: Text(
            text.tr,
            style: TextStyle(
                fontSize: textSize, fontWeight: textWeight, color: textColor),
          )),
    );

Text customText(
        {required String title,
        int maxLines = 1,
        double fontSize = 12,
        FontWeight weight = FontWeight.normal,
        Color fontColor = bgDark,
        TextAlign textAlign = TextAlign.start
        }) =>
    Text(
      title.tr,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: weight,
        color: fontColor,
      ),
    );

Widget buildImageContainer(
        {required double width,
        required double height,
        required String imgUrl}) =>
    Container(
      width: width,
      height: height,
      alignment: Alignment.bottomRight,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: imgUrl.contains("http")
            ? DecorationImage(image: NetworkImage(imgUrl,),fit: BoxFit.fill)
            : DecorationImage(image: AssetImage(imgUrl),fit: BoxFit.fill),
      ),
      child: Image.asset(
        "assets/images/stack.png",
        width: 50,
      ),
    );
