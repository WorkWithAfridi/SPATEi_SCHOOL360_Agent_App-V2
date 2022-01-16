/// status : "success"
/// data : {"total_working_days":15,"total_present_days":2,"total_holidays":2,"total_leave_days":0,"total_absent_days":11,"attendance_info":[{"date":"2021-12-01","login_time":"-","logout_time":"-","expected_login_time":"-","expected_logout_time":"-","is_late":"-","late_min":"-","status":"Absent"},{"date":"2021-12-02","login_time":"-","logout_time":"-","expected_login_time":"-","expected_logout_time":"-","is_late":"-","late_min":"-","status":"Absent"},{"date":"2021-12-03","login_time":"-","logout_time":"-","expected_login_time":"-","expected_logout_time":"-","is_late":"-","late_min":"-","status":"Friday"},{"date":"2021-12-04","login_time":"-","logout_time":"-","expected_login_time":"-","expected_logout_time":"-","is_late":"-","late_min":"-","status":"Absent"},{"date":"2021-12-05","login_time":"-","logout_time":"-","expected_login_time":"-","expected_logout_time":"-","is_late":"-","late_min":"-","status":"Absent"},{"date":"2021-12-06","login_time":"-","logout_time":"-","expected_login_time":"-","expected_logout_time":"-","is_late":"-","late_min":"-","status":"Absent"},{"date":"2021-12-07","login_time":"-","logout_time":"-","expected_login_time":"-","expected_logout_time":"-","is_late":"-","late_min":"-","status":"Absent"},{"date":"2021-12-08","login_time":"-","logout_time":"-","expected_login_time":"-","expected_logout_time":"-","is_late":"-","late_min":"-","status":"Absent"},{"date":"2021-12-09","login_time":"-","logout_time":"-","expected_login_time":"-","expected_logout_time":"-","is_late":"-","late_min":"-","status":"Absent"},{"date":"2021-12-10","login_time":"-","logout_time":"-","expected_login_time":"-","expected_logout_time":"-","is_late":"-","late_min":"-","status":"Friday"},{"date":"2021-12-11","login_time":"-","logout_time":"-","expected_login_time":"-","expected_logout_time":"-","is_late":"-","late_min":"-","status":"Absent"},{"date":"2021-12-12","login_time":"-","logout_time":"-","expected_login_time":"-","expected_logout_time":"-","is_late":"-","late_min":"-","status":"Absent"},{"date":"2021-12-13","login_time":"-","logout_time":"-","expected_login_time":"-","expected_logout_time":"-","is_late":"-","late_min":"-","status":"Absent"},{"date":"2021-12-14","login_time":"09:10:47 AM","logout_time":"12:59:25 PM","expected_login_time":"09:00:00 AM","expected_logout_time":"01:00:00 PM","is_late":"1","late_min":"00:00:47","status":"Present"},{"date":"2021-12-15","login_time":"09:10:00 AM","logout_time":"01:59:25 PM","expected_login_time":"09:00:00 AM","expected_logout_time":"01:00:00 PM","is_late":"0","late_min":"-","status":"Present"}],"name":"Sazzadur Rahman","student_code":"211001","roll_no":"1","class_name":"Class-1","shift_name":"1st Shift","section_name":"A","group_name":"NOT APPLICABLE","category_name":"General"}
/// message : "Successfully Data Found"

class DataModelForLogInLogOutTimings {
  DataModelForLogInLogOutTimings({
      String? status, 
      Data? data, 
      String? message,}){
    _status = status;
    _data = data;
    _message = message;
}

