import 'package:flutter_task/model/beans/news_bean/news_bean.dart';
import 'package:flutter_task/model/dio_helper/dio_helper.dart';
import 'package:flutter_task/model/dio_helper/end_points.dart';

class NewsRepo {
  static Future<List<dynamic>> getAllNews(
      {required Map<String, dynamic> params}) async {
    var news;
    await DioHelper.getData(endpoint: EndPoint.NEWS, params: params)
        .then((value) {
      news = value;
      print("News Response : " + value.data.toString());
    }).catchError((newsError) {
      print("Get News Repo Error" + newsError.toString());
    });
    return news.data.map((item) => NewsBean.fromJson(item)).toList();
  }
}
