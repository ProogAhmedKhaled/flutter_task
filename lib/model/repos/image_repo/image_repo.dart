
import 'package:flutter_task/model/beans/image_bean/image_bean.dart';
import 'package:flutter_task/model/dio_helper/dio_helper.dart';
import 'package:flutter_task/model/dio_helper/end_points.dart';

class ImageRepo {

  static Future<List<dynamic>> getAllImage() async {
    var images;
    await DioHelper.getData(endpoint: EndPoint.IMAGES,params: {}).then((value) {
      images = value;
      print("Image Repo Response : " + value.data.toString());
    }).catchError((imageError) {
      print("Get Image Repo Error" + imageError.toString());
    });
    return images.data.map((item) => ImageBean.fromJson(item)).toList();
  }
}
