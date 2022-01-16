/// status : "success"
/// message : "Successfully Data Send"
/// period_data : [{"id":"FM","name":"From Machine (Login & Logout)"}]

class DataModelForCourseDropDown {
  DataModelForCourseDropDown({
      String? status, 
      String? message, 
      List<Period_data>? periodData,}){
    _status = status;
    _message = message;
    _periodData = periodData;
}

  DataModelForCourseDropDown.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['period_data'] != null) {
      _periodData = [];
      json['period_data'].forEach((v) {
        _periodData?.add(Period_data.fromJson(v));
      });
    }
  }
  String? _status;
  String? _message;
  List<Period_data>? _periodData;

  String? get status => _status;
  String? get message => _message;
  List<Period_data>? get periodData => _periodData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_periodData != null) {
      map['period_data'] = _periodData?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "FM"
/// name : "From Machine (Login & Logout)"

class Period_data {
  Period_data({
      String? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  Period_data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  String? _id;
  String? _name;

  String? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}