import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:school_360_app/functions/invoice/file_handle_api.dart';
import 'package:school_360_app/functions/invoice/pdf_invoice_api.dart';
import 'package:school_360_app/model/invoice/data_model_for_invoice.dart';
import 'package:school_360_app/provider/qrcode_data.dart';
import 'package:http/http.dart' as http;

class InvoiceProvider extends ChangeNotifier {
  late DataModelForInvoice dataModelForInvoice;
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

  late String _collection_id;

  String get collection_id => _collection_id;

  set collection_id(String value) {
    _collection_id = value;
  }

  Future<void> getInvoice(BuildContext context) async {
    _showLoading = true;
    // showLoading=true;
    // try {
      QRCodeDataProvider qrCodeData =
          Provider.of<QRCodeDataProvider>(context, listen: false);
      String url =
          'https://school360.app/${qrCodeData.schoolId}/service_bridge/getCollectionDetailsForInvoice';
      http.Response response = await http.post(Uri.parse(url), body: {
        "security_pin": '311556',
        "collection_id": collection_id,
      });
      String data = response.body;
      if (data.isEmpty) {
        showAlertBox = true;
        notifyListeners();
        return;
      } else {
        var data1 = jsonDecode(data);
        print('--------------------------');
        dataModelForInvoice = DataModelForInvoice.fromJson(data1);
        print('--------------------------');
        if (dataModelForInvoice.status == "success") {
          showLoading = false;
          // generate pdf file
          final pdfFile = await PdfInvoiceApi.generate(context);

          // opening the pdf file
          FileHandleApi.openFile(pdfFile);
        } else {
          showAlertBox = true;
          notifyListeners();
        }
      }
    // } on SocketException {
    //   showLoading = false;
    //   alertBoxText =
    //       'Sorry. No working internet connection detected. Please try again later. :)';
    //   alertBoxTitle = 'Error: 404';
    //   alertBoxButtonTitle = "Retry";
    //   alertBoxButtonAction = "Retry-NoInternetConnection";
    //   _showAlertBox = true;
    //   notifyListeners();
    //   return;
    // } catch (e) {
    //   print(e);
    //   showAlertBox = true;
    //   notifyListeners();
    // }
  }
}
