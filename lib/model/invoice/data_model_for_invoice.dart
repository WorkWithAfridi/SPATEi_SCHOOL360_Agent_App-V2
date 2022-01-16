/// status : "success"
/// message : "Successfully Data Send"
/// collection_info : [{"id":"12","class_id":"1","section_id":"1","group_id":"3","shift_id":"1","student_category_id":"3","student_id":"3","month":"1","year":"2021","date":"2022-01-12","mode_of_pay":"B","receipt_no":"164192647405","total_paid_amount":"600.00","total_discount":"0.00","entry_date":"2022-01-12 00:41:14","do_you_collect_late_fee":"N","is_resident_transaction":"0","user_id":"40","payment_type":"BKASH-BKash","transaction_id":"1231321321321312","is_online_payment":"1","service_charge_percentage":"2.00","service_charge_amount":"12.00","is_payslip":"0","collection_status":"1","remarks":"Payment By Mobile App","student_name":"Ashek Mahmud","student_code":"211003","roll_no":"3","reg_no":null,"section":"A","class_name":"Class-1","shift_name":"1st Shift","group_name":"NOT APPLICABLE","late_fee_amount":null}]
/// collection_details : [{"id":"16","collection_id":"12","class_id":"1","shift_id":"1","section_id":"1","group_id":"3","student_category_id":"3","student_id":"3","month":"6","year":"2021","category_id":"1","sub_category_id":"3","is_one_time_fees":"0","actual_amount":"600.00","waiver_amount":"0.00","paid_amount":"600.00","discount_amount":"0.00","due_amount":"0.00","collection_status":"1","entry_date":"2022-01-12","sub_category":"Tuition Fees "}]
/// late_fee_amount : 0
/// total_amount_in_words : "Six Hundred Taka Only"
/// institute_info : {"id":"3","institute_type":"1","school_name":"NEW SCHOOL","school_name_bangla":"NEW SCHOOL","school_short_name":"200009","eiin_number":"1","address":"ADDRESS","address_bangla":"ADDRESS","email":"-","mobile":"0","facebook_address":"-","web_address":"http://school360.app/200009","picture":"contact_1641833188_2022-01-10.png","use_timekeeping":"0","login_page_image_added":"0"}

class DataModelForInvoice {
  DataModelForInvoice({
      String? status, 
      String? message, 
      List<Collection_info>? collectionInfo, 
      List<Collection_details>? collectionDetails, 
      int? lateFeeAmount, 
      String? totalAmountInWords, 
      Institute_info? instituteInfo,}){
    _status = status;
    _message = message;
    _collectionInfo = collectionInfo;
    _collectionDetails = collectionDetails;
    _lateFeeAmount = lateFeeAmount;
    _totalAmountInWords = totalAmountInWords;
    _instituteInfo = instituteInfo;
}

  DataModelForInvoice.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['collection_info'] != null) {
      _collectionInfo = [];
      json['collection_info'].forEach((v) {
        _collectionInfo?.add(Collection_info.fromJson(v));
      });
    }
    if (json['collection_details'] != null) {
      _collectionDetails = [];
      json['collection_details'].forEach((v) {
        _collectionDetails?.add(Collection_details.fromJson(v));
      });
    }
    _lateFeeAmount = json['late_fee_amount'];
    _totalAmountInWords = json['total_amount_in_words'];
    _instituteInfo = json['institute_info'] != null ? Institute_info.fromJson(json['institute_info']) : null;
  }
  String? _status;
  String? _message;
  List<Collection_info>? _collectionInfo;
  List<Collection_details>? _collectionDetails;
  int? _lateFeeAmount;
  String? _totalAmountInWords;
  Institute_info? _instituteInfo;

  String? get status => _status;
  String? get message => _message;
  List<Collection_info>? get collectionInfo => _collectionInfo;
  List<Collection_details>? get collectionDetails => _collectionDetails;
  int? get lateFeeAmount => _lateFeeAmount;
  String? get totalAmountInWords => _totalAmountInWords;
  Institute_info? get instituteInfo => _instituteInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_collectionInfo != null) {
      map['collection_info'] = _collectionInfo?.map((v) => v.toJson()).toList();
    }
    if (_collectionDetails != null) {
      map['collection_details'] = _collectionDetails?.map((v) => v.toJson()).toList();
    }
    map['late_fee_amount'] = _lateFeeAmount;
    map['total_amount_in_words'] = _totalAmountInWords;
    if (_instituteInfo != null) {
      map['institute_info'] = _instituteInfo?.toJson();
    }
    return map;
  }

}

