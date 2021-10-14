

import 'package:flutter/material.dart';
import 'package:flutter_task/model/cach_helper/cach_helper.dart';
import 'package:intl/intl.dart';

class NewsBean {
  late String _createdAt;
  late String _titleAr;
  late String _titleEn;
  late String _contentAr;
  late String _contentEn;
  late String _image;
  late String _id;

  NewsBean(
    this._createdAt ,
    this._titleAr ,
    this._titleEn,
    this._contentAr ,
    this._contentEn ,
    this._image ,
    this._id );


  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;
  String get titleAr => _titleAr;
  set titleAr(String titleAr) => _titleAr = titleAr;
  String get titleEn => _titleEn;
  set titleEn(String titleEn) => _titleEn = titleEn;
  String get contentAr => _contentAr;
  set contentAr(String contentAr) => _contentAr = contentAr;
  String get contentEn => _contentEn;
  set contentEn(String contentEn) => _contentEn = contentEn;
  String get image => _image;
  set image(String image) => _image = image;
  String get id => _id;
  set id(String id) => _id = id;

  NewsBean.fromJson(Map<String, dynamic> json) {
    _createdAt =formatDate(json['createdAt']);
    _titleAr = json['title_ar'];
    _titleEn = json['title_en'];
    _contentAr = json['content_ar'];
    _contentEn = json['content_en'];
    _image = json['image'];
    _id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this._createdAt;
    data['title_ar'] = this._titleAr;
    data['title_en'] = this._titleEn;
    data['content_ar'] = this._contentAr;
    data['content_en'] = this._contentEn;
    data['image'] = this._image;
    data['id'] = this._id;
    return data;
  }
  String formatDate(String createdAt) {
    String local = CachHelper.get(key: 'lang');
    return  DateFormat.yMMMd(local == null ? 'ar' : local).format(DateTime.parse(createdAt));
  }

}