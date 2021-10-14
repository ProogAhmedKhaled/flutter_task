import 'package:dio/dio.dart';

import 'end_points.dart';

class DioHelper {
  static late Dio dio;

  static void init() {
    dio = Dio(BaseOptions(
      baseUrl: EndPoint.BASE_URL,
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData(
      {required String endpoint, required Map<String, dynamic> params}) async {
    dio.options.queryParameters = params;
    return await dio.get(endpoint);
  }

  static Future<Response> postData(
      {required String url,
      Map<String, dynamic>? query,
      required Map<String, dynamic> data}) async {
    dio.options.headers = {
      "Content-Type": "multipart/form-data",
    };
    var post = await dio.post(url, data: data);
    return post;
  }
}
