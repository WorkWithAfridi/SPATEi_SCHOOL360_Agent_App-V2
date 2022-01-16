import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:school_360_app/model/dropdown_list/data_model_for_month_drop_down.dart';
import 'package:school_360_app/model/dropdown_list/data_model_for_year_dropdown_list.dart';
import 'package:school_360_app/model/payment/data_model_for_payment_fees.dart';
import 'package:school_360_app/provider/qrcode_data.dart';

class SchoolHubPaymentProvider extends ChangeNotifier {
  SchoolHubPaymentProvider();

  String alertBoxText = '';
  String alertBoxTitle = '';
  String alertBoxButtonTitle = '';
  String alertBoxButtonAction = '';

  bool _showLoading = true;
  bool get showLoading => _showLoading;
  set showLoading(bool value) {
    _showLoading = value;
    notifyListeners();
  }

  bool _showLoadingForStepTwo = true;

  bool get showLoadingForStepThree => _showLoadingForStepTwo;

  set showLoadingForStepThree(bool value) {
    _showLoadingForStepTwo = value;
    notifyListeners();
  }

  bool _showAlertBox = false;
  bool get showAlertBox => _showAlertBox;
  set showAlertBox(bool value) {
    _showAlertBox = value;
    notifyListeners();
  }

  var months = <String>[
    'Select month',
  ];

  late String _selectedMonth = 'Select month';

  String get selectedMonth => _selectedMonth;

  set selectedMonth(String value) {
    _selectedMonth = value;
    notifyListeners();
  }

  bool _showLoadingForMonthDropDown = true;

  bool get showLoadingForMonthDropDown => _showLoadingForMonthDropDown;

  set showLoadingForMonthDropDown(bool value) {
    _showLoadingForMonthDropDown = value;
    notifyListeners();
  }

  DataModelForMonthDropDown monthDropDownList = DataModelForMonthDropDown();

  void ExtractMonthFromMonthDropDownApi() {
    months = [
      'Select month',
    ];
    int len = monthDropDownList.months!.length;
    for (int i = 0; i < len; i++) {
      months.add(monthDropDownList.months![i].monthName.toString());
    }
    showLoadingForMonthDropDown = false;
  }

  Future<void> callApiForMonthDropdownList(BuildContext context) async {
    try {
      QRCodeDataProvider qrCodeData =
          Provider.of<QRCodeDataProvider>(context, listen: false);
      String url =
          'https://school360.app/${qrCodeData.schoolId}/service_bridge/getMonthsByYearStudentCode';

      http.Response response = await http.post(Uri.parse(url),
          body: {"security_pin": '311556', "student_code" : qrCodeData.studentId, "year": selectedYear});
      print(selectedYear);
      String data = response.body;
      if (data.isEmpty) {
        showLoading = false;
        alertBoxText =
            'An Error occurred while trying to fetch the data! Please try scanning the ID again!';
        alertBoxTitle = 'Alert';
        alertBoxButtonTitle = "Close";
        alertBoxButtonAction = "Close";
        _showAlertBox = true;
        return;

      } else {
        var decodedData = jsonDecode(data);
        if(decodedData["status"]=="error"){
          showLoading = false;
          alertBoxText = decodedData["message"];
          alertBoxTitle = 'Attention';
          alertBoxButtonTitle = "Close";
          alertBoxButtonAction = "Close-monthError";
          _showAlertBox = true;
          return;
        }
        monthDropDownList = DataModelForMonthDropDown.fromJson(decodedData);
        if (yearDropdownList.status == 'success') {
          ExtractMonthFromMonthDropDownApi();
        } else {
          showLoading = false;
          alertBoxText = 'An Error occurred while trying to fetch the data!';
          alertBoxTitle = 'Alert';
          alertBoxButtonTitle = "Close";
          alertBoxButtonAction = "Close";
          _showAlertBox = true;
          return;
        }
      }
    } on SocketException {
      showLoading = false;
      alertBoxText =
          'Sorry. No working internet connection detected. Please try again later. :)';
      alertBoxTitle = 'Error: 404';
      alertBoxButtonTitle = "Retry";
      alertBoxButtonAction = "Close-yearNoInternet";
      _showAlertBox = true;
      return;
    } catch (e) {
      print(e);
      showLoading = false;
      alertBoxText = 'An Error occurred while trying to fetch the data!';
      alertBoxTitle = 'Alert';
      alertBoxButtonTitle = "Close";
      alertBoxButtonAction = "Close";
      _showAlertBox = true;
      return;
    }
  }

  late String _selectedYear = 'Select academic year';

  String get selectedYear => _selectedYear;

  set selectedYear(String value) {
    _selectedYear = value;
    notifyListeners();
  }

  var years = <String>[
    'Select academic year',
  ];

  void ExtractYearFromYearDropDownApi() {
    years = <String>[
      'Select academic year',
    ];
    int len = yearDropdownList.yearData!.length;
    for (int i = 0; i < len; i++) {
      years.add(yearDropdownList.yearData![i].value.toString());
    }
    showLoading = false;
  }

  DataModelForYearDropDown yearDropdownList = DataModelForYearDropDown();

