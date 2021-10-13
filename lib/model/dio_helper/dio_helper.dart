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
      {required String endpoint, Map<String, dynamic>? customHeaders}) async {
    dio.options.headers = customHeaders;
    return await dio.get(endpoint);
  }

}
