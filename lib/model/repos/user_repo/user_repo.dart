import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_task/model/beans/user_bean/user_bean.dart';
import 'package:flutter_task/model/dio_helper/end_points.dart';

class UserRepo {
  static Dio dio = new Dio(BaseOptions(
    baseUrl: EndPoint.USER_BASE_URL,
    receiveDataWhenStatusError: true,
  ));

  static Future<UserBean> getUserResponse(
      {required Map<String, dynamic> params}) async {
    late UserBean userBean;
    await _getData(endpoint: EndPoint.USERS, params: params).then((value) {
      if (value.statusCode == 200) {
        userBean = UserBean.fromJson(value.data);
      }
    }).catchError((UserError) {
      print("Get User Repo Error" + UserError.toString());
    });

    return userBean;
  }

  static Future<Response> _getData(
      {required String endpoint, required Map<String, dynamic> params}) async {
    dio.options.queryParameters = params;
    return await dio.get(endpoint);
  }
}
