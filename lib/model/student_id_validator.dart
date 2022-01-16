/// status : "success"
/// student_info : {"id":"3","name":"Ashek Mahmud","name_bangla":"Ashek Mahmud","student_code":"211003","date_of_birth":"06-23-1998","gender":"M","father_name":"Abc Parvez","mother_name":"Mrs. Shahina","guardian_mobile":"01711040530"}

class StudentIdValidator {
  StudentIdValidator({
      String? status, 
      Student_info? studentInfo,}){
    _status = status;
    _studentInfo = studentInfo;
}

  StudentIdValidator.fromJson(dynamic json) {
    _status = json['status'];
    _studentInfo = json['student_info'] != null ? Student_info.fromJson(json['student_info']) : null;
  }
  String? _status;
  Student_info? _studentInfo;

  String? get status => _status;
  Student_info? get studentInfo => _studentInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_studentInfo != null) {
      map['student_info'] = _studentInfo?.toJson();
    }
    return map;
  }

}

/// id : "3"
/// name : "Ashek Mahmud"
/// name_bangla : "Ashek Mahmud"
/// student_code : "211003"
/// date_of_birth : "06-23-1998"
/// gender : "M"
/// father_name : "Abc Parvez"
/// mother_name : "Mrs. Shahina"
/// guardian_mobile : "01711040530"

class Student_info {
  Student_info({
      String? id,
      String? name,
      String? nameBangla,
      String? studentCode,
      String? dateOfBirth,
      String? gender,
      String? fatherName,
      String? motherName,
      String? guardianMobile,}){
    _id = id;
    _name = name;
    _nameBangla = nameBangla;
    _studentCode = studentCode;
    _dateOfBirth = dateOfBirth;
    _gender = gender;
    _fatherName = fatherName;
    _motherName = motherName;
    _guardianMobile = guardianMobile;
}

  Student_info.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _nameBangla = json['name_bangla'];
    _studentCode = json['student_code'];
    _dateOfBirth = json['date_of_birth'];
    _gender = json['gender'];
    _fatherName = json['father_name'];
    _motherName = json['mother_name'];
    _guardianMobile = json['guardian_mobile'];
  }
  String? _id;
  String? _name;
  String? _nameBangla;
  String? _studentCode;
  String? _dateOfBirth;
  String? _gender;
  String? _fatherName;
  String? _motherName;
  String? _guardianMobile;

  String? get id => _id;
  String? get name => _name;
  String? get nameBangla => _nameBangla;
  String? get studentCode => _studentCode;
  String? get dateOfBirth => _dateOfBirth;
  String? get gender => _gender;
  String? get fatherName => _fatherName;
  String? get motherName => _motherName;
  String? get guardianMobile => _guardianMobile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['name_bangla'] = _nameBangla;
    map['student_code'] = _studentCode;
    map['date_of_birth'] = _dateOfBirth;
    map['gender'] = _gender;
    map['father_name'] = _fatherName;
    map['mother_name'] = _motherName;
    map['guardian_mobile'] = _guardianMobile;
    return map;
  }

}