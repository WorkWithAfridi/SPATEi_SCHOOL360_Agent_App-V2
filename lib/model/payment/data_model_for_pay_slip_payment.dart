/// status : "success"
/// data : {"payment_info":[{"id":"22","class_id":"1","section_id":"1","group_id":"4","shift_id":"1","student_category_id":"3","student_id":"2","month":"10","year":"2021","date":"2021-10-23","mode_of_pay":"C","receipt_no":"163495604940","total_paid_amount":"430.00","total_discount":"0.00","entry_date":"2021-10-23 08:28:19","do_you_collect_late_fee":"N","is_resident_transaction":"0","user_id":"40","payment_type":"CASH","transaction_id":null,"is_online_payment":"0","service_charge_percentage":"0.00","service_charge_amount":"0.00","is_payslip":"1","collection_status":"0","remarks":"","student_name":"MD. NOMAN","student_code":"2048319","roll_no":"8","reg_no":"","section":"A","class_name":"PLAY","shift_name":"Day","group_name":"General","late_fee_amount":null}],"collection_sheet_details":[{"id":"250","collection_id":"22","class_id":"1","shift_id":"1","section_id":"1","group_id":"4","student_category_id":"3","student_id":"2","month":"10","year":"2021","category_id":"2","sub_category_id":"1","actual_amount":"400.00","waiver_amount":"0.00","paid_amount":"400.00","discount_amount":"0.00","due_amount":"0.00","collection_status":"0","entry_date":"2021-10-23","sub_category":"Tuition Fees"},{"id":"251","collection_id":"22","class_id":"1","shift_id":"1","section_id":"1","group_id":"4","student_category_id":"3","student_id":"2","month":"10","year":"2021","category_id":"2","sub_category_id":"3","actual_amount":"20.00","waiver_amount":"0.00","paid_amount":"20.00","discount_amount":"0.00","due_amount":"0.00","collection_status":"0","entry_date":"2021-10-23","sub_category":"ICT Fees"},{"id":"252","collection_id":"22","class_id":"1","shift_id":"1","section_id":"1","group_id":"4","student_category_id":"3","student_id":"2","month":"10","year":"2021","category_id":"2","sub_category_id":"11","actual_amount":"10.00","waiver_amount":"0.00","paid_amount":"10.00","discount_amount":"0.00","due_amount":"0.00","collection_status":"0","entry_date":"2021-10-23","sub_category":"Genarator Fees"}]}
/// message : "Successfully Data Found"

class DataModelForPaySlipPayment {
  DataModelForPaySlipPayment({
      String? status, 
      Data? data, 
      String? message,}){
    _status = status;
    _data = data;
    _message = message;
}

