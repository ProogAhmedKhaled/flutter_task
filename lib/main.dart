import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/model/cach_helper/cach_helper.dart';
import 'package:flutter_task/model/dio_helper/dio_helper.dart';
import 'package:flutter_task/view/layout/bottom_nav_bar_container.dart';
import 'package:flutter_task/view/splach/splach_screen.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'view_model/utils/languages/language_manager.dart';
import 'view_model/utils/observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CachHelper.init();
  DioHelper.init();
  await initializeDateFormatting("ar", null);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String lang = 'ar';

    if (CachHelper.get(key: "lang") == null) {
      CachHelper.save(key: "lang", value: "ar");
    } else {
      lang = CachHelper.get(key: 'lang');
    }

    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Jannat",
        primarySwatch: Colors.blue,
      ),
      translations: LanguageTranslator(),
      locale: Locale(lang),
      fallbackLocale: Locale('ar'),
      home: AnnotatedRegion(
          value: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          child: SplachScreen()),
    );
  }
}
