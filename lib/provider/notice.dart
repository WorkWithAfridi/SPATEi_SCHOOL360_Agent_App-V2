import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:school_360_app/model/data_model_for_notice.dart';
import 'package:school_360_app/provider/qrcode_data.dart';

class NoticeProvider extends ChangeNotifier {
  NoticeProvider();

  String alertBoxText = '';
  String alertBoxTitle = '';
  String alertBoxButtonTitle = '';
  String alertBoxButtonAction = '';

  bool _showAlertBox = false;
  bool get showAlertBox => _showAlertBox;
  set showAlertBox(bool value) {
    _showAlertBox = value;
  }

  bool _showLoading = true;
  bool get showLoading => _showLoading;
  set showLoading(bool value) {
    _showLoading = value;
    notifyListeners();
  }

  late DataModelForNotice _dataModelForNotice;
  DataModelForNotice get dataModelForNotice => _dataModelForNotice;

  int _pageNo = 0;

  set pageNo(int value) {
    _pageNo = value;
  }

  int get pageNo => _pageNo;
  void incrementPage() {
    _pageNo++;
    notifyListeners();
  }

  void decrementPage() {
    if (_pageNo >= 0) {
      _pageNo--;
      notifyListeners();
    }
  }

  Future<void> getNotice(BuildContext context) async {
    _showLoading=true;
    // showLoading=true;
    try {
      QRCodeDataProvider qrCodeData =
          Provider.of<QRCodeDataProvider>(context, listen: false);
      String url =
          'https://school360.app/${qrCodeData.schoolId}/service_bridge/getAllNotice';
      http.Response response = await http.post(Uri.parse(url), body: {
        "security_pin": '311556',
        "row_per_page": 15.toString(),
        "segment": pageNo.toString()
      });
      String data = response.body;
      if (data.isEmpty) {
        showAlertBox = true;
        notifyListeners();
        return;
      } else {
        var data1 = jsonDecode(data);
        if (data1["is_success"] == false) {
          showLoading = false;
          alertBoxText = 'You are all caught up! :)';
          alertBoxTitle = 'End of List';
          alertBoxButtonTitle = "Close";
          pageNo = pageNo - 1;
          alertBoxButtonAction = "Close-EndOfPage";
          _showAlertBox = true;
          notifyListeners();
          return;
        }
        _dataModelForNotice = DataModelForNotice.fromJson(data1);
        if (dataModelForNotice.isSuccess == true) {
          showLoading = false;
          notifyListeners();
        } else {
          showAlertBox = true;
          notifyListeners();
        }
      }
    } on SocketException {
      showLoading = false;
      alertBoxText =
          'Sorry. No working internet connection detected. Please try again later. :)';
      alertBoxTitle = 'Error: 404';
      alertBoxButtonTitle = "Retry";
      alertBoxButtonAction = "Retry-NoInternetConnection";
      _showAlertBox = true;
      notifyListeners();
      return;
    } catch (e) {
      showAlertBox = true;
      notifyListeners();
    }
  }
}
