/// is_success : true
/// message : "Data List Given"
/// data : [{"id":"6","title":"Admission Notice Class Twelve of 2021 ( 31-07-2021 )","title_bn":"২০২১ সনের দ্বাদশ শ্রেণিতে ভর্তির নোটিশ ( ৩১-০৭-২০২১ )","url":"Notice_1637650687_2021-11-23.jpg","date":"2021-11-23","order_no":"4"},{"id":"5","title":"Admission Notice Class Ten of 2021 ( 31-07-2021 )","title_bn":"২০২১ সনের দশম শ্রেণিতে ভর্তির নোটিশ ( ৩১-০৭-২০২১ )","url":"Notice_1637650652_2021-11-23.jpg","date":"2021-11-23","order_no":"3"},{"id":"4","title":"Notice stipend and Industrial Training Allowance ( 18-11-2021 )","title_bn":"বৃত্তি ও ইন্ডাষ্ট্রিয়াল ট্রেনিং ভাতা প্রদানের নোটিশ ( ১৮-১১-২০২১ )","url":"Notice_1637650604_2021-11-23.jpg","date":"2021-11-23","order_no":"2"},{"id":"3","title":"Notice regarding vaccination of Covid-19 vaccine for students of class XI and XII ( 18-11-2021 )","title_bn":"একাদশ ও দ্বাদশ শ্রেণির শিক্ষার্থীদের কোভিড-১৯ টিকা গ্রহন সংক্রান্ত নোটিশ ( ১৮-১১-২০২১ )","url":"Notice_1637650572_2021-11-23.jpg","date":"2021-11-23","order_no":"1"}]

class DataModelForNotice {
  DataModelForNotice({
      bool? isSuccess, 
      String? message, 
      List<Data>? data,}){
    _isSuccess = isSuccess;
    _message = message;
    _data = data;
}

  DataModelForNotice.fromJson(dynamic json) {
    _isSuccess = json['is_success'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _isSuccess;
  String? _message;
  List<Data>? _data;

  bool? get isSuccess => _isSuccess;
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['is_success'] = _isSuccess;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "6"
/// title : "Admission Notice Class Twelve of 2021 ( 31-07-2021 )"
/// title_bn : "২০২১ সনের দ্বাদশ শ্রেণিতে ভর্তির নোটিশ ( ৩১-০৭-২০২১ )"
/// url : "Notice_1637650687_2021-11-23.jpg"
/// date : "2021-11-23"
/// order_no : "4"

class Data {
  Data({
      String? id, 
      String? title, 
      String? titleBn, 
      String? url, 
      String? date, 
      String? orderNo,}){
    _id = id;
    _title = title;
    _titleBn = titleBn;
    _url = url;
    _date = date;
    _orderNo = orderNo;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _titleBn = json['title_bn'];
    _url = json['url'];
    _date = json['date'];
    _orderNo = json['order_no'];
  }
  String? _id;
  String? _title;
  String? _titleBn;
  String? _url;
  String? _date;
  String? _orderNo;

  String? get id => _id;
  String? get title => _title;
  String? get titleBn => _titleBn;
  String? get url => _url;
  String? get date => _date;
  String? get orderNo => _orderNo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['title_bn'] = _titleBn;
    map['url'] = _url;
    map['date'] = _date;
    map['order_no'] = _orderNo;
    return map;
  }

}