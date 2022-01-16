/// status : "success"
/// data : {"total_working_days":"12","total_present_days":"0","total_holidays":0,"total_leave_days":"0","total_absent_days":12}
/// message : "Successfully Data Found"

class DataModelForDashboardAttendance {
  DataModelForDashboardAttendance({
      String? status, 
      Data? data, 
      String? message,}){
    _status = status;
    _data = data;
    _message = message;
}

  DataModelForDashboardAttendance.fromJson(dynamic json) {
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _message = json['message'];
  }
  String? _status;
  Data? _data;
  String? _message;

  String? get status => _status;
  Data? get data => _data;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['message'] = _message;
    return map;
  }

}

/// total_working_days : "12"
/// total_present_days : "0"
/// total_holidays : 0
/// total_leave_days : "0"
/// total_absent_days : 12

class Data {
  Data({
      String? totalWorkingDays, 
      String? totalPresentDays, 
      int? totalHolidays, 
      String? totalLeaveDays, 
      int? totalAbsentDays,}){
    _totalWorkingDays = totalWorkingDays;
    _totalPresentDays = totalPresentDays;
    _totalHolidays = totalHolidays;
    _totalLeaveDays = totalLeaveDays;
    _totalAbsentDays = totalAbsentDays;
}

  Data.fromJson(dynamic json) {
    _totalWorkingDays = json['total_working_days'];
    _totalPresentDays = json['total_present_days'];
    _totalHolidays = json['total_holidays'];
    _totalLeaveDays = json['total_leave_days'];
    _totalAbsentDays = json['total_absent_days'];
  }
  String? _totalWorkingDays;
  String? _totalPresentDays;
  int? _totalHolidays;
  String? _totalLeaveDays;
  int? _totalAbsentDays;

  String? get totalWorkingDays => _totalWorkingDays;
  String? get totalPresentDays => _totalPresentDays;
  int? get totalHolidays => _totalHolidays;
  String? get totalLeaveDays => _totalLeaveDays;
  int? get totalAbsentDays => _totalAbsentDays;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total_working_days'] = _totalWorkingDays;
    map['total_present_days'] = _totalPresentDays;
    map['total_holidays'] = _totalHolidays;
    map['total_leave_days'] = _totalLeaveDays;
    map['total_absent_days'] = _totalAbsentDays;
    return map;
  }

}