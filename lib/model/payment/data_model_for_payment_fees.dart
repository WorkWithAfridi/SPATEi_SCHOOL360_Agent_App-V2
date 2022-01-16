
class FeesData{
  final String status;
  final String message;
  final Student_info student_info;
  final Fees_data fees_data;
  FeesData({required this.status, required this.message, required this.student_info, required this.fees_data});
  factory FeesData.fromJson(Map<String, dynamic> data){
     final status = data['status'] as String;
     final message = data['message'] as String;
     final student_info = Student_info.fromJson(data['student_info'][0]) as Student_info;
     final fees_data = Fees_data.fromJson(data['fees_data']);
     return FeesData(status: status, message: message, student_info: student_info, fees_data: fees_data);
  }
}

class Fees_data{
  final List<AllocatedList> allocated_list;
  final String receipt_no;
  Fees_data({required this.receipt_no, required this.allocated_list});
  factory Fees_data.fromJson(Map<String, dynamic>data){
    final List<AllocatedList> allocated_list=[];
    data['allocated_list'].forEach((allo_list){
      allocated_list.add(AllocatedList.fromJson(allo_list));
    });
//     json['allocated_list'].forEach((v) {
//       _allocatedList?.add(Allocated_list.fromJson(v));
//     });
    final receipt_no=data['receipt_no'];
    return Fees_data(receipt_no: receipt_no, allocated_list: allocated_list);
  }
}

class AllocatedList{
  final String sub_category_name;
  final int actual_allocated_amount_for_this_student;
  final int already_paid_amount;
  final int already_discount_amount;
  AllocatedList({required this.sub_category_name, required this.actual_allocated_amount_for_this_student, required this.already_paid_amount, required this.already_discount_amount});
  factory AllocatedList.fromJson(Map<String, dynamic>data){
  final sub_category_name = data['sub_category_name'];
  final actual_allocated_amount_for_this_student= data['actual_allocated_amount_for_this_student'] as int;
  // final already_paid_amount= int.parse(data['already_paid_amount'].toString().substring(0, data['already_paid_amount'].toString().length-3));
  // final already_paid_amount= int.parse(data['already_paid_amount'].toString()) as int;
  // print(int.parse(data['already_paid_amount'].toString().substring(0, data['already_paid_amount'].toString().length-3)));
  late int already_paid_amount;
  // print(actual_allocated_amount_for_this_student);
  // print(data['already_paid_amount'].runtimeType);
  try{
     already_paid_amount = int.parse(data['already_paid_amount'].toString());
  }catch(e){
    already_paid_amount = int.parse(data['already_paid_amount'].toString().substring(0, data['already_paid_amount'].toString().length-3));
  }
  final already_discount_amount=data['already_discount_amount'] as int;
  return AllocatedList(sub_category_name: sub_category_name, actual_allocated_amount_for_this_student: actual_allocated_amount_for_this_student, already_paid_amount: already_paid_amount, already_discount_amount: already_discount_amount);
  }
}

class Student_info {
  final String id;
  final String name;
  final String student_code;
  Student_info({required this.id, required this.name, required this.student_code});
  factory Student_info.fromJson(Map<String, dynamic> data){
    final id = data['id'];
    final name = data['name'];
    final student_code = data['student_code'];
    return Student_info(id: id, name: name, student_code: student_code);
  }
}

