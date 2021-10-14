import 'package:flutter/material.dart';
import 'package:flutter_task/model/cach_helper/cach_helper.dart';
import 'package:flutter_task/view/shared/component.dart';
import 'package:get/get.dart';

class Statics extends StatelessWidget {
  const Statics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: CachHelper.get(key: 'lang') == 'ar'
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: Scaffold(
          appBar: defaultAppBar(),
        ));
  }
}
