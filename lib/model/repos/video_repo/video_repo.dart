import 'package:flutter_task/model/beans/video_bean/video_bean.dart';
import 'package:flutter_task/model/dio_helper/dio_helper.dart';
import 'package:flutter_task/model/dio_helper/end_points.dart';

class VideoRepo {
  static Future<List<dynamic>> getAllVideos() async {
    var videos;
    await DioHelper.getData(endpoint: EndPoint.VIDEOS, params: {})
        .then((value) {
      videos = value;
      print("Videos Repo Response : " + value.data.toString());
    }).catchError((VideosError) {
      print("Get Videos Repo Error" + VideosError.toString());
    });
    return videos.data.map((item) => VideoBean.fromJson(item)).toList();
  }
}
