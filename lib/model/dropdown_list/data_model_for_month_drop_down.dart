/// status : "success"
/// months : [{"month_no":1,"month_name":"January"},{"month_no":2,"month_name":"February"},{"month_no":3,"month_name":"March"},{"month_no":4,"month_name":"April"},{"month_no":5,"month_name":"May"},{"month_no":6,"month_name":"June"},{"month_no":7,"month_name":"July"},{"month_no":8,"month_name":"August"},{"month_no":9,"month_name":"September"},{"month_no":10,"month_name":"October"},{"month_no":11,"month_name":"November"},{"month_no":12,"month_name":"December"}]

class DataModelForMonthDropDown {
  DataModelForMonthDropDown({
      String? status, 
      List<Months>? months,}){
    _status = status;
    _months = months;
}

  DataModelForMonthDropDown.fromJson(dynamic json) {
    _status = json['status'];
    if (json['months'] != null) {
      _months = [];
      json['months'].forEach((v) {
        _months?.add(Months.fromJson(v));
      });
    }
  }
  String? _status;
  List<Months>? _months;

  String? get status => _status;
  List<Months>? get months => _months;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_months != null) {
      map['months'] = _months?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// month_no : 1
/// month_name : "January"

class Months {
  Months({
      int? monthNo, 
      String? monthName,}){
    _monthNo = monthNo;
    _monthName = monthName;
}

  Months.fromJson(dynamic json) {
    _monthNo = json['month_no'];
    _monthName = json['month_name'];
  }
  int? _monthNo;
  String? _monthName;

  int? get monthNo => _monthNo;
  String? get monthName => _monthName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['month_no'] = _monthNo;
    map['month_name'] = _monthName;
    return map;
  }

}