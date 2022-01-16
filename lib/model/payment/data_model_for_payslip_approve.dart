/// status : "success"
/// message : "Payslip Successfully Approved"

class PayslipApproveAPI {
  PayslipApproveAPI({
      String? status, 
      String? message,}){
    _status = status;
    _message = message;
}

  PayslipApproveAPI.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
  }
  String? _status;
  String? _message;

  String? get status => _status;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    return map;
  }

}