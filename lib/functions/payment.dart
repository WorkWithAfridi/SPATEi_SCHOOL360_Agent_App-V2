import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerz/model/SSLCTransactionInfoModel.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:school_360_app/model/payment/data_model_for_normal_payment_approve_status.dart';
import 'package:school_360_app/model/payment/data_model_for_payment_gateway_credential.dart';
import 'package:school_360_app/model/payment/data_model_for_payslip_approve.dart';
import 'package:school_360_app/provider/invoice.dart';
import 'package:school_360_app/view/transaction_status/transaction_error_screen.dart';
import 'package:school_360_app/view/transaction_status/transaction_success_screen.dart';

class Payment {
  late String _id;
  late String _pw;
  Payment() {
    _id = "";
    _pw = "";
  }

  Future<void> _getPaymentGatewayCredential(String url) async {
    http.Response response =
        await http.post(Uri.parse(url), body: {"security_pin": '311556'});
    String data = response.body;
    if (data.isEmpty) {
      //TODO: showError
    } else {
      var dataDecoded = jsonDecode(data);
      PaymentGatewayCredentialAPI paymentGatewayCredentialAPI =
          PaymentGatewayCredentialAPI.fromJson(dataDecoded);
      if (paymentGatewayCredentialAPI.status == "success") {
        _id = paymentGatewayCredentialAPI.gatewayInfo![0].sslUserId!;
        _pw = paymentGatewayCredentialAPI.gatewayInfo![0].sslPassword!;
      } else {
        //TODO: showError
      }
    }
  }

  Future<void> sslCommerzGeneralCall_LIVE({
    required double total,
    required String receipt_no,
    required BuildContext context,
    required String getPaymentGatewayCredential_url,
    required String schoolId,
    required String mode,
    required String studentCode,
    required String year,
    required String month,
  }) async {
    await _getPaymentGatewayCredential(getPaymentGatewayCredential_url);
    Sslcommerz sslcommerz = Sslcommerz(
      initializer: SSLCommerzInitialization(
        //For Test
        // ipn_url: "www.ipnurl.com",
        // multi_card_name: "visa,master,bkash",
        // currency: SSLCurrencyType.BDT,
        // product_category: "Food",
        // sdkType: SSLCSdkType.TESTBOX,
        // store_id: "testbox",
        // store_passwd: "qwerty",
        // total_amount: 10,
        // tran_id: "1231321321321312",

        //For Live
        currency: SSLCurrencyType.BDT,
        product_category: "Bill",
        sdkType: SSLCSdkType.LIVE,
        store_id: _id,
        store_passwd: _pw,
        total_amount: total,
        tran_id: "${DateTime.now()}${receipt_no}",
      ),
    );

    var result = await sslcommerz.payNow();

    if (result is PlatformException) {
      print("the response is: " +
          result.message.toString() +
          " code: " +
          result.code);
    } else {
      SSLCTransactionInfoModel model = result;
      if (mode == 'PaySlipPayment') {
        _checkPayslipApproveStatus(
            schoolId: schoolId, receipt_no: receipt_no, context: context);
      }
      if (mode == 'NormalPayment') {
        _checkNormalPaymentApproveStatus(
            context: context,
            studentId: studentCode,
            schoolId: schoolId,
            year: year,
            month: month,
            transaction_id: model.tranId.toString(),
            card_no: model.cardNo.toString(),
            card_option: model.cardType.toString());
      }
    }
  }

  void _checkPayslipApproveStatus(
      {required String schoolId,
      required String receipt_no,
      required BuildContext context}) async {
    String url =
        'https://school360.app/${schoolId}/service_bridge/paySlipApproveByReceiptNo';
    http.Response response = await http.post(Uri.parse(url), body: {
      "security_pin": '311556',
      "receipt_no": receipt_no,
    });
    //TODO: Collection Id, use this id to get invoice.
    String data = response.body;
    if (data.isEmpty) {
      //TODO: showError
    } else {
      var dataDecoded = jsonDecode(data);
      PayslipApproveAPI payslipApproveAPI =
          PayslipApproveAPI.fromJson(dataDecoded);
      if (payslipApproveAPI.status == "success") {
        Navigator.of(context).pushNamed(TransactionSuccess.routeName);
      } else {
        Navigator.of(context).pushNamed(TransactionError.routeName);
      }
    }
  }

  void _checkNormalPaymentApproveStatus(
      {required String studentId,
      required String schoolId,
      required String year,
      required String month,
      required String transaction_id,
      required String card_no,
      required String card_option,
      required BuildContext context}) async {
    try {
      String url =
          'https://school360.app/${schoolId}/service_bridge/completePaymentByMonthAndStudentCode';
      http.Response response = await http.post(Uri.parse(url), body: {
        "security_pin": '311556',
        "student_code": studentId,
        "year": year,
        "months": month,
        "transaction_id": transaction_id,
        "card_no": card_no,
        "card_option": card_option,
      });
      String data = response.body;
      if (data.isEmpty) {
        //TODO: showError
      } else {
        var dataDecoded = jsonDecode(data);
        print(dataDecoded);
        // print(dataDecoded);
        DataModelForNormalPaymentApproveStatus
            dataModelForNormalPaymentApproveStatus =
            DataModelForNormalPaymentApproveStatus.fromJson(dataDecoded);
        if (dataModelForNormalPaymentApproveStatus.status == "success") {
          InvoiceProvider invoiceProvider =
              Provider.of<InvoiceProvider>(context, listen: false);
          invoiceProvider.collection_id =
              dataDecoded["collection_id"].toString();
          Navigator.of(context)
              .pushReplacementNamed(TransactionSuccess.routeName);
        } else {
          Navigator.of(context)
              .pushReplacementNamed(TransactionError.routeName);
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