  Future<void> callApiForYearDropdownList(BuildContext context) async {
    try {
      QRCodeDataProvider qrCodeData =
          Provider.of<QRCodeDataProvider>(context, listen: false);
      String url =
          'https://school360.app/${qrCodeData.schoolId}/service_bridge/yearListData';

      http.Response response = await http.post(Uri.parse(url), body: {
        "security_pin": '311556',
      });
      String data = response.body;
      if (data.isEmpty) {
        showLoading = false;
        alertBoxText =
            'An Error occurred while trying to fetch the data! Please try scanning the ID again!';
        alertBoxTitle = 'Alert';
        alertBoxButtonTitle = "Close";
        alertBoxButtonAction = "Close";
        _showAlertBox = true;
        return;
      } else {
        var decodedData = jsonDecode(data);
        yearDropdownList = DataModelForYearDropDown.fromJson(decodedData);
        if (yearDropdownList.status == 'success') {
          ExtractYearFromYearDropDownApi();
        } else {
          showLoading = false;
          alertBoxText = 'An Error occurred while trying to fetch the data!';
          alertBoxTitle = 'Alert';
          alertBoxButtonTitle = "Close";
          alertBoxButtonAction = "Close";
          _showAlertBox = true;
          return;
        }
      }
    } on SocketException {
      showLoading = false;
      alertBoxText =
          'Sorry. No working internet connection detected. Please try again later. :)';
      alertBoxTitle = 'Error: 404';
      alertBoxButtonTitle = "Retry";
      alertBoxButtonAction = "Close-yearNoInternet";
      _showAlertBox = true;
      return;
    } catch (e) {
      showLoading = false;
      alertBoxText = 'An Error occurred while trying to fetch the data!';
      alertBoxTitle = 'Alert';
      alertBoxButtonTitle = "Close";
      alertBoxButtonAction = "Close";
      _showAlertBox = true;
      return;
    }
  }

  late FeesData data_model_for_fees;
  late int total;

  int? getMonthInNum() {
    int? monthId =0;
    monthDropDownList.months!.firstWhere((element){
      if(element.monthName==selectedMonth){
        monthId=element.monthNo;
        return true;
      }
      return false;
    });
    return monthId;
  }

  void getFeeDetails(BuildContext context) async {
    try {
      QRCodeDataProvider qrCodeData =
          Provider.of<QRCodeDataProvider>(context, listen: false);
      String url =
          'https://school360.app/${qrCodeData.schoolId}/service_bridge/getFeesByMonthAndStudentCode';
      print(url);
      print(qrCodeData.studentId);
      print(getMonthInNum().toString());
      print(_selectedYear);

      http.Response response = await http.post(Uri.parse(url), body: {
        "security_pin": '311556',
        "student_code": qrCodeData.studentId,
        "months": getMonthInNum().toString(),
        "year": _selectedYear
      });
      String data = response.body;
      print(qrCodeData.studentId);
      print(getMonthInNum().toString());
      print(_selectedYear);
      // print(data);
      if (data.isEmpty) {
        alertBoxTitle = 'Attention';
        alertBoxText =
            'An Error occurred while trying to fetch the data! Please try scanning the ID again or contact your administration for more information.';
        alertBoxButtonTitle = 'Close';
        alertBoxButtonAction = "Close, move to step 1";
        showAlertBox = true;
        return;
      } else {
        var decodedData = jsonDecode(data);
        if (decodedData["status"] == "error") {
          alertBoxTitle = 'Attention';
          alertBoxText = decodedData["message"];
          alertBoxButtonTitle = 'Close';
          alertBoxButtonAction = "Close, move to step 1";
          showAlertBox = true;
          return;
        }
        data_model_for_fees = FeesData.fromJson(decodedData);
        if (data_model_for_fees.status == 'success') {
          total = 0;
          for (int i = 0;
              i < data_model_for_fees.fees_data.allocated_list.length;
              i++) {
            total += data_model_for_fees.fees_data.allocated_list[i]
                    .actual_allocated_amount_for_this_student -
                data_model_for_fees
                    .fees_data.allocated_list[i].already_paid_amount;
          }
          if (total != 0) {
            showLoadingForStepThree = false;
          } else {
            alertBoxTitle = 'Attention';
            alertBoxText = "No bill found for $selectedMonth";
            alertBoxButtonTitle = 'Close';
            alertBoxButtonAction = "Close, move to step 1";
            showAlertBox = true;
            return;
          }
        } else {
          showLoading = false;
          alertBoxText = 'An error occurred.';
          alertBoxTitle = 'ERROR';
          alertBoxButtonTitle = "Close";
          alertBoxButtonAction = "Close";
          _showAlertBox = true;
          return;
        }
      }
    } on SocketException {
      showLoading = false;
      alertBoxText =
          'Sorry. No working internet connection detected. Please try again later. :)';
      alertBoxTitle = 'Error: 404';
      alertBoxButtonTitle = "Retry";
      alertBoxButtonAction = "Close-getFeesData";
      _showAlertBox = true;
      return;
    } catch (e) {
      showLoading = false;
      alertBoxText = 'An error occurred//.';
      alertBoxTitle = 'ERROR';
      alertBoxButtonTitle = "Close";
      alertBoxButtonAction = "Close";
      _showAlertBox = true;
      notifyListeners();
      return;
    }
  }
}
