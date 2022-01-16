/// status : "success"
/// data : [{"id":"2","month":"1","year":"2021","date":"2022-01-10","receipt_no":"164179462705","total_paid_amount":"600.00","class_name":"Class-1","is_online_payment":"1","url":"https://school360.app/200009/osp/getStudentReceipt/2/S"},{"id":"1","month":"1","year":"2021","date":"2022-01-10","receipt_no":"164175359105","total_paid_amount":"3800.00","class_name":"Class-1","is_online_payment":"1","url":"https://school360.app/200009/osp/getStudentReceipt/1/S"}]
/// message : "Successfully Data Found"

class DataModelForPastPayment {
  DataModelForPastPayment({
      String? status, 
      List<Data>? data, 
      String? message,}){
    _status = status;
    _data = data;
    _message = message;
}

  DataModelForPastPayment.fromJson(dynamic json) {
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _message = json['message'];
  }
  String? _status;
  List<Data>? _data;
  String? _message;

  String? get status => _status;
  List<Data>? get data => _data;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['message'] = _message;
    return map;
  }

}

/// id : "2"
/// month : "1"
/// year : "2021"
/// date : "2022-01-10"
/// receipt_no : "164179462705"
/// total_paid_amount : "600.00"
/// class_name : "Class-1"
/// is_online_payment : "1"
/// url : "https://school360.app/200009/osp/getStudentReceipt/2/S"

class Data {
  Data({
      String? id, 
      String? month, 
      String? year, 
      String? date, 
      String? receiptNo, 
      String? totalPaidAmount, 
      String? className, 
      String? isOnlinePayment, 
      String? url,}){
    _id = id;
    _month = month;
    _year = year;
    _date = date;
    _receiptNo = receiptNo;
    _totalPaidAmount = totalPaidAmount;
    _className = className;
    _isOnlinePayment = isOnlinePayment;
    _url = url;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _month = json['month'];
    _year = json['year'];
    _date = json['date'];
    _receiptNo = json['receipt_no'];
    _totalPaidAmount = json['total_paid_amount'];
    _className = json['class_name'];
    _isOnlinePayment = json['is_online_payment'];
    _url = json['url'];
  }
  String? _id;
  String? _month;
  String? _year;
  String? _date;
  String? _receiptNo;
  String? _totalPaidAmount;
  String? _className;
  String? _isOnlinePayment;
  String? _url;

  String? get id => _id;
  String? get month => _month;
  String? get year => _year;
  String? get date => _date;
  String? get receiptNo => _receiptNo;
  String? get totalPaidAmount => _totalPaidAmount;
  String? get className => _className;
  String? get isOnlinePayment => _isOnlinePayment;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['month'] = _month;
    map['year'] = _year;
    map['date'] = _date;
    map['receipt_no'] = _receiptNo;
    map['total_paid_amount'] = _totalPaidAmount;
    map['class_name'] = _className;
    map['is_online_payment'] = _isOnlinePayment;
    map['url'] = _url;
    return map;
  }

}