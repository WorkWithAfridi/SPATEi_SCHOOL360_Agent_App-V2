import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:school_360_app/model/data_model_for_dashboard_attendance.dart';
import 'package:school_360_app/model/data_model_for_notice.dart';
import 'package:school_360_app/model/payment/data_model_for_past_payment.dart';
import 'package:http/http.dart' as http;
import 'package:school_360_app/provider/qrcode_data.dart';

class DashboardProvider extends ChangeNotifier {
  late DataModelForPastPayment dataModelForPastPayment;

  bool _showAlertBox = false;
  bool get showAlertBox => _showAlertBox;
  set showAlertBox(bool value) {
    _showAlertBox = value;
  }

  String alertBoxText = '';
  String alertBoxTitle = '';
  String alertBoxButtonTitle = '';
  String alertBoxButtonAction = '';
  late DataModelForNotice dataModelForNotice;

  Future<void> getNotice(BuildContext context) async {
    showAlertBox = false;
    try {
      QRCodeDataProvider qrCodeData =
          Provider.of<QRCodeDataProvider>(context, listen: false);
      String url =
          'https://school360.app/${qrCodeData.schoolId}/service_bridge/getAllNotice';
      http.Response response = await http.post(Uri.parse(url), body: {
        "security_pin": '311556',
        "row_per_page": 5.toString(),
        "segment": 0.toString()
      });
      String data = response.body;
      if (data.isEmpty) {
        alertBoxText = 'No data found';
        alertBoxTitle = 'ERROR';
        alertBoxButtonTitle = "Retry";
        alertBoxButtonAction = "Retry";
        _showAlertBox = true;
        notifyListeners();
      } else {
        var data1 = jsonDecode(data);
        if (data1["is_success"] == false) {
          alertBoxText = 'No data found';
          alertBoxTitle = 'ERROR';
          alertBoxButtonTitle = "Retry";
          alertBoxButtonAction = "Retry";
          _showAlertBox = true;
          notifyListeners();
          return;
        }
        dataModelForNotice = DataModelForNotice.fromJson(data1);
        if (dataModelForNotice.isSuccess == true) {
          return;
        } else {
          alertBoxText = 'No data found';
          alertBoxTitle = 'ERROR';
          alertBoxButtonTitle = "Retry";
          alertBoxButtonAction = "Retry";
          _showAlertBox = true;
          notifyListeners();
          return;
        }
      }
    } on SocketException {
      alertBoxText =
          'Sorry. No working internet connection detected. Please try again later. :)';
      alertBoxTitle = 'Error: 404';
      alertBoxButtonTitle = "Retry";
      alertBoxButtonAction = "Retry";
      _showAlertBox = true;
      notifyListeners();
      return;
    } catch (e) {
      alertBoxText = 'No data found';
      alertBoxTitle = 'ERROR';
      alertBoxButtonTitle = "Retry";
      alertBoxButtonAction = "Retry";
      _showAlertBox = true;
      notifyListeners();
    }
  }

int _pageNoForPayment=0;

  int get pageNoForPayment => _pageNoForPayment;

  set pageNoForPayment(int value) {
    _pageNoForPayment = value;
  }

  void decrementPage(){
    _pageNoForPayment--;
    notifyListeners();
  }

  void incrementPage(){
    _pageNoForPayment++;
    notifyListeners();
  }

  bool _showLoading=true;

  bool get showLoading => _showLoading;

  set showLoading(bool value) {
    _showLoading = value;
  }

  Future<void> getPastPaymentList(BuildContext context) async {
    showAlertBox = false;
    try {
      QRCodeDataProvider qrCodeData =
          Provider.of<QRCodeDataProvider>(context, listen: false);
      String url =
          'https://school360.app/${qrCodeData.schoolId}/service_bridge/getAllStudentFeeReceiptByStudent';
      http.Response response = await http.post(Uri.parse(url), body: {
        "security_pin": '311556',
        "row_per_page": 10.toString(),
        "segment": _pageNoForPayment.toString(),
        "student_code": qrCodeData.studentId.toString(),
      });
      String data = response.body;
      if (data.isEmpty) {
        alertBoxText = 'No data found';
        alertBoxTitle = 'ERROR';
        alertBoxButtonTitle = "Retry";
        alertBoxButtonAction = "Retry";
        _showAlertBox = true;
        return;
      } else {
        var data1 = jsonDecode(data);
        if (data1["status"] == "error") {
          alertBoxText = 'An Error occurred, please try again! :)';
          alertBoxTitle = 'ERROR';
          alertBoxButtonTitle = "Retry";
          alertBoxButtonAction = "Retry";
          _showAlertBox = true;
          notifyListeners();
          return;
        }
        dataModelForPastPayment = DataModelForPastPayment.fromJson(data1);
        if (dataModelForPastPayment.status == "success") {
          notifyListeners();
          return;
        } else {
          alertBoxText = 'An Error occurred, please try again! :)';
          alertBoxTitle = 'ERROR';
          alertBoxButtonTitle = "Retry";
          alertBoxButtonAction = "Retry";
          _showAlertBox = true;
          notifyListeners();
          return;
        }
      }
    } on SocketException {
      alertBoxText =
          'Sorry. No working internet connection detected. Please try again later. :)';
      alertBoxTitle = 'Error: 404';
      alertBoxButtonTitle = "Retry";
      alertBoxButtonAction = "Retry";
      _showAlertBox = true;
      notifyListeners();
      return;
    } catch (e) {
      showAlertBox = true;
      notifyListeners();
    }
  }

  late DataModelForDashboardAttendance dataModelForDashboardAttendance;
  Future<void> getDashboardAttendance(BuildContext context) async {
    showAlertBox = false;
    try {
      QRCodeDataProvider qrCodeData =
          Provider.of<QRCodeDataProvider>(context, listen: false);
      String url =
          'https://school360.app/${qrCodeData.schoolId}/service_bridge/getStudentAttendanceSummaryByYear';
      http.Response response = await http.post(Uri.parse(url), body: {
        "security_pin": '311556',
        "year": DateFormat('yyyy').format(DateTime.now()).toString(),
        "student_code": qrCodeData.studentId.toString(),
      });
      String data = response.body;
      if (data.isEmpty) {
        alertBoxText = 'No data found';
        alertBoxTitle = 'ERROR';
        alertBoxButtonTitle = "Retry";
        alertBoxButtonAction = "Retry";
        _showAlertBox = true;
        return;
      } else {
        var data1 = jsonDecode(data);
        if (data1["status"] == "error") {
          data =
              '''{ "status": "success", "data": {"total_working_days": "0", "total_present_days": "0","total_holidays": 0,"total_leave_days": "0","total_absent_days": 0 }, "message": "Successfully Data Found"}''';
          data1 = jsonDecode(data);
        }
        dataModelForDashboardAttendance =
            DataModelForDashboardAttendance.fromJson(data1);
        if (dataModelForDashboardAttendance.status == "success") {
          return;
        } else {
          alertBoxText = 'An Error occurred, please try again! :)';
          alertBoxTitle = 'ERROR';
          alertBoxButtonTitle = "Retry";
          alertBoxButtonAction = "Retry";
          _showAlertBox = true;
          notifyListeners();
          return;
        }
      }
    } on SocketException {
      alertBoxText =
          'Sorry. No working internet connection detected. Please try again later. :)';
      alertBoxTitle = 'Error: 404';
      alertBoxButtonTitle = "Retry";
      alertBoxButtonAction = "Retry";
      _showAlertBox = true;
      notifyListeners();
      return;
    } catch (e) {
      print(e);
      showAlertBox = true;
      notifyListeners();
    }
  }
}
