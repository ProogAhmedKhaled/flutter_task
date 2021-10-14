import 'package:dio/dio.dart';
import 'package:flutter_task/model/dio_helper/dio_helper.dart';
import 'package:flutter_task/model/dio_helper/end_points.dart';

class ContactRepo {
  static Future<Response> postMessage(Map<String, dynamic> dataMap) async {
    var response;
    await DioHelper.postData(url: EndPoint.CONTACT, data: dataMap)
        .then((value) async {
      response = value;
      // print("Done Contact Repo " + value.data.toString());
    }).catchError((error) {
      print("Error in Contact Repo  post " + error.toString());
    });
    // print("Response" + response.toString());
    return response;
  }
}