//
//
//
//
// class Data_model_for_payment_fees {
//   Data_model_for_payment_fees({
//       String? status,
//       String? message,
//       Student_info? studentInfo,
//       Fees_data? feesData,}){
//     _status = status;
//     _message = message;
//     _studentInfo = studentInfo;
//     _feesData = feesData;
// }
//
//   Data_model_for_payment_fees.fromJson(dynamic json) {
//     _status = json['status'];
//     _message = json['message'];
//     _studentInfo = json['student_info'][0] as Student_info;
//     // if (json['student_info'] != null) {
//     //   _studentInfo = [];
//     //   json['student_info'].forEach((v) {
//     //     _studentInfo?.add(Student_info.fromJson(v)) as Allocated_list;
//     //   });
//     // }
//     _feesData = json['fees_data'];
//   }
//   String? _status;
//   String? _message;
//   late Student_info? _studentInfo;
//   Fees_data? _feesData;
//
//   String? get status => _status;
//   String? get message => _message;
//   Student_info? get studentInfo => _studentInfo;
//   Fees_data? get feesData => _feesData;
//
// }
//
// /// allocated_list : [{"category_id":"1","sub_category_id":"1","waiver_amount":0,"sub_category_name":"Admission Form, January","month":1,"actual_allocated_amount_for_this_student":200,"already_paid_amount":"200.00","already_discount_amount":0}]
// /// receipt_no : "163871746905"
//
// class Fees_data {
//   Fees_data({
//       List<Allocated_list>? allocatedList,
//       String? receiptNo,}){
//     _allocatedList = allocatedList;
//     _receiptNo = receiptNo;
// }
//
//   Fees_data.fromJson(dynamic json) {
//     _allocatedList = [] as List<Allocated_list>;
//     json['allocated_list'].forEach((v) {
//       _allocatedList?.add(Allocated_list.fromJson(v));
//     });
//     _receiptNo = json['receipt_no'];
//   }
//   List<Allocated_list>? _allocatedList;
//   String? _receiptNo;
//
//   List<Allocated_list>? get allocatedList => _allocatedList;
//   String? get receiptNo => _receiptNo;
//
//
// }
//
// /// category_id : "1"
// /// sub_category_id : "1"
// /// waiver_amount : 0
// /// sub_category_name : "Admission Form, January"
// /// month : 1
// /// actual_allocated_amount_for_this_student : 200
// /// already_paid_amount : "200.00"
// /// already_discount_amount : 0
//
// class Allocated_list {
//   Allocated_list({
//       String? categoryId,
//       String? subCategoryId,
//       int? waiverAmount,
//       String? subCategoryName,
//       int? month,
//       int? actualAllocatedAmountForThisStudent,
//       String? alreadyPaidAmount,
//       int? alreadyDiscountAmount,}){
//     _categoryId = categoryId;
//     _subCategoryId = subCategoryId;
//     _waiverAmount = waiverAmount;
//     _subCategoryName = subCategoryName;
//     _month = month;
//     _actualAllocatedAmountForThisStudent = actualAllocatedAmountForThisStudent;
//     _alreadyPaidAmount = alreadyPaidAmount;
//     _alreadyDiscountAmount = alreadyDiscountAmount;
// }
//
//   Allocated_list.fromJson(dynamic json) {
//     _categoryId = json['category_id'];
//     _subCategoryId = json['sub_category_id'];
//     _waiverAmount = json['waiver_amount'];
//     _subCategoryName = json['sub_category_name'];
//     _month = json['month'];
//     _actualAllocatedAmountForThisStudent = json['actual_allocated_amount_for_this_student'];
//     _alreadyPaidAmount = json['already_paid_amount'];
//     _alreadyDiscountAmount = json['already_discount_amount'];
//   }
//   String? _categoryId;
//   String? _subCategoryId;
//   int? _waiverAmount;
//   String? _subCategoryName;
//   int? _month;
//   int? _actualAllocatedAmountForThisStudent;
//   String? _alreadyPaidAmount;
//   int? _alreadyDiscountAmount;
//
//   String? get categoryId => _categoryId;
//   String? get subCategoryId => _subCategoryId;
//   int? get waiverAmount => _waiverAmount;
//   String? get subCategoryName => _subCategoryName;
//   int? get month => _month;
//   int? get actualAllocatedAmountForThisStudent => _actualAllocatedAmountForThisStudent;
//   String? get alreadyPaidAmount => _alreadyPaidAmount;
//   int? get alreadyDiscountAmount => _alreadyDiscountAmount;
//
// }
//
// /// id : "1"
// /// name : "Sazzadur Rahman"
// /// name_bangla : "Sazzadur Rahman"
// /// student_code : "211001"
//
// class Student_info {
//   Student_info({
//       String? id,
//       String? name,
//       String? nameBangla,
//       String? studentCode,}){
//     _id = id;
//     _name = name;
//     _nameBangla = nameBangla;
//     _studentCode = studentCode;
// }
//
//   Student_info.fromJson(dynamic json) {
//     _id = json['id'];
//     _name = json['name'];
//     _nameBangla = json['name_bangla'];
//     _studentCode = json['student_code'];
//   }
//   String? _id;
//   String? _name;
//   String? _nameBangla;
//   String? _studentCode;
//
//   String? get id => _id;
//   String? get name => _name;
//   String? get nameBangla => _nameBangla;
//   String? get studentCode => _studentCode;
//
// }