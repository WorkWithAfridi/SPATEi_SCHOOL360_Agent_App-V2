import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_360_app/functions/open_webview.dart';
import 'package:school_360_app/provider/appData.dart';
import 'package:school_360_app/provider/attendance.dart';
import 'package:school_360_app/provider/dashboard.dart';
import 'package:school_360_app/provider/invoice.dart';
import 'package:school_360_app/provider/notebook.dart';
import 'package:school_360_app/provider/notice.dart';
import 'package:school_360_app/provider/qrcode_data.dart';
import 'package:school_360_app/provider/result.dart';
import 'package:school_360_app/provider/school_hub_payment.dart';
import 'package:school_360_app/view/home_screen.dart';
import 'package:school_360_app/view/school_hub/payment_receipts.dart';
import 'package:school_360_app/view/school_hub/tabs/attendance/AttendanceReport_Table.dart';
import 'package:school_360_app/view/school_hub/tabs/attendance/FM_Table.dart';
import 'package:school_360_app/view/school_hub/tabs/notebook/notebook_list.dart';
import 'package:school_360_app/view/school_hub/tabs/notebook/notebook_page.dart';
import 'package:school_360_app/view/school_hub/tabs/payment/payment_details_page.dart';
import 'package:school_360_app/view/school_hub/tabs/result/resultCard_Page.dart';
import 'package:school_360_app/view/transaction_status/transaction_error_screen.dart';
import 'package:school_360_app/view/transaction_status/transaction_success_screen.dart';
import 'package:school_360_app/view/school_hub/school_hub_screen.dart';

import 'view/pay_slip_payment/payment_summary_screen.dart';
import 'view/scanner/scanner_screen.dart';
import 'view/splashscreen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => QRCodeDataProvider()),
        ChangeNotifierProvider(create: (context) => NoticeProvider()),
        ChangeNotifierProvider(create: (context) => NotebookProvider()),
        ChangeNotifierProvider(create: (context) => ResultProvider()),
        ChangeNotifierProvider(create: (context) => AttendanceProvider()),
        ChangeNotifierProvider(create: (context) => AppData()),
        ChangeNotifierProvider(create: (context) => SchoolHubPaymentProvider()),
        ChangeNotifierProvider(create: (context) => DashboardProvider()),
        ChangeNotifierProvider(create: (context) => InvoiceProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.black.withOpacity(.8),
            secondary: Color(0xffFF284C),
            onBackground: Color(0xff212121),
            background: Color(0xffEDECEF),
          ),
        ),
        initialRoute: SplashScreen.routeName,
        routes: {
          Homepage.routeName: (context) => Homepage(),
          SplashScreen.routeName: (context) => const SplashScreen(),
          QRScanner.routeName: (context) => const QRScanner(),
          PaymentSummary.routeName: (context) => const PaymentSummary(),
          TransactionSuccess.routeName: (context) => TransactionSuccess(),
          TransactionError.routeName: (context) => TransactionError(),
          OpenWebView.routeName: (context) => const OpenWebView(),
          SchoolHub.routeName: (context) => const SchoolHub(),
          NotebookList.routeName: (context) => NotebookList(),
          NotebookPage.routeName: (context) => NotebookPage(),
          ResultCardPage.routeName: (context) => ResultCardPage(),
          FMTable_Page.routeName: (context) => FMTable_Page(),
          AttendanceReportTable_Page.routeName: (context) =>
              AttendanceReportTable_Page(),
          PaymentDetailsPage.routeName: (context) => const PaymentDetailsPage(),
          PaymentReceiptPage.routeName: (context) => const PaymentReceiptPage(),
        },
      ),
    );
  }
}
