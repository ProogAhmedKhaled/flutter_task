import 'package:flutter/material.dart';
import 'package:flutter_task/view/shared/styles/colors.dart';

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
      margin:const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        validator: validate,
        cursorColor: bgSecondary,
        keyboardType: inputType,
        maxLines: lines,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          hintText: hint,
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
            text,
            style: TextStyle(
              fontSize: textSize,
              fontWeight: textWeight,
              color: textColor
            ),
          )),
    );
