import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:school_360_app/functions/payment.dart';
import 'package:school_360_app/provider/appData.dart';

import '../../model/payment/data_model_for_pay_slip_payment.dart';

class PaymentSummary extends StatefulWidget {
  static const routeName = '/payment-summary';
  const PaymentSummary({Key? key}) : super(key: key);

  @override
  _PaymentSummaryState createState() => _PaymentSummaryState();
}

class _PaymentSummaryState extends State<PaymentSummary> {
  DataModelForPaySlipPayment _dataModel = DataModelForPaySlipPayment();
  late String _schoolId;

  late TextStyle headerTextStyleBlack;
  late TextStyle headerTextStyleWhite;
  late TextStyle normalTextStyle;
  late TextStyle normalHighLightTextStyle;
  late AppData appData;
  void getData() {
    appData = Provider.of<AppData>(context, listen: false);
    headerTextStyleBlack = appData.headerTextStyleBlack;
    headerTextStyleWhite = appData.headerTextStyleWhite;
    normalTextStyle = appData.normalTextStyle;
    normalHighLightTextStyle = appData.normalHighLightTextStyle;
  }

  @override
  void initState() {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    var routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    _dataModel = routeArgs['dataModel'] as DataModelForPaySlipPayment;
    _schoolId = routeArgs['schoolId'] as String;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          elevation: 6,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).colorScheme.background,
              size: 25,
            ),
          ),
          centerTitle: true,
          title: Text(
            'PAYMENT INFO.',
            style: GoogleFonts.getFont(
              'Ubuntu',
              textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Theme.of(context).colorScheme.background,
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        children: [
          _background(),
          _paymentSummaryPage(context),
          Positioned(
            bottom: 0,
            left: 0,
            child: bottomProceedToCheckoutNavbar(context),
          )
        ],
      ),
    );
  }

  GestureDetector bottomProceedToCheckoutNavbar(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Payment makePayment = Payment();
        makePayment.sslCommerzGeneralCall_LIVE(
            studentCode: '000',
            year: '000',
            month: '0',
            mode: 'PaySlipPayment',
            schoolId: _schoolId,
            total: double.parse(
                _dataModel.data!.paymentInfo![0].totalPaidAmount.toString()),
            receipt_no: _dataModel.data!.paymentInfo![0].receiptNo.toString(),
            context: context,
            getPaymentGatewayCredential_url:
                'https://school360.app/$_schoolId/service_bridge/getSSLPaymentGatewayCredential');
      },
      child: Container(
        height: 40,
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).colorScheme.secondary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Proceed to Checkout',
                style: GoogleFonts.getFont(
                  'Ubuntu',
                  textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.background),
                ),
              ),
              const SizedBox(
                width: 3,
              ),
              Icon(
                FontAwesomeIcons.arrowRight,
                size: 16,
                color: Theme.of(context).colorScheme.background,
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _background() {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: GridPaper(
        color: Colors.red.withOpacity(0.1),
        divisions: 2,
        interval: 200,
        subdivisions: 8,
      ),
    );
  }

  SizedBox _paymentSummaryPage(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      // color: Colors.red,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _paymentSummaryView(context),
                  const SizedBox(
                    height: 10,
                  ),
                  _billSummaryView(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Expanded _billSummaryView(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bill Summary: ',
            style: GoogleFonts.getFont(
              'Ubuntu',
              textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onBackground),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            height: 40,
            color: Theme.of(context).colorScheme.primary,
            child: Row(
              children: [
                SizedBox(
                  width: 30,
                  child: Center(
                    child: Text(
                      '#',
                      style: GoogleFonts.getFont(
                        'Ubuntu',
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Summary',
                      style: GoogleFonts.getFont(
                        'Ubuntu',
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _dataModel.data!.collectionSheetDetails!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 30,
                                alignment: Alignment.topCenter,
                                child: Text(
                                  '${(index + 1).toString()}.',
                                  style: GoogleFonts.getFont(
                                    'Ubuntu',
                                    textStyle: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      _dataModel
                                          .data!
                                          .collectionSheetDetails![index]
                                          .subCategory
                                          .toString(),
                                      style: GoogleFonts.getFont(
                                        'Ubuntu',
                                        textStyle: const TextStyle(
                                            color: Color(0xff212121),
                                            decoration: TextDecoration.none,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        style:
                                            DefaultTextStyle.of(context).style,
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: 'Issued on: ',
                                              style: GoogleFonts.getFont(
                                                'Ubuntu',
                                                textStyle: const TextStyle(
                                                    color: Color(0xff212121),
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              )),
                                          TextSpan(
                                              text:
                                                  '${_dataModel.data!.collectionSheetDetails![index].entryDate.toString()}.',
                                              style: GoogleFonts.getFont(
                                                'Ubuntu',
                                                textStyle: const TextStyle(
                                                  fontSize: 15,
                                                  decoration:
                                                      TextDecoration.none,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xffFF284C),
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            style: DefaultTextStyle.of(context)
                                                .style,
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: 'Total: ',
                                                  style: GoogleFonts.getFont(
                                                    'Ubuntu',
                                                    textStyle: const TextStyle(
                                                        color:
                                                            Color(0xff212121),
                                                        decoration:
                                                            TextDecoration.none,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  )),
                                              TextSpan(
                                                  text: _dataModel
                                                      .data!
                                                      .collectionSheetDetails![
                                                          index]
                                                      .actualAmount
                                                      .toString(),
                                                  style: GoogleFonts.getFont(
                                                    'Ubuntu',
                                                    textStyle: const TextStyle(
                                                      fontSize: 15,
                                                      decoration:
                                                          TextDecoration.none,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Color(0xffFF284C),
                                                    ),
                                                  )),
                                              TextSpan(
                                                text: 'TK.',
                                                style: GoogleFonts.getFont(
                                                  'Ubuntu',
                                                  textStyle: const TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            color: Theme.of(context)
                                .colorScheme
                                .onBackground
                                .withOpacity(0.4),
                            height: 1,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _paymentSummaryView(BuildContext context) {
    return SizedBox(
      // color: Colors.red,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text('Payment Summary.', style: headerTextStyleBlack),
          ),
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                    text: 'Name: ',
                    style: GoogleFonts.getFont(
                      'Ubuntu',
                      textStyle: const TextStyle(
                          color: Color(0xff212121),
                          decoration: TextDecoration.none,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    )),
                TextSpan(
                    text:
                        '${_dataModel.data!.paymentInfo![0].studentName.toString()}.',
                    style: GoogleFonts.getFont(
                      'Ubuntu',
                      textStyle: const TextStyle(
                        fontSize: 15,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffFF284C),
                      ),
                    )),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                    text: 'Receipt number: ',
                    style: GoogleFonts.getFont(
                      'Ubuntu',
                      textStyle: const TextStyle(
                          color: Color(0xff212121),
                          decoration: TextDecoration.none,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    )),
                TextSpan(
                  text:
                      '${_dataModel.data!.paymentInfo![0].receiptNo.toString()}.',
                  style: GoogleFonts.getFont(
                    'Ubuntu',
                    textStyle: const TextStyle(
                      fontSize: 15,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffFF284C),
                    ),
                  ),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                    text: 'Due: ',
                    style: GoogleFonts.getFont(
                      'Ubuntu',
                      textStyle: const TextStyle(
                          color: Color(0xff212121),
                          decoration: TextDecoration.none,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    )),
                TextSpan(
                  text: _dataModel.data!.paymentInfo![0].totalPaidAmount
                      .toString(),
                  style: GoogleFonts.getFont(
                    'Ubuntu',
                    textStyle: const TextStyle(
                      fontSize: 15,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffFF284C),
                    ),
                  ),
                ),
                TextSpan(
                  text: 'TK.',
                  style: GoogleFonts.getFont(
                    'Ubuntu',
                    textStyle: TextStyle(
                        fontSize: 13,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
