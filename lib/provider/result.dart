import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:school_360_app/model/dropdown_list/data_model_for_year_dropdown_list.dart';
import 'package:school_360_app/model/result/data_model_for_result.dart';
import 'package:school_360_app/provider/qrcode_data.dart';
import 'package:http/http.dart' as http;
import 'package:school_360_app/view/school_hub/tabs/result/resultCard_Page.dart';

class ResultProvider extends ChangeNotifier {
  ResultProvider();

  late DataModelForResult dataModelForResult;

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

  bool _showAlertBox = false;
  bool get showAlertBox => _showAlertBox;
  set showAlertBox(bool value) {
    _showAlertBox = value;
    notifyListeners();
  }

  late String _selectedYear = 'Select year';

  String get selectedYear => _selectedYear;

  set selectedYear(String value) {
    _selectedYear = value;
  }
  var years = <String>[
    'Select year',
  ];

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
        alertBoxButtonAction = "Close-year";
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
          alertBoxButtonAction = "Close-year";
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
      alertBoxButtonAction = "Close-year";
      _showAlertBox = true;
      return;
    } catch (e) {
      showLoading = false;
      alertBoxText = 'An error occurred.';
      alertBoxTitle = 'ERROR';
      alertBoxButtonTitle = "Close";
      alertBoxButtonAction = "Close";
      _showAlertBox = true;
      notifyListeners();
      return;}
  }

  void ExtractYearFromYearDropDownApi() {
    years = <String>[
      'Select year',
    ];
    int len = yearDropdownList.yearData!.length;
    for (int i = 0; i < len; i++) {
      years.add(yearDropdownList.yearData![i].value.toString());
    }
    showLoading=false;
  }

  bool _showLoadingForResultPage=false;

  bool get showLoadingForResultPage => _showLoadingForResultPage;

  set showLoadingForResultPage(bool value) {
    _showLoadingForResultPage = value;
    notifyListeners();
  }

  Future<void> getResult(BuildContext context) async {
    try {
      QRCodeDataProvider qrCodeData =
          Provider.of<QRCodeDataProvider>(context, listen: false);
      String url =
          'https://school360.app/${qrCodeData.schoolId}/service_bridge/getResultListByStudentCode';
      http.Response response = await http.post(Uri.parse(url), body: {
        "security_pin": '311556',
        "student_code": qrCodeData.studentId,
        "year": _selectedYear
      });
      String dataFromResultResponse = response.body;
      if (dataFromResultResponse.isNotEmpty) {
        var jsonFormattedDataForResult = jsonDecode(dataFromResultResponse);
        dataModelForResult =
            DataModelForResult.fromJson(jsonFormattedDataForResult);
        showLoading = false;
        if (dataModelForResult.status == "success") {
          showLoadingForResultPage=false;
          Navigator.of(context).pushNamed(ResultCardPage.routeName);
          //nav push to result
        } else {
          showLoadingForResultPage=false;
          alertBoxText =
              'An Error occurred while trying to fetch the data! Please try scanning the ID again or contact your administration for more information.';
          alertBoxTitle = 'Alert';
          alertBoxButtonTitle = "Close";
          alertBoxButtonAction = "Close-Result";
          _showAlertBox = true;
          return;
        }
      } else {
        showLoadingForResultPage=false;
        alertBoxText = 'An Error occurred while trying to fetch the data!';
        alertBoxTitle = 'Alert';
        alertBoxButtonTitle = "Close";
        alertBoxButtonAction = "Close-Result";
        _showAlertBox = true;
        return;
      }
    } on SocketException {
      showLoadingForResultPage=false;
      alertBoxText =
          'Sorry. No working internet connection detected. Please try again later. :)';
      alertBoxTitle = 'Error: 404';
      alertBoxButtonTitle = "Retry";
      alertBoxButtonAction = "Close-NoInternetConnectionResult";
      _showAlertBox = true;
      return;
    } catch (e) {
      showLoadingForResultPage=false;
      alertBoxText = 'An error occurred.';
      alertBoxTitle = 'ERROR';
      alertBoxButtonTitle = "Close";
      alertBoxButtonAction = "Close-error";
      _showAlertBox = true;
      return;
    }
  }
}
