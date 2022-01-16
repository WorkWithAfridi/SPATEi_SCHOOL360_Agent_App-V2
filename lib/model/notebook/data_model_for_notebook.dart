/// status : "success"
/// data : {"name":"Sazzadur Rahman","student_code":"211001","roll_no":"1","class_name":"Class-1","shift_name":"1st Shift","section_name":"A","group_name":"NOT APPLICABLE","category_name":"General","date":"2021-12-15","note_book_list":[{"date":"2021-12-15","file_location":"abc","message":"Q.1. Read the chapter Print Culture and The Modern World. Make one word questions and write\r\ntheir answers also. Do the work in the register.\r\nQ.2. Trace the political map of India in 1947 and compare it with the map of India in 2013. Paste\r\nthe map in your civics copy.\r\nQ.3. Why is democracy the most successful form of government in the world. With examples,\r\nhighlight the topic and supplement the same with pictures.\r\nQ.4. Prepare a project on any one of the following topics;","subject_name":"Bangla"},{"date":"2021-12-15","file_location":null,"message":"(i)The boss was invited for a dinner this evening at the home of Mr. Raghunath.\r\nFinally, as the clock struck five, the preparations approached completion; suddenly\r\nan obstacle appeared before Raghunath: What to do with mother? ………………. ","subject_name":"Bangla"},{"date":"2021-12-15","file_location":null,"message":"1. Explain any four advantages of databases.\r\n2. Explain Relational Database Management System.\r\n3. What is the name of the field of a table which uniquely identifies a record?\r\n4. To what length a memo field can store the data?\r\n5. What is the default field size of text data type?\r\n6. What happens when you enter numbers in Text data type field?\r\n7. What do you mean by the term “Data Redundancy” in context of databases? ","subject_name":"English"},{"date":"2021-12-15","file_location":"abc","message":"Q2.’The Diary Of Anne Frank’ is a 1959 film based on Pulitzer prize winning play of\r\nthe same name, which is based on the diary of Anne Frank. This diary is the long\r\nreading text prescribed by CBSE for extensive study. Make sure that you read the\r\nbook as well as watch the movie. ","subject_name":"Math"}]}
/// message : "Successfully Data Found"

class DataModelForNotebook {
  DataModelForNotebook({
      String? status, 
      Data? data, 
      String? message,}){
    _status = status;
    _data = data;
    _message = message;
}

