class UserBean {
  late int _page;
  late int _perPage;
  late int _total;
  late int _totalPages;
  late List<UserData> _data;
  late Support _support;

  UserBean(
    this._page,
    this._perPage,
    this._total,
    this._totalPages,
    this._data,
    this._support,
  );

  int get page => _page;

  set page(int page) => _page = page;

  int get perPage => _perPage;

  set perPage(int perPage) => _perPage = perPage;

  int get total => _total;

  set total(int total) => _total = total;

  int get totalPages => _totalPages;

  set totalPages(int totalPages) => _totalPages = totalPages;

  List<UserData> get data => _data;

  set data(List<UserData> data) => _data = data;

  Support get support => _support;

  set support(Support support) => _support = support;

  UserBean.fromJson(Map<String, dynamic> json) {
    _page = json['page'];
    _perPage = json['per_page'];
    _total = json['total'];
    _totalPages = json['total_pages'];
    if (json['data'] != null) {
      _data = <UserData>[];
      json['data'].forEach((v) {
        _data.add(new UserData.fromJson(v));
      });
    }
    _support = (json['support'] != null
        ? new Support.fromJson(json['support'])
        : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this._page;
    data['per_page'] = this._perPage;
    data['total'] = this._total;
    data['total_pages'] = this._totalPages;
    if (this._data != null) {
      data['data'] = this._data.map((v) => v.toJson()).toList();
    }
    if (this._support != null) {
      data['support'] = this._support.toJson();
    }
    return data;
  }
}

class UserData {
  late int _id;
  late String _email;
  late String _firstName;
  late String _lastName;
  late String _avatar;

  UserData(
      this._id, this._email, this._firstName, this._lastName, this._avatar);

  int get id => _id;

  set id(int id) => _id = id;

  String get email => _email;

  set email(String email) => _email = email;

  String get firstName => _firstName;

  set firstName(String firstName) => _firstName = firstName;

  String get lastName => _lastName;

  set lastName(String lastName) => _lastName = lastName;

  String get avatar => _avatar;

  set avatar(String avatar) => _avatar = avatar;

  UserData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _email = json['email'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['email'] = this._email;
    data['first_name'] = this._firstName;
    data['last_name'] = this._lastName;
    data['avatar'] = this._avatar;
    return data;
  }
}

class Support {
  late String _url;
  late String _text;

  Support(
    this._url,
    this._text,
  );

  String get url => _url;

  set url(String url) => _url = url;

  String get text => _text;

  set text(String text) => _text = text;

  Support.fromJson(Map<String, dynamic> json) {
    _url = json['url'];
    _text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this._url;
    data['text'] = this._text;
    return data;
  }
}
