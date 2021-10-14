class ContactBean {
  late String _firstName;
  late String _lastName;
  late String _email;
  late String _mobile;
  late String _messageTitle;
  late String _messageType;
  late String _messageDesc;
  late String _attachment;


 ContactBean(); // MessageBean(
 //      this._firstName,
 //      this._lastName,
 //      this._email,
 //      this._mobile,
 //      this._messageTitle,
 //      this._messageType,
 //      this._messageDesc,
 //      this._attachment);

  String get firstName => _firstName;
  set firstName(String firstName) => _firstName = firstName;
  String get lastName => _lastName;
  set lastName(String lastName) => _lastName = lastName;
  String get email => _email;
  set email(String email) => _email = email;
  String get mobile => _mobile;
  set mobile(String mobile) => _mobile = mobile;
  String get messageTitle => _messageTitle;
  set messageTitle(String messageTitle) => _messageTitle = messageTitle;
  String get messageType => _messageType;
  set messageType(String messageType) => _messageType = messageType;
  String get messageDesc => _messageDesc;
  set messageDesc(String messageDesc) => _messageDesc = messageDesc;
  String get attachment => _attachment;
  set attachment(String attachment) => _attachment = attachment;

 ContactBean.fromJson(Map<String, dynamic> json) {
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _email = json['email'];
    _mobile = json['mobile'];
    _messageTitle = json['messageTitle'];
    _messageType = json['messageType'];
    _messageDesc = json['messageDesc'];
    _attachment = json['attachment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this._firstName;
    data['lastName'] = this._lastName;
    data['email'] = this._email;
    data['mobile'] = this._mobile;
    data['messageTitle'] = this._messageTitle;
    data['messageType'] = this._messageType;
    data['messageDesc'] = this._messageDesc;
    // data['attachment'] = this._attachment;
    return data;
  }
}