  DataModelForNotebook.fromJson(dynamic json) {
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

/// name : "Sazzadur Rahman"
/// student_code : "211001"
/// roll_no : "1"
/// class_name : "Class-1"
/// shift_name : "1st Shift"
/// section_name : "A"
/// group_name : "NOT APPLICABLE"
/// category_name : "General"
/// date : "2021-12-15"
/// note_book_list : [{"date":"2021-12-15","file_location":"abc","message":"Q.1. Read the chapter Print Culture and The Modern World. Make one word questions and write\r\ntheir answers also. Do the work in the register.\r\nQ.2. Trace the political map of India in 1947 and compare it with the map of India in 2013. Paste\r\nthe map in your civics copy.\r\nQ.3. Why is democracy the most successful form of government in the world. With examples,\r\nhighlight the topic and supplement the same with pictures.\r\nQ.4. Prepare a project on any one of the following topics;","subject_name":"Bangla"},{"date":"2021-12-15","file_location":null,"message":"(i)The boss was invited for a dinner this evening at the home of Mr. Raghunath.\r\nFinally, as the clock struck five, the preparations approached completion; suddenly\r\nan obstacle appeared before Raghunath: What to do with mother? ………………. ","subject_name":"Bangla"},{"date":"2021-12-15","file_location":null,"message":"1. Explain any four advantages of databases.\r\n2. Explain Relational Database Management System.\r\n3. What is the name of the field of a table which uniquely identifies a record?\r\n4. To what length a memo field can store the data?\r\n5. What is the default field size of text data type?\r\n6. What happens when you enter numbers in Text data type field?\r\n7. What do you mean by the term “Data Redundancy” in context of databases? ","subject_name":"English"},{"date":"2021-12-15","file_location":"abc","message":"Q2.’The Diary Of Anne Frank’ is a 1959 film based on Pulitzer prize winning play of\r\nthe same name, which is based on the diary of Anne Frank. This diary is the long\r\nreading text prescribed by CBSE for extensive study. Make sure that you read the\r\nbook as well as watch the movie. ","subject_name":"Math"}]

class Data {
  Data({
      String? name, 
      String? studentCode, 
      String? rollNo, 
      String? className, 
      String? shiftName, 
      String? sectionName, 
      String? groupName, 
      String? categoryName, 
      String? date, 
      List<Note_book_list>? noteBookList,}){
    _name = name;
    _studentCode = studentCode;
    _rollNo = rollNo;
    _className = className;
    _shiftName = shiftName;
    _sectionName = sectionName;
    _groupName = groupName;
    _categoryName = categoryName;
    _date = date;
    _noteBookList = noteBookList;
}

  Data.fromJson(dynamic json) {
    _name = json['name'];
    _studentCode = json['student_code'];
    _rollNo = json['roll_no'];
    _className = json['class_name'];
    _shiftName = json['shift_name'];
    _sectionName = json['section_name'];
    _groupName = json['group_name'];
    _categoryName = json['category_name'];
    _date = json['date'];
    if (json['note_book_list'] != null) {
      _noteBookList = [];
      json['note_book_list'].forEach((v) {
        _noteBookList?.add(Note_book_list.fromJson(v));
      });
    }
  }
  String? _name;
  String? _studentCode;
  String? _rollNo;
  String? _className;
  String? _shiftName;
  String? _sectionName;
  String? _groupName;
  String? _categoryName;
  String? _date;
  List<Note_book_list>? _noteBookList;

  String? get name => _name;
  String? get studentCode => _studentCode;
  String? get rollNo => _rollNo;
  String? get className => _className;
  String? get shiftName => _shiftName;
  String? get sectionName => _sectionName;
  String? get groupName => _groupName;
  String? get categoryName => _categoryName;
  String? get date => _date;
  List<Note_book_list>? get noteBookList => _noteBookList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['student_code'] = _studentCode;
    map['roll_no'] = _rollNo;
    map['class_name'] = _className;
    map['shift_name'] = _shiftName;
    map['section_name'] = _sectionName;
    map['group_name'] = _groupName;
    map['category_name'] = _categoryName;
    map['date'] = _date;
    if (_noteBookList != null) {
      map['note_book_list'] = _noteBookList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// date : "2021-12-15"
/// file_location : "abc"
/// message : "Q.1. Read the chapter Print Culture and The Modern World. Make one word questions and write\r\ntheir answers also. Do the work in the register.\r\nQ.2. Trace the political map of India in 1947 and compare it with the map of India in 2013. Paste\r\nthe map in your civics copy.\r\nQ.3. Why is democracy the most successful form of government in the world. With examples,\r\nhighlight the topic and supplement the same with pictures.\r\nQ.4. Prepare a project on any one of the following topics;"
/// subject_name : "Bangla"

class Note_book_list {
  Note_book_list({
      String? date, 
      String? fileLocation, 
      String? message, 
      String? subjectName,}){
    _date = date;
    _fileLocation = fileLocation;
    _message = message;
    _subjectName = subjectName;
}

  Note_book_list.fromJson(dynamic json) {
    _date = json['date'];
    _fileLocation = json['file_location'];
    _message = json['message'];
    _subjectName = json['subject_name'];
  }
  String? _date;
  String? _fileLocation;
  String? _message;
  String? _subjectName;

  String? get date => _date;
  String? get fileLocation => _fileLocation;
  String? get message => _message;
  String? get subjectName => _subjectName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = _date;
    map['file_location'] = _fileLocation;
    map['message'] = _message;
    map['subject_name'] = _subjectName;
    return map;
  }

}