/// id : "3"
/// institute_type : "1"
/// school_name : "NEW SCHOOL"
/// school_name_bangla : "NEW SCHOOL"
/// school_short_name : "200009"
/// eiin_number : "1"
/// address : "ADDRESS"
/// address_bangla : "ADDRESS"
/// email : "-"
/// mobile : "0"
/// facebook_address : "-"
/// web_address : "http://school360.app/200009"
/// picture : "contact_1641833188_2022-01-10.png"
/// use_timekeeping : "0"
/// login_page_image_added : "0"

class Institute_info {
  Institute_info({
      String? id, 
      String? instituteType, 
      String? schoolName, 
      String? schoolNameBangla, 
      String? schoolShortName, 
      String? eiinNumber, 
      String? address, 
      String? addressBangla, 
      String? email, 
      String? mobile, 
      String? facebookAddress, 
      String? webAddress, 
      String? picture, 
      String? useTimekeeping, 
      String? loginPageImageAdded,}){
    _id = id;
    _instituteType = instituteType;
    _schoolName = schoolName;
    _schoolNameBangla = schoolNameBangla;
    _schoolShortName = schoolShortName;
    _eiinNumber = eiinNumber;
    _address = address;
    _addressBangla = addressBangla;
    _email = email;
    _mobile = mobile;
    _facebookAddress = facebookAddress;
    _webAddress = webAddress;
    _picture = picture;
    _useTimekeeping = useTimekeeping;
    _loginPageImageAdded = loginPageImageAdded;
}

  Institute_info.fromJson(dynamic json) {
    _id = json['id'];
    _instituteType = json['institute_type'];
    _schoolName = json['school_name'];
    _schoolNameBangla = json['school_name_bangla'];
    _schoolShortName = json['school_short_name'];
    _eiinNumber = json['eiin_number'];
    _address = json['address'];
    _addressBangla = json['address_bangla'];
    _email = json['email'];
    _mobile = json['mobile'];
    _facebookAddress = json['facebook_address'];
    _webAddress = json['web_address'];
    _picture = json['picture'];
    _useTimekeeping = json['use_timekeeping'];
    _loginPageImageAdded = json['login_page_image_added'];
  }
  String? _id;
  String? _instituteType;
  String? _schoolName;
  String? _schoolNameBangla;
  String? _schoolShortName;
  String? _eiinNumber;
  String? _address;
  String? _addressBangla;
  String? _email;
  String? _mobile;
  String? _facebookAddress;
  String? _webAddress;
  String? _picture;
  String? _useTimekeeping;
  String? _loginPageImageAdded;

  String? get id => _id;
  String? get instituteType => _instituteType;
  String? get schoolName => _schoolName;
  String? get schoolNameBangla => _schoolNameBangla;
  String? get schoolShortName => _schoolShortName;
  String? get eiinNumber => _eiinNumber;
  String? get address => _address;
  String? get addressBangla => _addressBangla;
  String? get email => _email;
  String? get mobile => _mobile;
  String? get facebookAddress => _facebookAddress;
  String? get webAddress => _webAddress;
  String? get picture => _picture;
  String? get useTimekeeping => _useTimekeeping;
  String? get loginPageImageAdded => _loginPageImageAdded;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['institute_type'] = _instituteType;
    map['school_name'] = _schoolName;
    map['school_name_bangla'] = _schoolNameBangla;
    map['school_short_name'] = _schoolShortName;
    map['eiin_number'] = _eiinNumber;
    map['address'] = _address;
    map['address_bangla'] = _addressBangla;
    map['email'] = _email;
    map['mobile'] = _mobile;
    map['facebook_address'] = _facebookAddress;
    map['web_address'] = _webAddress;
    map['picture'] = _picture;
    map['use_timekeeping'] = _useTimekeeping;
    map['login_page_image_added'] = _loginPageImageAdded;
    return map;
  }

}