  DataModelForPaySlipPayment.fromJson(dynamic json) {
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

/// payment_info : [{"id":"22","class_id":"1","section_id":"1","group_id":"4","shift_id":"1","student_category_id":"3","student_id":"2","month":"10","year":"2021","date":"2021-10-23","mode_of_pay":"C","receipt_no":"163495604940","total_paid_amount":"430.00","total_discount":"0.00","entry_date":"2021-10-23 08:28:19","do_you_collect_late_fee":"N","is_resident_transaction":"0","user_id":"40","payment_type":"CASH","transaction_id":null,"is_online_payment":"0","service_charge_percentage":"0.00","service_charge_amount":"0.00","is_payslip":"1","collection_status":"0","remarks":"","student_name":"MD. NOMAN","student_code":"2048319","roll_no":"8","reg_no":"","section":"A","class_name":"PLAY","shift_name":"Day","group_name":"General","late_fee_amount":null}]
/// collection_sheet_details : [{"id":"250","collection_id":"22","class_id":"1","shift_id":"1","section_id":"1","group_id":"4","student_category_id":"3","student_id":"2","month":"10","year":"2021","category_id":"2","sub_category_id":"1","actual_amount":"400.00","waiver_amount":"0.00","paid_amount":"400.00","discount_amount":"0.00","due_amount":"0.00","collection_status":"0","entry_date":"2021-10-23","sub_category":"Tuition Fees"},{"id":"251","collection_id":"22","class_id":"1","shift_id":"1","section_id":"1","group_id":"4","student_category_id":"3","student_id":"2","month":"10","year":"2021","category_id":"2","sub_category_id":"3","actual_amount":"20.00","waiver_amount":"0.00","paid_amount":"20.00","discount_amount":"0.00","due_amount":"0.00","collection_status":"0","entry_date":"2021-10-23","sub_category":"ICT Fees"},{"id":"252","collection_id":"22","class_id":"1","shift_id":"1","section_id":"1","group_id":"4","student_category_id":"3","student_id":"2","month":"10","year":"2021","category_id":"2","sub_category_id":"11","actual_amount":"10.00","waiver_amount":"0.00","paid_amount":"10.00","discount_amount":"0.00","due_amount":"0.00","collection_status":"0","entry_date":"2021-10-23","sub_category":"Genarator Fees"}]

class Data {
  Data({
      List<Payment_info>? paymentInfo, 
      List<Collection_sheet_details>? collectionSheetDetails,}){
    _paymentInfo = paymentInfo;
    _collectionSheetDetails = collectionSheetDetails;
}

  Data.fromJson(dynamic json) {
    if (json['payment_info'] != null) {
      _paymentInfo = [];
      json['payment_info'].forEach((v) {
        _paymentInfo?.add(Payment_info.fromJson(v));
      });
    }
    if (json['collection_sheet_details'] != null) {
      _collectionSheetDetails = [];
      json['collection_sheet_details'].forEach((v) {
        _collectionSheetDetails?.add(Collection_sheet_details.fromJson(v));
      });
    }
  }
  List<Payment_info>? _paymentInfo;
  List<Collection_sheet_details>? _collectionSheetDetails;

  List<Payment_info>? get paymentInfo => _paymentInfo;
  List<Collection_sheet_details>? get collectionSheetDetails => _collectionSheetDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_paymentInfo != null) {
      map['payment_info'] = _paymentInfo?.map((v) => v.toJson()).toList();
    }
    if (_collectionSheetDetails != null) {
      map['collection_sheet_details'] = _collectionSheetDetails?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "250"
/// collection_id : "22"
/// class_id : "1"
/// shift_id : "1"
/// section_id : "1"
/// group_id : "4"
/// student_category_id : "3"
/// student_id : "2"
/// month : "10"
/// year : "2021"
/// category_id : "2"
/// sub_category_id : "1"
/// actual_amount : "400.00"
/// waiver_amount : "0.00"
/// paid_amount : "400.00"
/// discount_amount : "0.00"
/// due_amount : "0.00"
/// collection_status : "0"
/// entry_date : "2021-10-23"
/// sub_category : "Tuition Fees"

class Collection_sheet_details {
  Collection_sheet_details({
      String? id, 
      String? collectionId, 
      String? classId, 
      String? shiftId, 
      String? sectionId, 
      String? groupId, 
      String? studentCategoryId, 
      String? studentId, 
      String? month, 
      String? year, 
      String? categoryId, 
      String? subCategoryId, 
      String? actualAmount, 
      String? waiverAmount, 
      String? paidAmount, 
      String? discountAmount, 
      String? dueAmount, 
      String? collectionStatus, 
      String? entryDate, 
      String? subCategory,}){
    _id = id;
    _collectionId = collectionId;
    _classId = classId;
    _shiftId = shiftId;
    _sectionId = sectionId;
    _groupId = groupId;
    _studentCategoryId = studentCategoryId;
    _studentId = studentId;
    _month = month;
    _year = year;
    _categoryId = categoryId;
    _subCategoryId = subCategoryId;
    _actualAmount = actualAmount;
    _waiverAmount = waiverAmount;
    _paidAmount = paidAmount;
    _discountAmount = discountAmount;
    _dueAmount = dueAmount;
    _collectionStatus = collectionStatus;
    _entryDate = entryDate;
    _subCategory = subCategory;
}

  Collection_sheet_details.fromJson(dynamic json) {
    _id = json['id'];
    _collectionId = json['collection_id'];
    _classId = json['class_id'];
    _shiftId = json['shift_id'];
    _sectionId = json['section_id'];
    _groupId = json['group_id'];
    _studentCategoryId = json['student_category_id'];
    _studentId = json['student_id'];
    _month = json['month'];
    _year = json['year'];
    _categoryId = json['category_id'];
    _subCategoryId = json['sub_category_id'];
    _actualAmount = json['actual_amount'];
    _waiverAmount = json['waiver_amount'];
    _paidAmount = json['paid_amount'];
    _discountAmount = json['discount_amount'];
    _dueAmount = json['due_amount'];
    _collectionStatus = json['collection_status'];
    _entryDate = json['entry_date'];
    _subCategory = json['sub_category'];
  }
  String? _id;
  String? _collectionId;
  String? _classId;
  String? _shiftId;
  String? _sectionId;
  String? _groupId;
  String? _studentCategoryId;
  String? _studentId;
  String? _month;
  String? _year;
  String? _categoryId;
  String? _subCategoryId;
  String? _actualAmount;
  String? _waiverAmount;
  String? _paidAmount;
  String? _discountAmount;
  String? _dueAmount;
  String? _collectionStatus;
  String? _entryDate;
  String? _subCategory;

  String? get id => _id;
  String? get collectionId => _collectionId;
  String? get classId => _classId;
  String? get shiftId => _shiftId;
  String? get sectionId => _sectionId;
  String? get groupId => _groupId;
  String? get studentCategoryId => _studentCategoryId;
  String? get studentId => _studentId;
  String? get month => _month;
  String? get year => _year;
  String? get categoryId => _categoryId;
  String? get subCategoryId => _subCategoryId;
  String? get actualAmount => _actualAmount;
  String? get waiverAmount => _waiverAmount;
  String? get paidAmount => _paidAmount;
  String? get discountAmount => _discountAmount;
  String? get dueAmount => _dueAmount;
  String? get collectionStatus => _collectionStatus;
  String? get entryDate => _entryDate;
  String? get subCategory => _subCategory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['collection_id'] = _collectionId;
    map['class_id'] = _classId;
    map['shift_id'] = _shiftId;
    map['section_id'] = _sectionId;
    map['group_id'] = _groupId;
    map['student_category_id'] = _studentCategoryId;
    map['student_id'] = _studentId;
    map['month'] = _month;
    map['year'] = _year;
    map['category_id'] = _categoryId;
    map['sub_category_id'] = _subCategoryId;
    map['actual_amount'] = _actualAmount;
    map['waiver_amount'] = _waiverAmount;
    map['paid_amount'] = _paidAmount;
    map['discount_amount'] = _discountAmount;
    map['due_amount'] = _dueAmount;
    map['collection_status'] = _collectionStatus;
    map['entry_date'] = _entryDate;
    map['sub_category'] = _subCategory;
    return map;
  }

}

/// id : "22"
/// class_id : "1"
/// section_id : "1"
/// group_id : "4"
/// shift_id : "1"
/// student_category_id : "3"
/// student_id : "2"
/// month : "10"
/// year : "2021"
/// date : "2021-10-23"
/// mode_of_pay : "C"
/// receipt_no : "163495604940"
/// total_paid_amount : "430.00"
/// total_discount : "0.00"
/// entry_date : "2021-10-23 08:28:19"
/// do_you_collect_late_fee : "N"
/// is_resident_transaction : "0"
/// user_id : "40"
/// payment_type : "CASH"
/// transaction_id : null
/// is_online_payment : "0"
/// service_charge_percentage : "0.00"
/// service_charge_amount : "0.00"
/// is_payslip : "1"
/// collection_status : "0"
/// remarks : ""
/// student_name : "MD. NOMAN"
/// student_code : "2048319"
/// roll_no : "8"
/// reg_no : ""
/// section : "A"
/// class_name : "PLAY"
/// shift_name : "Day"
/// group_name : "General"
/// late_fee_amount : null

class Payment_info {
  Payment_info({
      String? id, 
      String? classId, 
      String? sectionId, 
      String? groupId, 
      String? shiftId, 
      String? studentCategoryId, 
      String? studentId, 
      String? month, 
      String? year, 
      String? date, 
      String? modeOfPay, 
      String? receiptNo, 
      String? totalPaidAmount, 
      String? totalDiscount, 
      String? entryDate, 
      String? doYouCollectLateFee, 
      String? isResidentTransaction, 
      String? userId, 
      String? paymentType, 
      dynamic transactionId, 
      String? isOnlinePayment, 
      String? serviceChargePercentage, 
      String? serviceChargeAmount, 
      String? isPayslip, 
      String? collectionStatus, 
      String? remarks, 
      String? studentName, 
      String? studentCode, 
      String? rollNo, 
      String? regNo, 
      String? section, 
      String? className, 
      String? shiftName, 
      String? groupName, 
      dynamic lateFeeAmount,}){
    _id = id;
    _classId = classId;
    _sectionId = sectionId;
    _groupId = groupId;
    _shiftId = shiftId;
    _studentCategoryId = studentCategoryId;
    _studentId = studentId;
    _month = month;
    _year = year;
    _date = date;
    _modeOfPay = modeOfPay;
    _receiptNo = receiptNo;
    _totalPaidAmount = totalPaidAmount;
    _totalDiscount = totalDiscount;
    _entryDate = entryDate;
    _doYouCollectLateFee = doYouCollectLateFee;
    _isResidentTransaction = isResidentTransaction;
    _userId = userId;
    _paymentType = paymentType;
    _transactionId = transactionId;
    _isOnlinePayment = isOnlinePayment;
    _serviceChargePercentage = serviceChargePercentage;
    _serviceChargeAmount = serviceChargeAmount;
    _isPayslip = isPayslip;
    _collectionStatus = collectionStatus;
    _remarks = remarks;
    _studentName = studentName;
    _studentCode = studentCode;
    _rollNo = rollNo;
    _regNo = regNo;
    _section = section;
    _className = className;
    _shiftName = shiftName;
    _groupName = groupName;
    _lateFeeAmount = lateFeeAmount;
}

  Payment_info.fromJson(dynamic json) {
    _id = json['id'];
    _classId = json['class_id'];
    _sectionId = json['section_id'];
    _groupId = json['group_id'];
    _shiftId = json['shift_id'];
    _studentCategoryId = json['student_category_id'];
    _studentId = json['student_id'];
    _month = json['month'];
    _year = json['year'];
    _date = json['date'];
    _modeOfPay = json['mode_of_pay'];
    _receiptNo = json['receipt_no'];
    _totalPaidAmount = json['total_paid_amount'];
    _totalDiscount = json['total_discount'];
    _entryDate = json['entry_date'];
    _doYouCollectLateFee = json['do_you_collect_late_fee'];
    _isResidentTransaction = json['is_resident_transaction'];
    _userId = json['user_id'];
    _paymentType = json['payment_type'];
    _transactionId = json['transaction_id'];
    _isOnlinePayment = json['is_online_payment'];
    _serviceChargePercentage = json['service_charge_percentage'];
    _serviceChargeAmount = json['service_charge_amount'];
    _isPayslip = json['is_payslip'];
    _collectionStatus = json['collection_status'];
    _remarks = json['remarks'];
    _studentName = json['student_name'];
    _studentCode = json['student_code'];
    _rollNo = json['roll_no'];
    _regNo = json['reg_no'];
    _section = json['section'];
    _className = json['class_name'];
    _shiftName = json['shift_name'];
    _groupName = json['group_name'];
    _lateFeeAmount = json['late_fee_amount'];
  }
  String? _id;
  String? _classId;
  String? _sectionId;
  String? _groupId;
  String? _shiftId;
  String? _studentCategoryId;
  String? _studentId;
  String? _month;
  String? _year;
  String? _date;
  String? _modeOfPay;
  String? _receiptNo;
  String? _totalPaidAmount;
  String? _totalDiscount;
  String? _entryDate;
  String? _doYouCollectLateFee;
  String? _isResidentTransaction;
  String? _userId;
  String? _paymentType;
  dynamic _transactionId;
  String? _isOnlinePayment;
  String? _serviceChargePercentage;
  String? _serviceChargeAmount;
  String? _isPayslip;
  String? _collectionStatus;
  String? _remarks;
  String? _studentName;
  String? _studentCode;
  String? _rollNo;
  String? _regNo;
  String? _section;
  String? _className;
  String? _shiftName;
  String? _groupName;
  dynamic _lateFeeAmount;

  String? get id => _id;
  String? get classId => _classId;
  String? get sectionId => _sectionId;
  String? get groupId => _groupId;
  String? get shiftId => _shiftId;
  String? get studentCategoryId => _studentCategoryId;
  String? get studentId => _studentId;
  String? get month => _month;
  String? get year => _year;
  String? get date => _date;
  String? get modeOfPay => _modeOfPay;
  String? get receiptNo => _receiptNo;
  String? get totalPaidAmount => _totalPaidAmount;
  String? get totalDiscount => _totalDiscount;
  String? get entryDate => _entryDate;
  String? get doYouCollectLateFee => _doYouCollectLateFee;
  String? get isResidentTransaction => _isResidentTransaction;
  String? get userId => _userId;
  String? get paymentType => _paymentType;
  dynamic get transactionId => _transactionId;
  String? get isOnlinePayment => _isOnlinePayment;
  String? get serviceChargePercentage => _serviceChargePercentage;
  String? get serviceChargeAmount => _serviceChargeAmount;
  String? get isPayslip => _isPayslip;
  String? get collectionStatus => _collectionStatus;
  String? get remarks => _remarks;
  String? get studentName => _studentName;
  String? get studentCode => _studentCode;
  String? get rollNo => _rollNo;
  String? get regNo => _regNo;
  String? get section => _section;
  String? get className => _className;
  String? get shiftName => _shiftName;
  String? get groupName => _groupName;
  dynamic get lateFeeAmount => _lateFeeAmount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['class_id'] = _classId;
    map['section_id'] = _sectionId;
    map['group_id'] = _groupId;
    map['shift_id'] = _shiftId;
    map['student_category_id'] = _studentCategoryId;
    map['student_id'] = _studentId;
    map['month'] = _month;
    map['year'] = _year;
    map['date'] = _date;
    map['mode_of_pay'] = _modeOfPay;
    map['receipt_no'] = _receiptNo;
    map['total_paid_amount'] = _totalPaidAmount;
    map['total_discount'] = _totalDiscount;
    map['entry_date'] = _entryDate;
    map['do_you_collect_late_fee'] = _doYouCollectLateFee;
    map['is_resident_transaction'] = _isResidentTransaction;
    map['user_id'] = _userId;
    map['payment_type'] = _paymentType;
    map['transaction_id'] = _transactionId;
    map['is_online_payment'] = _isOnlinePayment;
    map['service_charge_percentage'] = _serviceChargePercentage;
    map['service_charge_amount'] = _serviceChargeAmount;
    map['is_payslip'] = _isPayslip;
    map['collection_status'] = _collectionStatus;
    map['remarks'] = _remarks;
    map['student_name'] = _studentName;
    map['student_code'] = _studentCode;
    map['roll_no'] = _rollNo;
    map['reg_no'] = _regNo;
    map['section'] = _section;
    map['class_name'] = _className;
    map['shift_name'] = _shiftName;
    map['group_name'] = _groupName;
    map['late_fee_amount'] = _lateFeeAmount;
    return map;
  }

}