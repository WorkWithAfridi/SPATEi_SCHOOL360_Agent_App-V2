import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:school_360_app/provider/qrcode_data.dart';
import 'package:school_360_app/model/notebook/data_model_for_notebook.dart';
import 'package:school_360_app/view/school_hub/tabs/notebook/notebook_list.dart';

import 'package:flutter/scheduler.dart';

class NotebookProvider extends ChangeNotifier {
  NotebookProvider();

  late DataModelForNotebook _dataModelForNotebook;
  DataModelForNotebook get dataModelForNotebook => _dataModelForNotebook;

  late String _pickedDate =
      DateFormat('yyyy-MM-dd').format(DateTime.now()).toString();
  String get pickedDate => _pickedDate;
  set pickedDate(String value) {
    _pickedDate = value;
    notifyListeners();
  }

  bool _showNotbookPage = false;
  bool get showNotbookPage => _showNotbookPage;
  set showNotbookPage(bool value) {
    _showNotbookPage = value;
    notifyListeners();
  }

  bool _showNotebookList = false;
  bool get showNotebookList => _showNotebookList;
  set showNotebookList(bool value) {
    _showNotebookList = value;
    notifyListeners();
  }

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  set selectedIndex(int value) {
    _selectedIndex = value;
  }

  String alertBoxText = '';
  String alertBoxTitle = '';
  String alertBoxButtonTitle = '';
  String alertBoxButtonAction = '';

  bool _showAlertBox = false;
  bool get showAlertBox => _showAlertBox;
  set showAlertBox(bool value) {
    _showAlertBox = value;
  }

  bool _showLoading = false;
  bool get showLoading => _showLoading;
  set showLoading(bool value) {
    _showLoading = value;
    notifyListeners();
  }

  Future<void> getNotebookData(BuildContext context) async {
    try {
      QRCodeDataProvider qrCodeData =
          Provider.of<QRCodeDataProvider>(context, listen: false);
      String url =
          'https://school360.app/${qrCodeData.schoolId}/service_bridge/getNoteBookListByDate';
      http.Response response = await http.post(Uri.parse(url), body: {
        "security_pin": '311556',
        "student_code": qrCodeData.studentId,
        "date": _pickedDate,
      });
      String data = response.body;
      if (data.isEmpty) {
        showLoading = false;
        alertBoxText =
            'No data found. Please contact your local administration for more information.';
        alertBoxTitle = 'Alert';
        alertBoxButtonTitle = "Close";
        alertBoxButtonAction = "Close-StatusError";
        _showAlertBox = true;
        notifyListeners();
        return;
      } else {
        var decodedData = jsonDecode(data);
        if (decodedData["status"] == 'error') {
          showLoading = false;
          alertBoxText =
              'No data found. Please stand by for more assignments. :)';
          alertBoxTitle = 'Alert';
          alertBoxButtonTitle = "Close";
          alertBoxButtonAction = "Close-StatusError";
          _showAlertBox = true;
          notifyListeners();
          return;
        }
        _dataModelForNotebook = DataModelForNotebook.fromJson(decodedData);
        if (_dataModelForNotebook.status == 'success') {
          showLoading=false;
          SchedulerBinding.instance?.addPostFrameCallback((_) {
            Navigator.of(context).pushNamed(NotebookList.routeName);
          });
          // Navigator.of(context).pushNamed(NotebookList.routeName);
        }
      }
    } on SocketException {
      showLoading = false;
      alertBoxText =
          'Sorry. No working internet connection detected. Please try again later. :)';
      alertBoxTitle = 'Error: 404';
      alertBoxButtonTitle = "Retry";
      alertBoxButtonAction = "Close-NoInternetList";
      _showAlertBox = true;
      notifyListeners();
      return;
    } catch (e) {
      showLoading = false;
      alertBoxText = 'An error occurred.';
      alertBoxTitle = 'ERROR';
      alertBoxButtonTitle = "Close";
      alertBoxButtonAction = "Close";
      _showAlertBox = true;
      print(e);
      notifyListeners();
      return;
    }
  }

  // void showSnackbar(String text, BuildContext context) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(text),
  //     ),
  //   );
  // }
}