  DataModelForLogInLogOutTimings.fromJson(dynamic json) {
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

/// total_working_days : 15
/// total_present_days : 2
/// total_holidays : 2
/// total_leave_days : 0
/// total_absent_days : 11
/// attendance_info : [{"date":"2021-12-15","login_time":"09:10:00 AM","logout_time":"01:59:25 PM","expected_login_time":"09:00:00 AM","expected_logout_time":"01:00:00 PM","is_late":"0","late_min":"-","status":"Present"},{"date":"2021-12-02","login_time":"-","logout_time":"-","expected_login_time":"-","expected_logout_time":"-","is_late":"-","late_min":"-","status":"Absent"},{"date":"2021-12-03","login_time":"-","logout_time":"-","expected_login_time":"-","expected_logout_time":"-","is_late":"-","late_min":"-","status":"Friday"},{"date":"2021-12-04","login_time":"-","logout_time":"-","expected_login_time":"-","expected_logout_time":"-","is_late":"-","late_min":"-","status":"Absent"},{"date":"2021-12-05","login_time":"-","logout_time":"-","expected_login_time":"-","expected_logout_time":"-","is_late":"-","late_min":"-","status":"Absent"},{"date":"2021-12-06","login_time":"-","logout_time":"-","expected_login_time":"-","expected_logout_time":"-","is_late":"-","late_min":"-","status":"Absent"},{"date":"2021-12-07","login_time":"-","logout_time":"-","expected_login_time":"-","expected_logout_time":"-","is_late":"-","late_min":"-","status":"Absent"},{"date":"2021-12-08","login_time":"-","logout_time":"-","expected_login_time":"-","expected_logout_time":"-","is_late":"-","late_min":"-","status":"Absent"},{"date":"2021-12-09","login_time":"-","logout_time":"-","expected_login_time":"-","expected_logout_time":"-","is_late":"-","late_min":"-","status":"Absent"},{"date":"2021-12-10","login_time":"-","logout_time":"-","expected_login_time":"-","expected_logout_time":"-","is_late":"-","late_min":"-","status":"Friday"},{"date":"2021-12-11","login_time":"-","logout_time":"-","expected_login_time":"-","expected_logout_time":"-","is_late":"-","late_min":"-","status":"Absent"},{"date":"2021-12-12","login_time":"-","logout_time":"-","expected_login_time":"-","expected_logout_time":"-","is_late":"-","late_min":"-","status":"Absent"},{"date":"2021-12-13","login_time":"-","logout_time":"-","expected_login_time":"-","expected_logout_time":"-","is_late":"-","late_min":"-","status":"Absent"},{"date":"2021-12-14","login_time":"09:10:47 AM","logout_time":"12:59:25 PM","expected_login_time":"09:00:00 AM","expected_logout_time":"01:00:00 PM","is_late":"1","late_min":"00:00:47","status":"Present"},{"date":"2021-12-15","login_time":"09:10:00 AM","logout_time":"01:59:25 PM","expected_login_time":"09:00:00 AM","expected_logout_time":"01:00:00 PM","is_late":"0","late_min":"-","status":"Present"}]
/// name : "Sazzadur Rahman"
/// student_code : "211001"
/// roll_no : "1"
/// class_name : "Class-1"
/// shift_name : "1st Shift"
/// section_name : "A"
/// group_name : "NOT APPLICABLE"
/// category_name : "General"

class Data {
  Data({
    int? totalWorkingDays,
    int? totalPresentDays,
    int? totalHolidays,
    int? totalLeaveDays,
    int? totalAbsentDays,
    List<Attendance_info>? attendanceInfo,
    String? name,
    String? studentCode,
    String? rollNo,
    String? className,
    String? shiftName,
    String? sectionName,
    String? groupName,
    String? categoryName,}){
    _totalWorkingDays = totalWorkingDays;
    _totalPresentDays = totalPresentDays;
    _totalHolidays = totalHolidays;
    _totalLeaveDays = totalLeaveDays;
    _totalAbsentDays = totalAbsentDays;
    _attendanceInfo = attendanceInfo;
    _name = name;
    _studentCode = studentCode;
    _rollNo = rollNo;
    _className = className;
    _shiftName = shiftName;
    _sectionName = sectionName;
    _groupName = groupName;
    _categoryName = categoryName;
  }

  Data.fromJson(dynamic json) {
    _totalWorkingDays = json['total_working_days'];
    _totalPresentDays = json['total_present_days'];
    _totalHolidays = json['total_holidays'];
    _totalLeaveDays = json['total_leave_days'];
    _totalAbsentDays = json['total_absent_days'];
    if (json['attendance_info'] != null) {
      _attendanceInfo = [];
      json['attendance_info'].forEach((v) {
        _attendanceInfo?.add(Attendance_info.fromJson(v));
      });
    }
    _name = json['name'];
    _studentCode = json['student_code'];
    _rollNo = json['roll_no'];
    _className = json['class_name'];
    _shiftName = json['shift_name'];
    _sectionName = json['section_name'];
    _groupName = json['group_name'];
    _categoryName = json['category_name'];
  }
  int? _totalWorkingDays;
  int? _totalPresentDays;
  int? _totalHolidays;
  int? _totalLeaveDays;
  int? _totalAbsentDays;
  List<Attendance_info>? _attendanceInfo;
  String? _name;
  String? _studentCode;
  String? _rollNo;
  String? _className;
  String? _shiftName;
  String? _sectionName;
  String? _groupName;
  String? _categoryName;

  int? get totalWorkingDays => _totalWorkingDays;
  int? get totalPresentDays => _totalPresentDays;
  int? get totalHolidays => _totalHolidays;
  int? get totalLeaveDays => _totalLeaveDays;
  int? get totalAbsentDays => _totalAbsentDays;
  List<Attendance_info>? get attendanceInfo => _attendanceInfo;
  String? get name => _name;
  String? get studentCode => _studentCode;
  String? get rollNo => _rollNo;
  String? get className => _className;
  String? get shiftName => _shiftName;
  String? get sectionName => _sectionName;
  String? get groupName => _groupName;
  String? get categoryName => _categoryName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total_working_days'] = _totalWorkingDays;
    map['total_present_days'] = _totalPresentDays;
    map['total_holidays'] = _totalHolidays;
    map['total_leave_days'] = _totalLeaveDays;
    map['total_absent_days'] = _totalAbsentDays;
    if (_attendanceInfo != null) {
      map['attendance_info'] = _attendanceInfo?.map((v) => v.toJson()).toList();
    }
    map['name'] = _name;
    map['student_code'] = _studentCode;
    map['roll_no'] = _rollNo;
    map['class_name'] = _className;
    map['shift_name'] = _shiftName;
    map['section_name'] = _sectionName;
    map['group_name'] = _groupName;
    map['category_name'] = _categoryName;
    return map;
  }

}

/// date : "2021-12-15"
/// login_time : "09:10:00 AM"
/// logout_time : "01:59:25 PM"
/// expected_login_time : "09:00:00 AM"
/// expected_logout_time : "01:00:00 PM"
/// is_late : "0"
/// late_min : "-"
/// status : "Present"

class Attendance_info {
  Attendance_info({
    String? date,
    String? loginTime,
    String? logoutTime,
    String? expectedLoginTime,
    String? expectedLogoutTime,
    String? isLate,
    String? lateMin,
    String? status,}){
    _date = date;
    _loginTime = loginTime;
    _logoutTime = logoutTime;
    _expectedLoginTime = expectedLoginTime;
    _expectedLogoutTime = expectedLogoutTime;
    _isLate = isLate;
    _lateMin = lateMin;
    _status = status;
  }

  Attendance_info.fromJson(dynamic json) {
    _date = json['date'];
    _loginTime = json['login_time'];
    _logoutTime = json['logout_time'];
    _expectedLoginTime = json['expected_login_time'];
    _expectedLogoutTime = json['expected_logout_time'];
    _isLate = json['is_late'];
    _lateMin = json['late_min'];
    _status = json['status'];
  }
  String? _date;
  String? _loginTime;
  String? _logoutTime;
  String? _expectedLoginTime;
  String? _expectedLogoutTime;
  String? _isLate;
  String? _lateMin;
  String? _status;

  String? get date => _date;
  String? get loginTime => _loginTime;
  String? get logoutTime => _logoutTime;
  String? get expectedLoginTime => _expectedLoginTime;
  String? get expectedLogoutTime => _expectedLogoutTime;
  String? get isLate => _isLate;
  String? get lateMin => _lateMin;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = _date;
    map['login_time'] = _loginTime;
    map['logout_time'] = _logoutTime;
    map['expected_login_time'] = _expectedLoginTime;
    map['expected_logout_time'] = _expectedLogoutTime;
    map['is_late'] = _isLate;
    map['late_min'] = _lateMin;
    map['status'] = _status;
    return map;
  }

}