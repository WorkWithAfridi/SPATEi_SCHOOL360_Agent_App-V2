/// status : "success"
/// result_info : [{"name":"Annual Exam","gpa_with_optional":"4.3300","c_alpha_gpa_with_optional":"A","total_obtain_mark":"223.0000","total_credit":"300","class_position":"2"}]
/// message : "Result Found Successfully Send"

class DataModelForResult {
  DataModelForResult({
      String? status, 
      List<Result_info>? resultInfo, 
      String? message,}){
    _status = status;
    _resultInfo = resultInfo;
    _message = message;
}

  DataModelForResult.fromJson(dynamic json) {
    _status = json['status'];
    if (json['result_info'] != null) {
      _resultInfo = [];
      json['result_info'].forEach((v) {
        _resultInfo?.add(Result_info.fromJson(v));
      });
    }
    _message = json['message'];
  }
  String? _status;
  List<Result_info>? _resultInfo;
  String? _message;

  String? get status => _status;
  List<Result_info>? get resultInfo => _resultInfo;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_resultInfo != null) {
      map['result_info'] = _resultInfo?.map((v) => v.toJson()).toList();
    }
    map['message'] = _message;
    return map;
  }

}

/// name : "Annual Exam"
/// gpa_with_optional : "4.3300"
/// c_alpha_gpa_with_optional : "A"
/// total_obtain_mark : "223.0000"
/// total_credit : "300"
/// class_position : "2"

class Result_info {
  Result_info({
      String? name, 
      String? gpaWithOptional, 
      String? cAlphaGpaWithOptional, 
      String? totalObtainMark, 
      String? totalCredit, 
      String? classPosition,}){
    _name = name;
    _gpaWithOptional = gpaWithOptional;
    _cAlphaGpaWithOptional = cAlphaGpaWithOptional;
    _totalObtainMark = totalObtainMark;
    _totalCredit = totalCredit;
    _classPosition = classPosition;
}

  Result_info.fromJson(dynamic json) {
    _name = json['name'];
    _gpaWithOptional = json['gpa_with_optional'];
    _cAlphaGpaWithOptional = json['c_alpha_gpa_with_optional'];
    _totalObtainMark = json['total_obtain_mark'];
    _totalCredit = json['total_credit'];
    _classPosition = json['class_position'];
  }
  String? _name;
  String? _gpaWithOptional;
  String? _cAlphaGpaWithOptional;
  String? _totalObtainMark;
  String? _totalCredit;
  String? _classPosition;

  String? get name => _name;
  String? get gpaWithOptional => _gpaWithOptional;
  String? get cAlphaGpaWithOptional => _cAlphaGpaWithOptional;
  String? get totalObtainMark => _totalObtainMark;
  String? get totalCredit => _totalCredit;
  String? get classPosition => _classPosition;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['gpa_with_optional'] = _gpaWithOptional;
    map['c_alpha_gpa_with_optional'] = _cAlphaGpaWithOptional;
    map['total_obtain_mark'] = _totalObtainMark;
    map['total_credit'] = _totalCredit;
    map['class_position'] = _classPosition;
    return map;
  }

}