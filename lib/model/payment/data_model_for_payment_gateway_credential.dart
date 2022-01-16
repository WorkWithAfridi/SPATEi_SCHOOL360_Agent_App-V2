
class PaymentGatewayCredentialAPI {
  PaymentGatewayCredentialAPI({
      String? status, 
      String? message, 
      List<Gateway_info>? gatewayInfo,}){
    _status = status;
    _message = message;
    _gatewayInfo = gatewayInfo;
}

  PaymentGatewayCredentialAPI.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['gateway_info'] != null) {
      _gatewayInfo = [];
      json['gateway_info'].forEach((v) {
        _gatewayInfo?.add(Gateway_info.fromJson(v));
      });
    }
  }
  String? _status;
  String? _message;
  List<Gateway_info>? _gatewayInfo;

  String? get status => _status;
  String? get message => _message;
  List<Gateway_info>? get gatewayInfo => _gatewayInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_gatewayInfo != null) {
      map['gateway_info'] = _gatewayInfo?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// ssl_user_id : "school360live"
/// ssl_password : "61A30DA81386"

class Gateway_info {
  Gateway_info({
      String? sslUserId, 
      String? sslPassword,}){
    _sslUserId = sslUserId;
    _sslPassword = sslPassword;
}

  Gateway_info.fromJson(dynamic json) {
    _sslUserId = json['ssl_user_id'];
    _sslPassword = json['ssl_password'];
  }
  String? _sslUserId;
  String? _sslPassword;

  String? get sslUserId => _sslUserId;
  String? get sslPassword => _sslPassword;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ssl_user_id'] = _sslUserId;
    map['ssl_password'] = _sslPassword;
    return map;
  }

}