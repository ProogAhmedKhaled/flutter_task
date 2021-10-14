
class ImageBean {
  late String _createdAt;
  late String _image;
  late String _id;

  ImageBean(
      this._createdAt ,
      this._image ,
      this._id );


  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;
  String get image => _image;
  set image(String image) => _image = image;
  String get id => _id;
  set id(String id) => _id = id;

  ImageBean.fromJson(Map<String, dynamic> json) {
    _createdAt = json['createdAt'];
    _image = json['image'];
    _id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this._createdAt;
    data['image'] = this._image;
    data['id'] = this._id;
    return data;
  }
}