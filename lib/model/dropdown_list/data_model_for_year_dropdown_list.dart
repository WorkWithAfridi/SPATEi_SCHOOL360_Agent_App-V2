/// status : "success"
/// message : "Successfully Data Send"
/// year_data : [{"text":"2019","value":"2019","is_selected":0},{"text":2020,"value":2020,"is_selected":0},{"text":2021,"value":2021,"is_selected":1},{"text":2022,"value":2022,"is_selected":0}]

class DataModelForYearDropDown {
  DataModelForYearDropDown({
      String? status, 
      String? message, 
      List<Year_data>? yearData,}){
    _status = status;
    _message = message;
    _yearData = yearData;
}

  DataModelForYearDropDown.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['year_data'] != null) {
      _yearData = [];
      json['year_data'].forEach((v) {
        _yearData?.add(Year_data.fromJson(v));
      });
    }
  }
  String? _status;
  String? _message;
  List<Year_data>? _yearData;

  String? get status => _status;
  String? get message => _message;
  List<Year_data>? get yearData => _yearData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_yearData != null) {
      map['year_data'] = _yearData?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// text : "2019"
/// value : "2019"
/// is_selected : 0

class Year_data {
  Year_data({
      String? text, 
      String? value, 
      int? isSelected,}){
    _text = text;
    _value = value;
    _isSelected = isSelected;
}

  Year_data.fromJson(dynamic json) {
    _text = json['text'].toString();
    _value = json['value'].toString();
    _isSelected = json['is_selected'];
  }
  String? _text;
  String? _value;
  int? _isSelected;

  String? get text => _text;
  String? get value => _value;
  int? get isSelected => _isSelected;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = _text;
    map['value'] = _value;
    map['is_selected'] = _isSelected;
    return map;
  }

}