/// id : "16"
/// collection_id : "12"
/// class_id : "1"
/// shift_id : "1"
/// section_id : "1"
/// group_id : "3"
/// student_category_id : "3"
/// student_id : "3"
/// month : "6"
/// year : "2021"
/// category_id : "1"
/// sub_category_id : "3"
/// is_one_time_fees : "0"
/// actual_amount : "600.00"
/// waiver_amount : "0.00"
/// paid_amount : "600.00"
/// discount_amount : "0.00"
/// due_amount : "0.00"
/// collection_status : "1"
/// entry_date : "2022-01-12"
/// sub_category : "Tuition Fees "

class Collection_details {
  Collection_details({
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
      String? isOneTimeFees, 
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
    _isOneTimeFees = isOneTimeFees;
    _actualAmount = actualAmount;
    _waiverAmount = waiverAmount;
    _paidAmount = paidAmount;
    _discountAmount = discountAmount;
    _dueAmount = dueAmount;
    _collectionStatus = collectionStatus;
    _entryDate = entryDate;
    _subCategory = subCategory;
}

  Collection_details.fromJson(dynamic json) {
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
    _isOneTimeFees = json['is_one_time_fees'];
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
  String? _isOneTimeFees;
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
  String? get isOneTimeFees => _isOneTimeFees;
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
    map['is_one_time_fees'] = _isOneTimeFees;
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

/// id : "12"
/// class_id : "1"
/// section_id : "1"
/// group_id : "3"
/// shift_id : "1"
/// student_category_id : "3"
/// student_id : "3"
/// month : "1"
/// year : "2021"
/// date : "2022-01-12"
/// mode_of_pay : "B"
/// receipt_no : "164192647405"
/// total_paid_amount : "600.00"
/// total_discount : "0.00"
/// entry_date : "2022-01-12 00:41:14"
/// do_you_collect_late_fee : "N"
/// is_resident_transaction : "0"
/// user_id : "40"
/// payment_type : "BKASH-BKash"
/// transaction_id : "1231321321321312"
/// is_online_payment : "1"
/// service_charge_percentage : "2.00"
/// service_charge_amount : "12.00"
/// is_payslip : "0"
/// collection_status : "1"
/// remarks : "Payment By Mobile App"
/// student_name : "Ashek Mahmud"
/// student_code : "211003"
/// roll_no : "3"
/// reg_no : null
/// section : "A"
/// class_name : "Class-1"
/// shift_name : "1st Shift"
/// group_name : "NOT APPLICABLE"
/// late_fee_amount : null

class Collection_info {
  Collection_info({
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
      String? transactionId, 
      String? isOnlinePayment, 
      String? serviceChargePercentage, 
      String? serviceChargeAmount, 
      String? isPayslip, 
      String? collectionStatus, 
      String? remarks, 
      String? studentName, 
      String? studentCode, 
      String? rollNo, 
      dynamic regNo, 
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

  Collection_info.fromJson(dynamic json) {
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
  String? _transactionId;
  String? _isOnlinePayment;
  String? _serviceChargePercentage;
  String? _serviceChargeAmount;
  String? _isPayslip;
  String? _collectionStatus;
  String? _remarks;
  String? _studentName;
  String? _studentCode;
  String? _rollNo;
  dynamic _regNo;
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
  String? get transactionId => _transactionId;
  String? get isOnlinePayment => _isOnlinePayment;
  String? get serviceChargePercentage => _serviceChargePercentage;
  String? get serviceChargeAmount => _serviceChargeAmount;
  String? get isPayslip => _isPayslip;
  String? get collectionStatus => _collectionStatus;
  String? get remarks => _remarks;
  String? get studentName => _studentName;
  String? get studentCode => _studentCode;
  String? get rollNo => _rollNo;
  dynamic get regNo => _regNo;
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